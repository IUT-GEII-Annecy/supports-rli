# Rapport de Migration TP01 - Bus DALI

## Date de migration
27 novembre 2025

## Résumé
Migration réussie du TP01 sur le bus DALI depuis l'ancienne structure vers la nouvelle architecture modulaire avec profil GEII de UPSTI.

## 1. Fichiers copiés et leur destination

### Images et ressources du TP
Tous les fichiers ont été copiés depuis `/home/ubuntu/supports_IUT_Annecy/03_S3/06_RLI/` vers le répertoire du TP01 :

**Répertoire principal du TP01** (`/home/ubuntu/supports_latex/disciplines/rli/S3_EME_Introdution_GTB/Seq01_Intro_et_DALI/TP01/`) :
- `insererBibliotheque.PNG` - Capture d'écran pour l'insertion de bibliothèque
- `ajoutBibliothequeDALI.PNG` - Capture d'écran pour l'ajout de la bibliothèque DALI
- `declarationAutomatique_menu.PNG` - Menu de déclaration automatique
- `aideSaisie_menu.PNG` - Menu d'aide à la saisie
- `selecteur3boutons.png` - Image du sélecteur 3 boutons

**Sous-répertoire tuto** (`TP01/tuto/`) :
- `iconeModule.PNG` - Icône du module
- `iconeSortie.png` - Icône de sortie
- `blocOk.PNG` - Bloc validé
- `blocComplet.png` - Bloc complet
- `iconeEntree.PNG` - Icône d'entrée
- `blocVierge.png` - Bloc vierge

### Datasheet DALI
Copié depuis `/home/ubuntu/supports_IUT_Annecy/03_S3/06_RLI/figures/[10]DALIDatasheet/` vers `/home/ubuntu/supports_latex/disciplines/rli/S3_EME_Introdution_GTB/figures/[10]DALIDatasheet/` :
- `DALI_02_e.pdf` - Documentation complète du protocole DALI

## 2. Modifications des preambles pour le profil GEII

### preamble_IUT.tex
**Fichier** : `/home/ubuntu/supports_latex/disciplines/preamble_IUT.tex`

**Modifications** :
- Ajout de `\UPSTIloadProfile{BUT_GEII}` pour charger le profil GEII de UPSTI
- Ajout des packages nécessaires : listings, hyperref, fontawesome, multirow, currfile, pdfpages, etc.
- Configuration de epstopdf pour la conversion automatique EPS→PDF
- Définition des couleurs et longueurs personnalisées
- Configuration des annexes en français

**Avantages du profil GEII** :
- En-têtes adaptés avec "BUT" au lieu de "CPGE"
- Nom de classe défini automatiquement à "GEII"
- Couleurs adaptées au contexte technologique (bleu électrique, orange, vert forêt)
- Logos IUT d'Annecy intégrés automatiquement
- Licence Creative Commons configurée

### preamble_Semestre.tex
**Fichier** : `/home/ubuntu/supports_latex/disciplines/preamble_Semestre.tex`

**Modifications** :
- Ajout de `\newcommand{\UPSTIclasse}{S3}` pour définir le semestre

### preamble_RLI.tex (au niveau du module)
**Fichier** : `/home/ubuntu/supports_latex/disciplines/rli/S3_EME_Introdution_GTB/preamble_RLI.tex`

**Modifications** :
- Ajout de `\discipline{RLI}` pour définir la discipline
- Configuration des chemins d'images avec `\graphicspath` pour tous les sous-répertoires de figures
- Ajout de la source des images

### preamble.tex (local au TP01)
**Fichier** : `/home/ubuntu/supports_latex/disciplines/rli/S3_EME_Introdution_GTB/Seq01_Intro_et_DALI/TP01/preamble.tex`

**Modifications** :
- Modification du titre : "Bus DALI -- Premiers programmes"
- Modification du sous-titre : "Introduction au bus DALI"

## 3. Résultat de la compilation

### Compilation réussie
- **Commande** : `latexmk -pdf -interaction=nonstopmode TP01_DALI.tex`
- **Statut** : SUCCESS
- **Fichier généré** : `TP01_DALI.pdf`
- **Taille** : 1.5 MB
- **Nombre de pages** : 17 pages

### Avertissements mineurs (non bloquants)
- Option globale non utilisée : `noCustomPackages` (peut être ignoré)
- Quelques underfull/overfull hbox (problèmes de mise en page mineurs)

### Vérifications effectuées
- Toutes les images sont correctement incluses
- Les annexes PDF (datasheet DALI) sont correctement intégrées
- Les logos IUT d'Annecy et licence CC apparaissent correctement
- La structure du document est préservée avec tous les chapitres

## 4. Structure de la nouvelle architecture

```
/home/ubuntu/supports_latex/disciplines/
├── preamble_IUT.tex                    # Charge le profil GEII, packages communs
├── preamble_Semestre.tex               # Définit le semestre (S3)
└── rli/
    └── S3_EME_Introdution_GTB/
        ├── preamble_RLI.tex            # Configuration discipline et chemins images
        ├── figures/
        │   └── [10]DALIDatasheet/      # Documentation DALI
        │       └── DALI_02_e.pdf
        └── Seq01_Intro_et_DALI/
            └── TP01/
                ├── TP01_DALI.tex       # Document principal
                ├── preamble.tex        # Titres spécifiques au TP
                ├── introduction.tex
                ├── preparation.tex
                ├── manips.tex
                ├── annexes.tex
                ├── *.PNG               # Images interface CodeSys
                └── tuto/               # Images tutoriels
                    └── *.png, *.PNG
```

## 5. Avantages de la nouvelle structure

1. **Profil GEII centralisé** : Toute la configuration GEII (couleurs, logos, en-têtes) est gérée par le profil UPSTI installé dans `~/texmf`

2. **Hiérarchie claire** : Les preambles sont organisés par niveau (IUT → Semestre → Module → TP)

3. **Réutilisabilité** : Les figures DALI sont partagées au niveau du module, accessibles par tous les TPs

4. **Maintenance facilitée** : Les modifications du profil GEII se propagent automatiquement à tous les documents

5. **Cohérence visuelle** : Tous les documents GEII ont la même apparence professionnelle

## 6. Utilisation pour les prochains TPs

Pour créer un nouveau TP dans cette structure :

```latex
\documentclass[TP, noCustomPackages]{UPSTI_Document}
\input{../../../../preamble_IUT.tex}          % Charge profil GEII
\input{../../../preamble_Semestre.tex}        % Définit S3
\input{../../preamble_RLI.tex}                % Configure RLI
\input{preamble.tex}                          % Titres spécifiques

\documentVersion{E}                            % Version étudiant
\newcommand{\UPSTInumeroVersion}{1.0}
\newcommand{\UPSTInumero}{XX}                 % Numéro du TP

\begin{document}
    % Contenu du TP
\end{document}
```

## 7. Notes techniques

### Profil BUT_GEII
- **Emplacement** : `~/texmf/tex/latex/UPSTI/profiles/BUT_GEII.tex`
- **Paramètres configurés** :
  - HeaderLeft : "BUT"
  - HeaderFiliere : "Bachelor Universitaire de Technologie"
  - ClassName : "GEII"
  - Logos : IUT Annecy (CMJN) + Licence CC
  - Couleurs : DodgerBlue, Orange, ForestGreen, Purple

### Packages spéciaux
- `currfile` : Permet d'utiliser `\currfiledir` pour les chemins relatifs
- `epstopdf` : Conversion automatique EPS→PDF
- `pdfpages` : Inclusion de pages PDF (datasheet)
- `appendix` : Gestion des annexes en français

## 8. Problèmes rencontrés et résolutions

### Problème 1 : Images manquantes
**Symptôme** : Erreurs "File not found" pour les images du tutoriel
**Résolution** : Copie manuelle depuis le répertoire source avec gestion des caractères spéciaux dans les noms de répertoires

### Problème 2 : Logos manquants initialement
**Symptôme** : Warnings sur cc_by_nc_sa.png et logo_lycee.png
**Résolution** : Utilisation du profil BUT_GEII qui configure automatiquement les logos depuis ~/texmf

### Problème 3 : Chemins d'images
**Symptôme** : Datasheet DALI non trouvée
**Résolution** : Configuration de `\graphicspath` dans preamble_RLI.tex avec tous les sous-répertoires de figures

## 9. Tests recommandés

- [x] Compilation du TP01 réussie
- [x] Toutes les images affichées
- [x] Datasheet DALI intégrée dans les annexes
- [x] En-têtes et pieds de page corrects
- [x] Logos IUT Annecy visibles
- [ ] Test d'impression papier
- [ ] Vérification de l'accessibilité du PDF

## 10. Conclusion

La migration du TP01 vers la nouvelle architecture modulaire avec le profil GEII de UPSTI a été réalisée avec succès. Le document compile sans erreur et tous les éléments visuels sont présents. La structure est maintenant cohérente et maintenable pour l'ensemble des supports pédagogiques du département GEII.
