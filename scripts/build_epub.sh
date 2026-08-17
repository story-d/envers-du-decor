#!/usr/bin/env bash
# ============================================================
# Construit l'EPUB de qualité « store » (Kindle/KDP, Kobo/Fnac,
# Google Play Books, Apple Books) à partir des sources LaTeX.
# Utilisé par la CI et en local. Prérequis : pandoc, imagemagick, python3.
# À lancer depuis la racine du dépôt. Produit : $1 (défaut book.epub)
# ATTENTION : modifie images/ et chapters/ dans l'arbre de travail
# (conversion jpg + substitutions) — la CI travaille sur un checkout
# jetable ; en local, lancer sur une copie ou restaurer via git.
# ============================================================
set -euo pipefail
OUT="${1:-book.epub}"

# 1. Source EPUB : le corps du livre sans les couvertures TikZ
#    (la couverture est fournie à pandoc via --epub-cover-image), et sans
#    le bloc titre de la page intérieure (pandoc génère sa propre page de
#    titre — sinon le titre apparaît deux fois)
python3 - <<'PYEOF'
import re
s = open('parts/interior_cover.tex').read()
s = re.sub(r'\\begin\{titlepage\}.*?\\end\{titlepage\}', '', s, flags=re.S)
open('parts/interior_cover_epub_tmp.tex', 'w').write(s)

# structure.tex sans la redéfinition de \footnote (mécanique de la « Liste
# des sources » du PDF) : pandoc ne sait pas évaluer son \ifnum et laisse
# fuir « >0 » dans le texte de chaque note
t = open('structure.tex').read()
t = re.sub(r'\\let\\oldfootnote\\footnote.*?\n\}\n', '', t, flags=re.S)
open('structure_epub_tmp.tex', 'w').write(t)
PYEOF
sed '/parts\/cover.tex/d; /back_cover.tex/d; s|./parts/interior_cover.tex|./parts/interior_cover_epub_tmp.tex|' parts/book_body.tex > parts/book_body_epub_tmp.tex
sed 's|./parts/book_body.tex|./parts/book_body_epub_tmp.tex|; s|\\input{structure.tex}|\\input{structure_epub_tmp.tex}|' main.tex > main_epub_tmp.tex

# 2. Aquarelles : déplacées APRÈS le titre de chapitre/partie, pour qu'elles
#    ouvrent le fichier de leur chapitre (= vrai saut de page sur tous les
#    moteurs, y compris ceux qui ignorent page-break-before)
python3 - <<'PYEOF'
import glob, re
for f in glob.glob('chapters/*.tex'):
    s = open(f).read()
    m = re.match(r'^(\\insertImage\{[^}]*\}\{[^}]*\})\s*\n(.*)$', s, re.S)
    if not m:
        continue
    img, rest = m.group(1), m.group(2)
    # Réinsère l'image juste après la première commande de titre
    def put_after(pattern, text):
        mm = re.search(pattern, text)
        if not mm:
            return None
        i = mm.end()
        return text[:i] + '\n\n' + img + '\n' + text[i:]
    out = put_after(r'\\chapter\{[^}]*\}', rest) or put_after(r'\\part\*\{[^}]*\}', rest)
    if out:
        open(f, 'w').write(out)
PYEOF

# 3. Images : réduites et converties en JPEG (poids ÷9, qualité liseuse)
mogrify -resize '1200x1200>' images/*.png
mogrify -format jpg -quality 85 images/*.png
sed -i 's/\.png}/.jpg}/g' chapters/*.tex parts/*.tex main_epub_tmp.tex

# 4. Conversion
pandoc main_epub_tmp.tex \
  --metadata-file=epub/metadata.yaml \
  --css=epub/epub.css \
  --epub-cover-image=images/cover.jpg \
  --toc --toc-depth=2 \
  --split-level=2 \
  -o "$OUT"

# 5. Post-traitement du paquet :
#    a) retire la PAGE de couverture du flux (métadonnée cover-image
#       conservée : vignette store, couverture auto sur Kindle)
#    b) épure la page de titre (date ISO et mention de droits retirées —
#       elles restent dans les métadonnées OPF et la page de copyright)
#    c) extrait chaque aquarelle d'ouverture dans son PROPRE fichier de
#       spine, placé avant son chapitre : vraie page dédiée sur tous les
#       moteurs, y compris ceux qui ignorent page-break (Play Livres)
python3 - "$OUT" <<'PYEOF'
import re, shutil, sys, zipfile

src = sys.argv[1]
tmp = src + '.tmp'
plates = {}   # nom de fichier chapitre -> (nom planche, contenu planche)

with zipfile.ZipFile(src) as zin:
    names = zin.namelist()
    contents = {n: zin.read(n) for n in names}

# c) extraction des figures d'ouverture des chapitres
for n in sorted(names):
    m = re.match(r'EPUB/text/(ch\d+)\.xhtml$', n)
    if not m:
        continue
    txt = contents[n].decode('utf-8')
    fig = re.search(r'<figure>.*?</figure>\s*', txt, flags=re.S)
    if not fig:
        continue
    head = txt[:txt.find('<body')]
    plate_name = f'EPUB/text/plate_{m.group(1)}.xhtml'
    plate_doc = (head + '<body epub:type="bodymatter">\n<section class="plate">\n'
                 + fig.group(0) + '</section>\n</body>\n</html>\n')
    plates[n] = (plate_name, plate_doc.encode('utf-8'))
    contents[n] = txt.replace(fig.group(0), '', 1).encode('utf-8')

opf = contents['EPUB/content.opf'].decode('utf-8')
# a) couverture hors flux
opf = re.sub(r'<item [^>]*href="text/cover.xhtml"[^>]*/>\s*', '', opf)
opf = re.sub(r'<itemref [^>]*idref="cover_xhtml"[^>]*/>\s*', '', opf)
opf = re.sub(r'<reference [^>]*href="text/cover.xhtml"[^>]*/>\s*', '', opf)
# c) planches dans le manifest et la spine (juste avant leur chapitre)
for ch, (plate_name, _) in plates.items():
    ch_id = re.search(r'<item id="([^"]+)" href="text/%s"' % ch.split('/')[-1], opf).group(1)
    href = plate_name.replace('EPUB/', '')
    pid = 'plate_' + ch_id
    opf = opf.replace('<item id="%s"' % ch_id,
                      '<item id="%s" href="%s" media-type="application/xhtml+xml" />\n<item id="%s"' % (pid, href, ch_id))
    opf = re.sub(r'<itemref\s+idref="%s"\s*/>' % ch_id,
                 '<itemref idref="%s" />\n<itemref idref="%s" />' % (pid, ch_id), opf)
contents['EPUB/content.opf'] = opf.encode('utf-8')

# a) navigation sans la couverture
for nav in ('EPUB/nav.xhtml', 'EPUB/toc.ncx'):
    if nav in contents:
        txt = contents[nav].decode('utf-8')
        txt = re.sub(r'<li>\s*<a href="text/cover.xhtml"[^>]*>.*?</a>\s*</li>\s*', '', txt, flags=re.S)
        txt = re.sub(r'<navPoint[^>]*>\s*<navLabel>.*?</navLabel>\s*<content src="text/cover.xhtml"/>\s*</navPoint>\s*', '', txt, flags=re.S)
        contents[nav] = txt.encode('utf-8')

# b) page de titre épurée
tp = 'EPUB/text/title_page.xhtml'
if tp in contents:
    txt = contents[tp].decode('utf-8')
    txt = re.sub(r'<p class="date">.*?</p>\s*', '', txt, flags=re.S)
    txt = re.sub(r'<div class="rights">.*?</div>\s*', '', txt, flags=re.S)
    contents[tp] = txt.encode('utf-8')

with zipfile.ZipFile(tmp, 'w') as zout:
    zout.writestr('mimetype', contents['mimetype'], compress_type=zipfile.ZIP_STORED)
    for n in names:
        if n == 'mimetype' or n.endswith('text/cover.xhtml'):
            continue
        zout.writestr(n, contents[n], compress_type=zipfile.ZIP_DEFLATED)
    for _, (plate_name, plate_doc) in plates.items():
        zout.writestr(plate_name, plate_doc, compress_type=zipfile.ZIP_DEFLATED)
shutil.move(tmp, src)
print(f'post-traitement : couverture hors flux, page de titre épurée, {len(plates)} planches en pages dédiées')
PYEOF

rm -f main_epub_tmp.tex parts/book_body_epub_tmp.tex parts/interior_cover_epub_tmp.tex structure_epub_tmp.tex
echo "EPUB généré : $OUT"
