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
#    (la couverture est fournie à pandoc via --epub-cover-image)
sed '/parts\/cover.tex/d; /back_cover.tex/d' parts/book_body.tex > parts/book_body_epub_tmp.tex
sed 's|./parts/book_body.tex|./parts/book_body_epub_tmp.tex|' main.tex > main_epub_tmp.tex

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

# 5. Retire la PAGE de couverture du flux de lecture, en conservant la
#    métadonnée cover-image (vignette store ; Kindle et la plupart des
#    liseuses affichent la couverture depuis la métadonnée — l'inclure
#    aussi en première page produirait une « double couverture »)
python3 - "$OUT" <<'PYEOF'
import re, shutil, sys, zipfile

src = sys.argv[1]
tmp = src + '.tmp'
with zipfile.ZipFile(src) as zin, zipfile.ZipFile(tmp, 'w') as zout:
    for item in zin.infolist():
        if item.filename.endswith('text/cover.xhtml'):
            continue  # page supprimée
        data = zin.read(item.filename)
        if item.filename.endswith('content.opf'):
            opf = data.decode('utf-8')
            # retire l'entrée manifest du xhtml de couverture et sa
            # référence dans la spine (l'item cover-image, lui, reste)
            opf = re.sub(r'<item [^>]*href="text/cover.xhtml"[^>]*/>\s*', '', opf)
            opf = re.sub(r'<itemref [^>]*idref="cover_xhtml"[^>]*/>\s*', '', opf)
            opf = re.sub(r'<reference [^>]*href="text/cover.xhtml"[^>]*/>\s*', '', opf)
            data = opf.encode('utf-8')
        if item.filename.endswith('nav.xhtml') or item.filename.endswith('toc.ncx'):
            txt = data.decode('utf-8')
            txt = re.sub(r'<li>\s*<a href="text/cover.xhtml"[^>]*>.*?</a>\s*</li>\s*', '', txt, flags=re.S)
            txt = re.sub(r'<navPoint[^>]*>\s*<navLabel>.*?</navLabel>\s*<content src="text/cover.xhtml"/>\s*</navPoint>\s*', '', txt, flags=re.S)
            data = txt.encode('utf-8')
        if item.filename == 'mimetype':
            zout.writestr(item, data, compress_type=zipfile.ZIP_STORED)
        else:
            zout.writestr(item, data, compress_type=zipfile.ZIP_DEFLATED)
shutil.move(tmp, src)
print('page de couverture retirée du flux (métadonnée conservée)')
PYEOF

rm -f main_epub_tmp.tex parts/book_body_epub_tmp.tex
echo "EPUB généré : $OUT"
