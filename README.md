# L'envers du décor des entreprises libérées

[![Build PDF and EPUB](https://github.com/story-d/envers-du-decor/actions/workflows/build_pdf.yml/badge.svg?branch=main)](https://github.com/story-d/envers-du-decor/actions/workflows/build_pdf.yml)

> ⚠️ **Travail en cours.** Le manuscrit est complet et la chaîne de fabrication
> rodée, mais ni le texte, ni la maquette, ni les fichiers publiés dans les
> [releases](https://github.com/story-d/envers-du-decor/releases) ne sont
> définitifs. Le reste-à-faire est suivi dans les
> [issues](https://github.com/story-d/envers-du-decor/issues).

**Un essai de Kevin Delfour** — écrit par un praticien qui a vécu le modèle des deux côtés : salarié d'une entreprise libérée, puis fondateur et dirigeant d'une société construite sur ces principes. Ce livre explore sans fard l'envers du décor : les défis quotidiens, les échecs documentés, les critiques sérieuses et les conditions réelles de réussite de la libération d'entreprise.

## Télécharger le livre

Chaque push sur `main` produit une [release](https://github.com/story-d/envers-du-decor/releases) contenant les livrables ; chaque push sur une branche de travail produit les deux PDF en artefacts, conservés 14 jours.

| Fichier | Format | Usage |
|---|---|---|
| `envers_du_decor_a5.pdf` | PDF A5, recto-verso | Lecture écran, épreuve de référence |
| `envers_du_decor_poche.pdf` | PDF 108 × 175 mm | Impression à la demande (gabarit Amazon KDP Print) |
| `envers_du_decor.epub` | EPUB 3.2, validé epubcheck (0 erreur) | Liseuses et stores : Kindle, Kobo/Fnac, Google Play Livres, Apple Books |
| `dist/cover_kindle_1600x2560.jpg` | JPEG 1600 × 2560 | Vignette de couverture attendue par Amazon KDP |

## Structure du dépôt

```
main.tex            Édition A5 (point d'entrée LaTeX)
main_poche.tex      Édition poche 108 × 175 mm (même contenu, gabarit KDP)
structure.tex       Maquette : polices, titres, lettrines, en-têtes, liste des sources
parts/              Couvertures, corps du livre partagé, bibliographie
chapters/           Les chapitres (5 parties, 15 chapitres + édito, intro, conclusion)
images/             Aquarelles d'ouverture de chapitres (JPEG q95)
epub/               Métadonnées et feuille de style de l'EPUB
scripts/build_epub.sh   Chaîne de fabrication de l'EPUB « store » (pandoc + post-traitement)
dist/               Couverture Kindle 1600 × 2560, produite au build
```

Documents de travail éditoriaux : [`REVUE_EDITORIALE.md`](REVUE_EDITORIALE.md) (état des lieux et feuille de route), [`CHARTE_DE_VOIX.md`](CHARTE_DE_VOIX.md) (la voix de l'auteur), [`SOURCES.md`](SOURCES.md) (traçabilité de toutes les références citées), [`PUBLICATION.md`](PUBLICATION.md) (checklist ISBN, dépôt légal, diffusion par plateforme), [`QUESTIONS_AUTEUR.md`](QUESTIONS_AUTEUR.md) (matière vécue collectée auprès de l'auteur).

## Construire localement

Prérequis : TeX Live (avec `latexmk`), pandoc, ImageMagick, Java + [epubcheck](https://github.com/w3c/epubcheck).

```bash
# PDF (A5 et poche)
latexmk -pdf main.tex
latexmk -pdf main_poche.tex

# EPUB — ATTENTION : le script modifie images/ et chapters/ dans l'arbre
# de travail ; le lancer sur un checkout jetable ou restaurer via git après
bash scripts/build_epub.sh livre.epub
java -jar epubcheck.jar livre.epub
```

La CI ([`build_pdf.yml`](.github/workflows/build_pdf.yml)) fait exactement cela à chaque push et publie une release depuis `main`. Ce workflow est **le même dans les trois livres de l'organisation** — [`organisations-toxiques`](https://github.com/story-d/organisations-toxiques), `envers-du-decor` et [`un-produit-sans-dev`](https://github.com/story-d/un-produit-sans-dev) — à la valeur de `SLUG` près. Un second workflow, [`cleanup.yml`](.github/workflows/cleanup.yml), fait le ménage chaque lundi : artefacts, journaux d'exécution et releases automatiques au-delà des trois dernières.

## Travaux restants avant publication

Le reste-à-faire (couverture haute définition, ISBN, relectures, dépôt légal…) est suivi dans les [issues](https://github.com/story-d/envers-du-decor/issues) du dépôt.

## Auteur et contact

**Kevin Delfour** — contact : [kevin@delfour.co](mailto:kevin@delfour.co)

© Kevin Delfour. Tous droits réservés. Le texte, les images et la maquette de ce livre ne sont pas libres de droits : aucune reproduction sans autorisation écrite préalable de l'auteur (voir la page de copyright du livre).
