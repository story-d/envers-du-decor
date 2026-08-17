# Dossier de publication

*Checklist pour passer du manuscrit au livre publié. Les étapes marquées 🔑 ne peuvent être faites que par l'auteur.*

## 1. ISBN 🔑

Le livre contient actuellement un **placeholder** `000-00-000-0000-0` à trois endroits, à remplacer par le vrai numéro :

- `parts/interior_cover.tex` (page de copyright)
- `parts/back_cover.tex` (4e de couverture + code-barres EAN, ligne `\EANBarcode`)
- `content.opf` (`dc:identifier`)

**Obtention** : gratuite en France auprès de l'**AFNIL** (afnil.org) — compter ~15 jours. Demander un lot (10 numéros) : il faut un ISBN distinct **par format** (papier, PDF, EPUB). Si publication via Amazon KDP uniquement, KDP fournit un ASIN/ISBN gratuit mais lié à Amazon — l'ISBN AFNIL reste préférable pour exister hors Amazon.

## 2. Dépôt légal 🔑

Obligatoire en France pour toute publication, y compris numérique : dépôt à la **BnF** (depot-legal.bnf.fr). Pour un livre numérique diffusé en ligne, le dépôt dématérialisé suffit. À faire au moment de la publication, pas avant.

## 3. Mentions légales à compléter

- [ ] `parts/interior_cover.tex` : l'année © est désormais pilotée par `\edition` (2026) — vérifier avant le bon à tirer.
- [ ] Mention de l'éditeur : la 4e de couverture indique « Edition Le Vilain Petit Dev » — confirmer ce nom (et corriger en « Éditions » si retenu).
- [ ] La mention Midjourney (images) est en place — vérifier qu'elle correspond aux conditions Midjourney en vigueur à la date de publication.

## 4. Relecture professionnelle 🔑 (recommandée)

Le manuscrit a eu une passe complète d'orthographe/typographie, mais aucun texte ne devrait partir à l'impression sans un œil humain professionnel (correcteur indépendant : compter 3–6 €/1000 mots ; le livre fait ~17 000 mots ≈ 60–100 €). Alternative minimale : passe Antidote + deux bêta-lecteurs (idéalement un partisan du modèle, un sceptique).

## 5. Production (état actuel)

- **PDF** : construit par la CI (`latex-action`, A5). À vérifier sur épreuve avant impression : coupures de pages, rendu de la « Liste des sources » (98 notes) et de la bibliographie.
- **EPUB** : construit par `scripts/build_epub.sh` (CI et local) — métadonnées complètes (`epub/metadata.yaml` : description, éditeur, sujets/BISAC), feuille de style de lecture (`epub/epub.css` : alinéas, lettrines, compatible thèmes sombres), découpage par chapitre, images JPEG allégées (3,6 Mo), **validé epubcheck 0 erreur / 0 warning (EPUB 3.2)**. À relire une fois sur liseuse réelle (Kindle Previewer + Kobo) avant diffusion.
- **Édition poche** : `main_poche.tex` (108 × 175 mm, corps 10 pt, 168 pages, sans couvertures) — gabarit prêt pour KDP Print.
- `content.opf` / fichiers `epub*` à la racine : vestiges d'un EPUB construit à la main, **non utilisés** par la chaîne actuelle (pandoc génère ses propres métadonnées). Peuvent être supprimés ou conservés comme référence.

## 6. Diffusion 🔑 — mode d'emploi par plateforme

Les livrables sont produits par la CI à chaque push : `..._a5.pdf` (édition A5), `..._poche.pdf` (gabarit d'impression 108 × 175 mm) et `...epub` (validé epubcheck, 0 erreur, EPUB 3.2).

### Ebook

| Plateforme | Fichier | Spécificités |
|---|---|---|
| **Amazon KDP** (Kindle) | EPUB | Accepte l'EPUB directement. Couverture marketing à uploader séparément : ratio 1,6:1, idéal 1600 × 2560 px (`dist/cover_kindle_1600x2560.jpg` — ⚠️ agrandie depuis un original 972 px : régénérer l'aquarelle en haute résolution avant mise en vente). Vérifier le rendu avec Kindle Previewer. ISBN non requis pour le Kindle (ASIN attribué). |
| **Kobo Writing Life** (→ Fnac) | EPUB | La Fnac est servie via Kobo. EPUB + couverture JPG ≥ 1400 px de large. ISBN recommandé. |
| **Google Play Books** | EPUB | Partner Center ; EPUB + couverture. ISBN recommandé (sinon identifiant Google). |
| **Apple Books** | EPUB | Via iTunes Connect ou un agrégateur. ISBN requis. |
| Agrégateur (Bookwire, Vivlio, Immatériel…) | EPUB | Une seule livraison pour tous les stores + bibliothèques ; commission en échange. Option si multiplier les back-offices lasse. |

### Impression à la demande (livre de poche)

| Plateforme | Fichier | Spécificités |
|---|---|---|
| **Amazon KDP Print** | `..._poche.pdf` | Format 108 × 175 mm = trim standard KDP 4,25 × 6,87 po. Intérieur SANS couverture (déjà le cas du gabarit poche). Couverture à part : gabarit KDP calculé selon la pagination (168 p. ≈ dos de 10 mm en crème 55 lb) — utiliser le « Cover Calculator » KDP. ISBN : gratuit via KDP ou le vôtre (AFNIL). |
| BoD / Lulu | `..._poche.pdf` | Mêmes principes ; BoD diffuse en librairies FR. |

Marges du gabarit poche : intérieure 17 mm (> 9,6 mm exigés par KDP jusqu'à 300 p.), extérieures 12 mm (> 6,3 mm) — conformes, sans fond perdu nécessaire (aucun élément ne touche les bords).

## 7. Bon à tirer — checklist finale

- [ ] Relecture intégrale de l'auteur (voix, faits, anecdotes personnelles)
- [ ] ISBN réels insérés aux 3 emplacements + code-barres régénéré
- [ ] Relecture professionnelle effectuée
- [ ] Épreuve PDF vérifiée page à page
- [ ] EPUB testé sur au moins une liseuse
- [ ] Dépôt légal effectué
- [ ] `SOURCES.md` : plus aucune ligne ⚠️ non arbitrée
