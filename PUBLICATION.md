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
- **EPUB** : construit par la CI via pandoc — pipeline audité et corrigé (langue `fr-FR`, couvertures TikZ exclues, images JPEG ≤1200 px : **3,5 Mo** au lieu de 32). À relire une fois sur liseuse réelle (Kindle/Kobo) avant diffusion.
- `content.opf` / fichiers `epub*` à la racine : vestiges d'un EPUB construit à la main, **non utilisés** par la chaîne actuelle (pandoc génère ses propres métadonnées). Peuvent être supprimés ou conservés comme référence.

## 6. Diffusion 🔑 (à décider)

| Canal | Effort | Remarques |
|---|---|---|
| Amazon KDP | Faible | EPUB + couverture ; impression à la demande possible (le PDF A5 convient avec marges à ajuster) |
| Kobo Writing Life / Google Play Books | Faible | EPUB direct |
| Leanpub / Gumroad | Faible | Cohérent avec un lectorat tech ; PDF+EPUB |
| Librinova / BoD | Moyen | Diffusion librairies FR, ISBN inclus |

## 7. Bon à tirer — checklist finale

- [ ] Relecture intégrale de l'auteur (voix, faits, anecdotes personnelles)
- [ ] ISBN réels insérés aux 3 emplacements + code-barres régénéré
- [ ] Relecture professionnelle effectuée
- [ ] Épreuve PDF vérifiée page à page
- [ ] EPUB testé sur au moins une liseuse
- [ ] Dépôt légal effectué
- [ ] `SOURCES.md` : plus aucune ligne ⚠️ non arbitrée
