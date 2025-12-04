# TD DMX512 - Protocole de communication pour l'éclairage scénique

## Description

Ce TD permet aux étudiants de GEII (S3 - spécialité EME) de comprendre et dimensionner des installations basées sur le protocole DMX512, standard de communication pour l'éclairage scénique et professionnel.

## Contenu du TD

- **Durée :** 2 heures
- **Niveau :** BUT GEII S3 - Énergie et Maîtrise de l'Énergie
- **Format :** 12 pages, 20 exercices répartis en 3 niveaux de difficulté

### Structure pédagogique

1. **Introduction et rappels théoriques** : 5 encarts informatifs couvrant tous les aspects du DMX512
2. **Niveau 1** : Découverte du protocole (6 exercices)
3. **Niveau 2** : Approfondissement (8 exercices)
4. **Niveau 3** : Synthèse et applications (6 exercices)

### Concepts abordés

- Structure d'une trame DMX512
- Calculs temporels (débits, durées de transmission)
- Couche physique RS-485 (transmission différentielle)
- Câblage et connectique (XLR 3/5 broches)
- Adressage DMX et plan d'installation
- Topologie réseau (bus linéaire, terminaison)
- Dimensionnement d'installations complètes
- Diagnostic de pannes
- Extensions du protocole (RDM, DMX sur Ethernet)

## Organisation des fichiers

```
TD_01/
├── README.md                   # Ce fichier
├── GUIDE_ENSEIGNANT.md         # Guide détaillé pour l'enseignant
├── td_dmx.tex                  # Fichier racine LaTeX
├── main.tex                    # Structure du document (appelle les sections)
├── .latexmkrc                  # Configuration de compilation
├── sources/                    # Sources LaTeX par section
│   ├── information.tex         # Rappels théoriques
│   ├── td_niveau1.tex          # Exercices de niveau 1
│   ├── td_niveau2.tex          # Exercices de niveau 2
│   └── td_niveau3.tex          # Exercices de niveau 3
├── images/                     # Dossier pour les images (si nécessaire)
└── pdf/                        # PDFs générés
    └── td_dmx.pdf              # Document compilé
```

## Compilation

### Prérequis

- Distribution LaTeX complète (TeXLive ou MiKTeX)
- Classe UPSTI_Document (dans le TEXINPUTS configuré)
- Profil BUT_GEII
- Package gitinfo2

### Commandes

```bash
# Compilation simple
cd TD_01
latexmk -pdf td_dmx.tex

# Nettoyage
latexmk -C

# Génération version professeur (avec corrections)
# Modifier \documentVersion{E} en \documentVersion{P} dans td_dmx.tex
# puis recompiler
```

### Versions du document

- **Version E (Étudiant)** : Sans corrections - `\documentVersion{E}`
- **Version P (Professeur)** : Avec corrections - `\documentVersion{P}`

## Utilisation pédagogique

### Public cible

- BUT GEII Semestre 3
- Spécialité Énergie et Maîtrise de l'Énergie (EME)
- Module : Introduction aux GTB (Gestion Technique du Bâtiment)

### Prérequis étudiants

- Notions de base sur les transmissions série
- Systèmes numériques (binaire, hexadécimal)
- Calculs de débits et de temps
- Bases de l'électronique numérique

### Objectifs pédagogiques

À l'issue de ce TD, l'étudiant sera capable de :

1. Expliquer le principe de fonctionnement du protocole DMX512
2. Décrire la structure d'une trame DMX et calculer ses caractéristiques temporelles
3. Dimensionner le câblage d'une installation DMX (type de câble, connectique, terminaison)
4. Établir un plan d'adressage pour une installation multi-appareils
5. Diagnostiquer des problèmes simples sur une installation DMX
6. Identifier les limites du protocole et les extensions possibles (RDM, Art-Net)

### Recommandations d'animation

Consulter le fichier `GUIDE_ENSEIGNANT.md` pour :

- Le timing détaillé suggéré (2h)
- Les points d'attention et difficultés prévisibles
- Les conseils d'animation
- Une grille d'évaluation (si TD noté)
- Des variantes pour adapter la durée
- Des suggestions de prolongements

## Ressources complémentaires

### Documentation technique

- Norme ANSI E1.11 (DMX512-A)
- Norme ANSI E1.20 (RDM)
- Standard RS-485 (TIA/EIA-485-A)

### Logiciels

- **QLC+** (gratuit) : Logiciel de contrôle DMX open source
- **Freestyler DMX** : Alternative gratuite
- **Enttec** : Pilotes pour interfaces DMX USB

### Matériel pour TP pratique (optionnel)

- Contrôleur DMX USB
- Projecteurs LED RGB/RGBA
- Câbles DMX (XLR 3 ou 5 broches)
- Résistances de terminaison 120Ω

## Auteur et licence

**Module :** S3 EME - Introduction aux GTB
**Séquence :** 2 - Protocole DMX512
**Discipline :** Réseaux spécialisés EME

Ce document fait partie du projet pédagogique GEII.

## Historique des versions

- **v1.0** (2025-11-24) : Création initiale du TD
  - 20 exercices répartis en 3 niveaux
  - 5 encarts théoriques complets
  - Corrections intégrées pour version professeur
  - Guide enseignant détaillé

## Support

Pour toute question ou suggestion d'amélioration concernant ce TD, consulter le guide enseignant ou contacter l'équipe pédagogique du module.
