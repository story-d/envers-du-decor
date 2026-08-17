#!/usr/bin/env bash
# ============================================================
# Construit l'EPUB de qualité « store » (Kindle/KDP, Kobo/Fnac,
# Google Play Books, Apple Books) à partir des sources LaTeX.
# Utilisé par la CI et en local. Prérequis : pandoc, imagemagick.
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

# 2. Images : réduites et converties en JPEG (poids ÷9, qualité liseuse)
mogrify -resize '1200x1200>' images/*.png
mogrify -format jpg -quality 85 images/*.png
sed -i 's/\.png}/.jpg}/g' chapters/*.tex parts/*.tex main_epub_tmp.tex

# 3. Conversion
pandoc main_epub_tmp.tex \
  --metadata-file=epub/metadata.yaml \
  --css=epub/epub.css \
  --epub-cover-image=images/cover.jpg \
  --toc --toc-depth=2 \
  --split-level=2 \
  -o "$OUT"

rm -f main_epub_tmp.tex parts/book_body_epub_tmp.tex
echo "EPUB généré : $OUT"
