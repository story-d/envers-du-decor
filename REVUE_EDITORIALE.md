# Revue éditoriale — « L'envers du décor des entreprises libérées »

*État des lieux au 15 août 2026, établi après lecture intégrale du manuscrit (rôle : éditeur).*

---

## 1. Vue d'ensemble

| Élément | État |
|---|---|
| Structure | Complète : édito, introduction, 5 parties / 13 chapitres, conclusion, remerciements |
| Volume | ≈ 19 400 mots (≈ 80–100 pages en A5) — court pour un essai, acceptable pour un ebook |
| Chaîne de production | LaTeX → PDF + EPUB via GitHub Actions ; couverture, 4e de couverture, liste des notes |
| Dernière activité | Corrections de typos et illustrations (2023) — le projet dort depuis ~3 ans |

**Verdict global : premier jet complet, mais pas publiable en l'état.** Le squelette est bon, le ton est accessible, les illustrations aquarelle donnent une identité. Mais trois problèmes majeurs bloquent la publication : (1) la fiabilité des sources, (2) un écart important entre la promesse du titre/édito et le contenu réel, (3) des finitions inachevées (placeholders, doublons, coquilles). Détail ci-dessous, puis feuille de route priorisée en section 7.

---

## 2. 🔴 Bloquant — Intégrité des sources et des faits

C'est le chantier n°1. Un livre qui se veut *critique* d'un modèle à la mode sera lui-même lu de façon critique : chaque note de bas de page doit être vérifiable.

- [x] **Citation fantôme récurrente** *(corrigé en phase 1)* : « Getz, I. (2009). *Liberation management: necessary disorganization for the nanosecond nineties* » — c'était le titre du livre de **Tom Peters (1992)**, attribué à Getz avec des « éditeurs » fantaisistes (« Favi S.A. », « Michelin »). Les 4 occurrences ont été remplacées par des références réelles ou neutralisées (voir `SOURCES.md`).
- [ ] **Témoignages invérifiables** *(partiellement traité)* : les notes fabriquées (« Rapport annuel de Biocoop », etc.) ont été neutralisées en phase 1 par un marqueur « Témoignage à sourcer ». Reste la phase 2 : mener de **vraies interviews** (recommandé, voir §5) ou réécrire les verbatims en paraphrase sourcée. Ne pas publier en l'état.
- [x] **Placeholder oublié** *(corrigé en phase 1)* : « l'échec de l'entreprise X » (`chapter_5_3.tex`) reformulé en constat générique ; un vrai cas d'échec documenté reste à écrire en phase 2.
- [ ] **Sources douteuses du chapitre 5.2** : « Air France a mis en place des programmes d'entreprise libérée », « EM Lyon offre un programme centré sur les entreprises libérées », « Bernard Giraud, fondateur de l'Institut de l'Entreprise Libérée », études « Paris-Dauphine 2017 » et « ESCP Europe 2018 » non identifiables, « Bouvard & Rosier (2021), Les Échos » (`chapter_5_2.tex:61-116`). Chacune est à retrouver ou à couper.
- [ ] **Faits à vérifier** :
  - GitHub 2014 et la note « Reitzig (2019), HBR » (`chapter_1_1.tex:23`) — l'épisode est réel mais le titre/l'année de l'article sont à contrôler.
  - Decathlon « division Oxylane » (`chapter_5_3.tex:70`) — Oxylane était le nom du *groupe* (2008–2014), pas d'une division.
  - Poult « deuxième producteur de biscuits en Europe » (`chapter_5_3.tex:61`) — vérifier (plutôt un des leaders français de la MDD).
  - Buurtzorg « Meilleur employeur des Pays-Bas à quatre reprises » (`chapter_5_3.tex:56`).
  - « Étude de l'Université de Kent » adossée à une note Langfred & Moye (`chapter_4_1.tex:15`) — la note ne correspond pas à l'affirmation.
  - Les multiples éditions/années contradictoires de *Freedom, Inc.* / *Liberté & Cie* (2009, 2011, 2013, 2018 selon les chapitres) — choisir UNE édition de référence.
- [ ] **Uniformiser le référencement** : trois styles cohabitent (note APA seule ; « (Auteur, année) » + note dans les ch. 5.1/5.2 ; références libres). Choisir un style unique. Idem pour l'orthographe **Chrono Flex / ChronoFlex / Chrono-Flex** (3 graphies dans le livre).
- [x] Construire un **tableau de traçabilité des sources** *(fait en phase 1 : voir `SOURCES.md` — 98 notes inventoriées, statuts ✅/⚠️/❌ et décisions)*. Reste à traiter les lignes ⚠️ et ❌ au fil de la phase 2.

---

## 3. 🔴 Bloquant — Écart promesse / contenu

L'édito promet : « soulever le voile », surmenage, discrimination, **gaslighting**, incapacité à passer à l'échelle, « histoires captivantes, faits surprenants » (`edito.tex:12,22`). Le corpus, lui, livre un survol **prudent et équilibré**, presque bienveillant, qui répète les mêmes idées générales (autonomie vs cohésion, importance de la formation, de la communication, de la vision) de partie en partie. Le lecteur qui achète « l'envers du décor » ne trouvera pas l'envers du décor.

- [ ] **Traiter réellement les sujets annoncés dans l'édito** : surmenage et charge mentale de l'autonomie, discrimination et inégalités (qui parle dans une réunion sans hiérarchie ?), gaslighting / violences douces, limites de scalabilité. Aujourd'hui, aucun chapitre ne les affronte.
- [ ] **Ajouter au moins un chapitre d'enquête sur des échecs documentés et nommés** : Zappos et l'exode post-holacratie, Medium qui abandonne l'holacratie (2016), GitHub, les cas français passés dans la presse. Sources publiques abondantes — c'est le chapitre que le titre promet et qui n'existe pas.
- [ ] **Intégrer la critique académique francophone** du concept (travaux critiques sur « l'entreprise libérée » comme discours managérial : sociologie du travail, articles de la *Revue française de gestion*, ouvrages critiques type *La Comédie (in)humaine* de Bouzou/de Funès ou les analyses de Danièle Linhart). Le livre cite surtout les *promoteurs* du modèle (Getz, Laloux, Zobrist) — pour un livre critique, c'est un contresens de bibliographie.
- [ ] **Dédoublonner les parties I, II et IV** : « l'équilibre autonomie/cohésion », « la nécessité de formation » et « l'importance de la vision » sont traités 3 à 4 fois chacun. Fusionner ou différencier nettement l'angle de chaque occurrence.
- [ ] **Muscler la conclusion** : 293 mots aujourd'hui (`conclusion.tex`), et la section 2 prévue au plan (« pistes de réflexion pour l'avenir ») n'a jamais été écrite (plan dans `main.tex:86-87`). Cible : 1 500–2 500 mots, avec une vraie prise de position de l'auteur — c'est ce qu'on attend après 100 pages.

---

## 4. 🟠 Important — Chantiers d'écriture

- [ ] **Réécrire l'édito** *(coquilles corrigées en phase 1 : « écrire », « parce que », « vices cachés », « nécessite », « réflexion », « à laquelle »)*. Reste la phase 2 : développer la rencontre avec les déçus du modèle (`edito.tex:12-14`) en ouverture narrative.
- [x] **Supprimer les doublons copiés-collés** *(corrigé en phase 1)* : la section Harley-Davidson a été réécrite et assume désormais son statut de cas de gestion participative, distinct de l'entreprise libérée (source réelle à ajouter, voir `SOURCES.md`).
- [ ] **Casser le tic « En résumé »** : quasi chaque section se termine par « En résumé / En bref / En somme / En conclusion / En définitif » (sic — *en définitive*). Garder une synthèse par *chapitre*, pas par section.
- [ ] **Harmoniser le gabarit des chapitres** : les ch. 5.1/5.2 ont des sous-sous-sections, des citations en exergue et des synthèses intermédiaires que les autres n'ont pas. Choisir un gabarit unique.
- [ ] **Étoffer les chapitres squelettiques** : `chapter_2_2.tex` (764 mots, aucun exemple nommé) et `chapter_2_1.tex` (816 mots) sont des dissertations abstraites dans la partie qui devrait être la plus incarnée du livre (« les échecs »).
- [ ] Relecture typographique française complète : espaces insécables avant `?!;:`, guillemets « », « mes amies » (`thanks.tex:11` — à confirmer), « inspirate » (`chapter_4_3.tex:1`), accords.

---

## 5. 🟠 Important — Ce qui ferait passer le livre au niveau supérieur

1. **3 à 5 vraies interviews** (salarié déçu, dirigeant « libérateur », consultant, sociologue). Même courtes, elles remplaceraient les témoignages inventés et fourniraient la matière narrative promise. Vous dirigez vous-même une société en modèle libéré (4e de couverture) : votre propre retour d'expérience, honnête, est un atout unique — il est aujourd'hui totalement absent du corpus.
2. **Des chiffres** : taux de turnover avant/après dans les cas cités, études quantitatives existantes (chaires de recherche, DARES, études Malakoff/APEC sur l'autonomie). Le livre ne contient quasiment aucune donnée chiffrée.
3. **Un fil narratif** : ouvrir chaque partie par une scène ou un mini-cas, pas par un résumé du plan (les pages de partie actuelles paraphrasent la table des matières).
4. ~~Trancher la question du chapitre 2.3~~ *(fait en phase 1 : la ligne morte a été supprimée de `corpus.tex`, conformément au plan qui prévoit 2 chapitres en partie II)*. Le chapitre « cas d'échec » du §3 pourra être réintroduit à cet emplacement en phase 2.

---

## 6. 🟡 Production / technique

- [x] **Titre mal accordé** *(corrigé en phase 1)* : « L'envers du décor des entreprises libérées » dans `main.tex` et `content.opf`.
- [ ] **ISBN placeholder** `000-00-000-0000-0` (`parts/back_cover.tex:26`, `content.opf:9`) — obtenir un ISBN réel (AFNIL) avant publication.
- [ ] **Dates à rafraîchir** : `\edition{2023}` (`main.tex:7`), métadonnées EPUB datées 2023 (`content.opf`).
- [x] **CI obsolète** *(corrigé en phase 1)* : workflow migré vers `checkout@v4`, `latex-action@v3`, `upload-artifact@v4` et `softprops/action-gh-release@v2` (avec le `GITHUB_TOKEN` natif au lieu d'un PAT). Le build tourne désormais aussi sur les branches `claude/**` et à la demande (`workflow_dispatch`) ; la release ne part que depuis `main`. À vérifier au premier passage sur `main`.
- [ ] **Qualité EPUB à auditer** : la conversion `pandoc main.tex` ne rendra correctement ni la couverture TikZ, ni `\insertImage`, ni `\listoffootnotes`. Générer un EPUB et le relire page à page (les métadonnées `rendition: pre-paginated / landscape` dans `content.opf` sont par ailleurs surprenantes pour un livre de texte).
- [ ] Vérifier une compilation locale complète (`latexmk -pdf main.tex`) après chaque phase de réécriture.
- [ ] Ajouter une **bibliographie consolidée** en fin d'ouvrage (générée depuis les notes, une fois celles-ci purgées).

---

## 7. Feuille de route proposée

**Phase 1 — Assainir (le socle, ~1–2 semaines de travail) :**
1. Corriger titre, édito (coquilles), doublons Decathlon/Harley, placeholder « entreprise X », ligne `chapter_2_3` — *aucune décision créative requise, tout est mécanique.*
2. Construire le tableau de traçabilité des sources et purger/remplacer chaque note douteuse (§2). C'est long : le faire chapitre par chapitre.
3. Réparer la CI pour retrouver un PDF compilé à chaque push.

**Phase 2 — Tenir la promesse (le vrai travail d'auteur) :**

> *Réécriture intégrale effectuée (août 2026) : les 13 chapitres, les 5 pages de partie, l'introduction et la conclusion (section « pistes pour l'avenir » ajoutée) sont désormais dans la voix de l'auteur, conformément à `CHARTE_DE_VOIX.md`. Les sources ⚠️/❌ ont été traitées au passage (voir le journal en tête de `SOURCES.md`). Restent à la main de Kevin : les emplacements `% [KEVIN : …]` (anecdotes vécues, interviews à mener), la réécriture narrative de l'édito, et la relecture-validation de l'ensemble.*

4. Écrire le chapitre d'enquête sur les échecs documentés (Zappos, Medium, GitHub, cas français) — il peut prendre la place du `chapter_2_3` fantôme.
5. Écrire les sections manquantes annoncées par l'édito : surmenage, discrimination, gaslighting, scalabilité.
6. Réécrire l'édito et la conclusion (avec la section « pistes pour l'avenir »), en y injectant votre expérience personnelle de dirigeant.
7. Mener 3–5 interviews et remplacer les témoignages inventés.
8. Dédoublonner les parties I/II/IV, harmoniser le gabarit et supprimer les « En résumé ».

**Phase 3 — Produire :**
9. Relecture-correction professionnelle (ou passe outillée : Antidote + relecteur humain).
10. Bibliographie consolidée, ISBN réel, mise à jour des métadonnées, audit EPUB, nouvelle passe sur la 4e de couverture.
11. Bêta-lecteurs (idéalement : un partisan du modèle, un sceptique, un néophyte) avant le bon à tirer.

---

*Un mot d'éditeur pour finir : la matière première est là, le sujet est bon et le créneau (une critique constructive écrite par un praticien convaincu) est excellent — c'est précisément parce que vous êtes un partisan du modèle que votre critique peut être crédible. Mais en l'état, le manuscrit est un exposé prudent qui porte un titre de livre d'enquête. La phase 2 est ce qui fera la différence entre « un ebook de plus sur l'entreprise libérée » et un livre qu'on recommande.*
