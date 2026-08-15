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

- [ ] **Citation fantôme récurrente** : « Getz, I. (2009). *Liberation management: necessary disorganization for the nanosecond nineties* » — c'est le titre du livre de **Tom Peters (1992)**, attribué ici à Getz, avec des « éditeurs » fantaisistes qui changent selon le chapitre (« Favi S.A. », « Michelin »). Apparaît dans `chapters/chapter_4_1.tex:41`, `chapter_4_2.tex:19` et `:53`, `chapter_4_3.tex:35`. À supprimer ou remplacer par de vraies références.
- [ ] **Témoignages invérifiables** : les « témoignages » d'employés/leaders de FAVI, Poult, Biocoop, La Ruche Qui Dit Oui (`chapter_4_1.tex:37-48`, `chapter_4_2.tex:43-53`, `chapter_4_3.tex:47-57`) sont des citations directes entre guillemets adossées à des notes invérifiables (« Rapport annuel de Biocoop », etc.). Deux options honnêtes : mener de **vraies interviews** (recommandé, voir §5), ou les réécrire en paraphrase clairement sourcée. Publier des verbatims inventés est un risque réputationnel et juridique.
- [ ] **Placeholder oublié** : « l'échec de **l'entreprise X** » (`chapter_5_3.tex:90`) — un cas d'échec jamais nommé ni documenté, au cœur d'un livre censé parler d'échecs.
- [ ] **Sources douteuses du chapitre 5.2** : « Air France a mis en place des programmes d'entreprise libérée », « EM Lyon offre un programme centré sur les entreprises libérées », « Bernard Giraud, fondateur de l'Institut de l'Entreprise Libérée », études « Paris-Dauphine 2017 » et « ESCP Europe 2018 » non identifiables, « Bouvard & Rosier (2021), Les Échos » (`chapter_5_2.tex:61-116`). Chacune est à retrouver ou à couper.
- [ ] **Faits à vérifier** :
  - GitHub 2014 et la note « Reitzig (2019), HBR » (`chapter_1_1.tex:23`) — l'épisode est réel mais le titre/l'année de l'article sont à contrôler.
  - Decathlon « division Oxylane » (`chapter_5_3.tex:70`) — Oxylane était le nom du *groupe* (2008–2014), pas d'une division.
  - Poult « deuxième producteur de biscuits en Europe » (`chapter_5_3.tex:61`) — vérifier (plutôt un des leaders français de la MDD).
  - Buurtzorg « Meilleur employeur des Pays-Bas à quatre reprises » (`chapter_5_3.tex:56`).
  - « Étude de l'Université de Kent » adossée à une note Langfred & Moye (`chapter_4_1.tex:15`) — la note ne correspond pas à l'affirmation.
  - Les multiples éditions/années contradictoires de *Freedom, Inc.* / *Liberté & Cie* (2009, 2011, 2013, 2018 selon les chapitres) — choisir UNE édition de référence.
- [ ] **Uniformiser le référencement** : trois styles cohabitent (note APA seule ; « (Auteur, année) » + note dans les ch. 5.1/5.2 ; références libres). Choisir un style unique. Idem pour l'orthographe **Chrono Flex / ChronoFlex / Chrono-Flex** (3 graphies dans le livre).
- [ ] Construire un **tableau de traçabilité des sources** (une ligne par note : référence, affirmation soutenue, vérifiée O/N, lien). C'est fastidieux mais c'est ce qui séparera ce livre d'un billet de blog.

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

- [ ] **Réécrire l'édito** : c'est la page la plus personnelle et la plus fautive du livre. Coquilles : « ecrire », « parceque », « vis cachés » (→ *vices cachés*), « necessite », « rélféxion », « une forme d'organisation **auquel** » (→ *à laquelle*), ponctuation. C'est aussi le meilleur passage en germe (la rencontre avec les déçus du modèle, `edito.tex:12-14`) : développer cette scène en ouverture narrative.
- [ ] **Supprimer les doublons copiés-collés** : les paragraphes Decathlon et Harley-Davidson sont identiques mot pour mot (`chapter_5_3.tex:72-74` vs `:79-81`). Réécrire Harley-Davidson (qui, au passage, n'est pas une entreprise libérée mais un cas de management participatif — à assumer ou à couper).
- [ ] **Casser le tic « En résumé »** : quasi chaque section se termine par « En résumé / En bref / En somme / En conclusion / En définitif » (sic — *en définitive*). Garder une synthèse par *chapitre*, pas par section.
- [ ] **Harmoniser le gabarit des chapitres** : les ch. 5.1/5.2 ont des sous-sous-sections, des citations en exergue et des synthèses intermédiaires que les autres n'ont pas. Choisir un gabarit unique.
- [ ] **Étoffer les chapitres squelettiques** : `chapter_2_2.tex` (764 mots, aucun exemple nommé) et `chapter_2_1.tex` (816 mots) sont des dissertations abstraites dans la partie qui devrait être la plus incarnée du livre (« les échecs »).
- [ ] Relecture typographique française complète : espaces insécables avant `?!;:`, guillemets « », « mes amies » (`thanks.tex:11` — à confirmer), « inspirate » (`chapter_4_3.tex:1`), accords.

---

## 5. 🟠 Important — Ce qui ferait passer le livre au niveau supérieur

1. **3 à 5 vraies interviews** (salarié déçu, dirigeant « libérateur », consultant, sociologue). Même courtes, elles remplaceraient les témoignages inventés et fourniraient la matière narrative promise. Vous dirigez vous-même une société en modèle libéré (4e de couverture) : votre propre retour d'expérience, honnête, est un atout unique — il est aujourd'hui totalement absent du corpus.
2. **Des chiffres** : taux de turnover avant/après dans les cas cités, études quantitatives existantes (chaires de recherche, DARES, études Malakoff/APEC sur l'autonomie). Le livre ne contient quasiment aucune donnée chiffrée.
3. **Un fil narratif** : ouvrir chaque partie par une scène ou un mini-cas, pas par un résumé du plan (les pages de partie actuelles paraphrasent la table des matières).
4. **Trancher la question du chapitre 2.3** : `parts/corpus.tex:27` référence un `chapter_2_3.tex` commenté qui n'existe pas. Le plan (`main.tex:37-45`) ne prévoit que 2 chapitres en partie II → supprimer la ligne, ou en faire le chapitre « cas d'échec » du §3.

---

## 6. 🟡 Production / technique

- [ ] **Titre mal accordé partout où il est en dur** : « L'envers du décor des **Entreprise libérée** » → « des entreprises libérées » (`main.tex:10`, `content.opf:7`). La 4e de couverture est correcte, elle.
- [ ] **ISBN placeholder** `000-00-000-0000-0` (`parts/back_cover.tex:26`, `content.opf:9`) — obtenir un ISBN réel (AFNIL) avant publication.
- [ ] **Dates à rafraîchir** : `\edition{2023}` (`main.tex:7`), métadonnées EPUB datées 2023 (`content.opf`).
- [ ] **CI obsolète** (`.github/workflows/build_pdf.yml`) : `actions/checkout@v2`, `upload-artifact@v2`, `create-release@v1` et `::set-output` sont dépréciés/désactivés depuis — le build est probablement cassé aujourd'hui. Mettre à jour (checkout@v4, upload-artifact@v4, softprops/action-gh-release) et déclencher aussi le build sur les branches de travail pour valider les PDF en continu.
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
