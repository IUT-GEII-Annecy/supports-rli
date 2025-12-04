# Guide Enseignant - TD Protocole DMX512

## Vue d'ensemble du TD

**Durée estimée :** 2 heures
**Niveau :** BUT GEII S3 - Énergie et Maîtrise de l'Énergie (EME)
**Prérequis :** Notions de base sur les transmissions série, systèmes numériques, calculs de débits
**Objectif principal :** Comprendre le protocole DMX512 et dimensionner une installation d'éclairage scénique

## Structure du TD

Le TD est organisé en 3 niveaux de difficulté progressive (14 pages, 20 exercices) :

### Section 0 : Introduction et rappels théoriques (4 pages)

**Contenu :**
- Contexte d'utilisation du DMX512
- Structure détaillée d'une trame DMX
- Couche physique RS-485
- Câblage et connectique
- Adressage DMX
- Fréquence de rafraîchissement

**Pédagogie :** Cette section contient 5 encarts théoriques informatifs (`UPSTIinfor`) qui fournissent toutes les informations nécessaires pour réaliser les exercices de manière autonome. Les étudiants doivent lire attentivement ces rappels avant de commencer les exercices.

### 1. Niveau 1 - Découverte du protocole (3 pages, 6 exercices)

**Objectif :** Comprendre les bases du DMX512

**Exercices :**
- 1.1 : Identifier les composants d'une trame DMX
- 1.2 : Signification des valeurs de canal (projecteur RGB)
- 1.3 : Durée de transmission d'un octet (calculs temporels)
- 1.4 : Durée d'une trame DMX simplifiée (8 canaux)
- 1.5 : Adressage d'appareils simples (4 projecteurs RGB)
- 1.6 : Nombre maximal d'appareils (projecteurs RGBW)

**Concepts clés :** Structure de trame, timing, adressage de base

**Difficulté :** Faible - Questions de cours et calculs guidés

### 2. Niveau 2 - Approfondissement (4 pages, 8 exercices)

**Objectif :** Approfondir les calculs temporels et le dimensionnement réseau

**Exercices :**
- 2.1 : Durée d'une trame DMX complète (512 canaux)
- 2.2 : Optimisation du nombre de canaux transmis
- 2.3 : Caractéristiques du RS-485
- 2.4 : Topologie et câblage DMX
- 2.5 : Installation mixte (dimmers, RGB, lyres)
- 2.6 : Détection d'erreur d'adressage
- 2.7 : Brochage XLR 5 broches
- 2.8 : Compatibilité câbles audio/DMX

**Concepts clés :** Optimisation, RS-485, topologie bus, plan d'adressage complexe, connectique

**Difficulté :** Moyenne - Calculs plus complexes, diagnostic de problèmes

### 3. Niveau 3 - Synthèse et applications (5 pages, 6 exercices)

**Objectif :** Synthétiser les connaissances pour dimensionner une installation complète

**Exercices :**
- 3.1 : Projet d'installation scénique (salle de spectacle)
- 3.2 : Diagnostic et dépannage (4 situations de panne)
- 3.3 : Étude de cas complète - Festival en plein air (7 sous-questions)
- 3.4 : RDM (Remote Device Management) - Extension du DMX
- 3.5 : DMX sur Ethernet (Art-Net, sACN)

**Concepts clés :** Dimensionnement complet, troubleshooting, extensions du protocole

**Difficulté :** Élevée - Cas pratiques de synthèse, recherche documentaire

## Philosophie pédagogique

### Progression scaffoldée (gradual release of responsibility)

Le TD suit une progression en 3 phases :

1. **Phase guidée (Niveau 1)** :
   - Exercices courts avec des questions ciblées
   - Calculs guidés pas à pas
   - Références fréquentes aux encarts théoriques

2. **Phase semi-guidée (Niveau 2)** :
   - Exercices plus longs nécessitant plusieurs étapes
   - Moins de guidage, plus d'autonomie requise
   - Introduction de situations de diagnostic

3. **Phase autonome (Niveau 3)** :
   - Études de cas réalistes et complètes
   - Nécessite de synthétiser plusieurs concepts
   - Situations ouvertes (plusieurs solutions possibles)

### Ressources intégrées

Tous les rappels théoriques nécessaires sont fournis dans le document. Les étudiants n'ont pas besoin de documentation externe pour les niveaux 1 et 2. Le niveau 3 encourage la recherche documentaire (exercices RDM et DMX sur Ethernet).

## Timing suggéré (2 heures)

- **0-10 min :** Introduction au protocole DMX, contexte industriel
- **10-15 min :** Lecture des rappels théoriques (guidée ou autonome selon le niveau)
- **15-45 min :** Niveau 1 (exercices 1.1 à 1.6)
- **45-90 min :** Niveau 2 (exercices 2.1 à 2.8)
- **90-110 min :** Niveau 3 (au moins l'exercice 3.1 ou 3.3)
- **110-120 min :** Synthèse, questions, prolongements

**Note :** Les exercices 3.4 et 3.5 (RDM et DMX/Ethernet) sont optionnels et peuvent servir de prolongement pour les étudiants rapides ou être donnés en travail personnel.

## Points d'attention et difficultés prévisibles

### 1. Calculs temporels (Exercices 1.3, 1.4, 2.1, 2.2)

**Difficulté :** Confusion entre bits et octets, unités (µs, ms, s)

**Recommandation :**
- Insister sur la méthode : $T = \frac{n}{D}$
- Faire un exemple au tableau en convertissant explicitement les unités
- Rappeler qu'un octet DMX = 11 bits (1 start + 8 data + 2 stop)

### 2. Adressage DMX (Exercices 1.5, 2.5, 2.6, 3.3)

**Difficulté :** Confusion entre "adresse de départ" et "canaux utilisés"

**Recommandation :**
- Expliquer clairement : un appareil à 3 canaux configuré à l'adresse 10 écoute les canaux 10, 11 et 12
- Utiliser un schéma visuel au tableau
- Faire vérifier systématiquement qu'il n'y a pas de chevauchement d'adresses

### 3. RS-485 et transmission différentielle (Exercice 2.3)

**Difficulté :** Concept de transmission différentielle abstrait

**Recommandation :**
- Dessiner un schéma montrant Data+ et Data- avec des perturbations
- Expliquer le rejet de mode commun
- Montrer que la différence reste constante même si les deux signaux sont bruités

### 4. Topologie et terminaison (Exercices 2.4, 3.2)

**Difficulté :** Pourquoi pas de dérivation en T ? Pourquoi une résistance de terminaison ?

**Recommandation :**
- Expliquer les réflexions de signal (analogie avec une corde attachée vs libre)
- Montrer que la résistance adapte l'impédance en bout de ligne
- Insister sur la topologie en chaîne (daisy chain)

### 5. Études de cas (Exercices 3.1, 3.3)

**Difficulté :** Exercices longs avec plusieurs sous-questions

**Recommandation :**
- Faire travailler en binôme
- Décomposer l'exercice en étapes
- Valider les résultats intermédiaires avant de continuer

## Corrections et évaluations

### Corrections fournies

Toutes les corrections sont incluses dans le document LaTeX entre les balises `\begin{UPSTIprofOnlyEnv}` et `\end{UPSTIprofOnlyEnv}`. Pour générer une version avec corrections :

1. Modifier le documentVersion dans `td_dmx.tex` : `\documentVersion{P}` (Professeur)
2. Recompiler le document

Pour une version étudiant sans corrections : `\documentVersion{E}` (Étudiant)

### Grille d'évaluation suggérée (si TD noté)

**Niveau 1 (6 exercices) :** 6 points (1 point par exercice)
- Compréhension de base du protocole
- Calculs temporels simples
- Adressage de base

**Niveau 2 (8 exercices) :** 8 points (1 point par exercice)
- Calculs avancés
- Compréhension du RS-485
- Plans d'adressage complexes
- Diagnostic

**Niveau 3 (exercices 3.1 ou 3.3) :** 6 points
- Dimensionnement complet
- Synthèse des concepts
- Qualité du raisonnement

**Total :** 20 points

**Note :** Les exercices 3.2, 3.4 et 3.5 peuvent servir de bonus.

## Variantes et adaptations

### Pour une séance plus courte (1h30)

- Exercices obligatoires : 1.1 à 1.6, 2.1, 2.3, 2.5, 3.1
- Supprimer : 2.2, 2.6, 2.7, 2.8 et les exercices 3.2 à 3.5

### Pour une séance plus longue (3h ou TP)

- Ajouter une partie pratique avec un vrai contrôleur DMX
- Configuration d'appareils réels (projecteurs LED)
- Utilisation d'un logiciel de contrôle (QLC+, Freestyler, etc.)
- Mesure de signaux DMX à l'oscilloscope

### Pour un TD évalué

- Retirer les encarts théoriques et fournir un polycopié de cours séparé
- Limiter l'accès à la documentation
- Chronométrer strictement

## Prolongements possibles

1. **TP pratique :** Configuration et programmation d'une installation DMX réelle
2. **Projet :** Conception complète d'une installation pour un événement fictif
3. **Approfondissement :** Étude détaillée du protocole RDM (bidirectionnel)
4. **Comparaison :** DMX vs DALI (déjà vu en séquence 1) vs autres protocoles (KNX, Modbus, etc.)
5. **Étude technique :** Analyse de la norme ANSI E1.11 (DMX512-A)

## Ressources complémentaires

### Documentation technique

- **Norme :** ANSI E1.11 (DMX512-A) - Entertainment Technology USITT DMX512-A
- **Norme RDM :** ANSI E1.20 - Remote Device Management
- **RS-485 :** TIA/EIA-485-A standard

### Sites web et tutoriels

- [DMX512-Online.com](http://www.dmx512-online.com/) - Ressources techniques
- [ESTA (Entertainment Services & Technology Association)](https://tsp.esta.org/) - Standards et protocoles
- Documentation constructeurs : ETC, MA Lighting, Chamsys, etc.

### Matériel recommandé pour TP

- Contrôleur DMX USB (Enttec Open DMX, DMXKing, etc.)
- Projecteurs LED RGB/RGBA
- Câbles DMX (XLR 3 ou 5 broches)
- Résistances de terminaison 120Ω
- Logiciel de contrôle (QLC+ - gratuit et open source)
- Optionnel : Oscilloscope pour visualiser le signal

## Questions fréquentes des étudiants

**Q : Pourquoi DMX et pas Ethernet directement ?**
R : Le DMX a été développé dans les années 1980 pour être simple, robuste et temps réel. Ethernet n'était pas adapté à l'époque. Aujourd'hui, on utilise effectivement des solutions Ethernet (Art-Net, sACN) pour de grandes installations.

**Q : Pourquoi XLR comme pour l'audio ?**
R : Historiquement, les connecteurs XLR 3 broches étaient déjà utilisés dans le spectacle. Par commodité, on les a réutilisés, mais c'est une source de confusion. La norme recommande maintenant le XLR 5 broches.

**Q : Peut-on mélanger du DMX et de l'audio sur le même câble ?**
R : NON ! Absolument pas. Bien que les connecteurs soient similaires, les signaux sont totalement différents (numérique vs analogique) et les impédances incompatibles.

**Q : Pourquoi 512 canaux exactement ?**
R : C'est une limite liée à la conception initiale du protocole (trame de taille fixe, compromis entre débit et nombre de canaux). Des extensions existent pour gérer plus de canaux (multiples univers DMX).

**Q : Le DMX fonctionne-t-il sans la résistance de terminaison ?**
R : Souvent oui, surtout sur de courtes distances avec peu d'appareils. Mais pour une installation professionnelle fiable, elle est indispensable pour éviter les réflexions de signal.

**Q : Quelle est la différence entre DMX et RDM ?**
R : Le DMX est unidirectionnel (contrôleur → appareils). Le RDM ajoute la bidirectionnalité (contrôleur ↔ appareils) pour la configuration et le diagnostic à distance.

## Conseils pour l'animation

1. **Commencer par le concret :** Montrer des vidéos de spectacles, des photos d'installations DMX
2. **Faire manipuler :** Si possible, avoir un projecteur DMX en démonstration
3. **Analogies :** Comparer le DMX à d'autres bus série connus (RS-232, I²C, etc.)
4. **Insister sur les applications :** Spectacle vivant, clubs, événements, architectural
5. **Valoriser l'aspect professionnel :** C'est un protocole utilisé quotidiennement dans l'industrie

## Liens avec le programme GEII

### Compétences visées

- **Réaliser :** Dimensionner une installation de communication
- **Vérifier :** Diagnostiquer des dysfonctionnements
- **Maintenir :** Comprendre les protocoles pour la maintenance

### Liens avec d'autres modules

- **Électronique numérique :** Liaisons série, niveaux logiques
- **Réseaux :** Topologies, protocoles, couches OSI
- **Automatisme :** Bus de terrain, communication industrielle
- **Projet :** Possibilité d'intégrer du DMX dans un projet d'éclairage intelligent

---

**Bon TD !**

*Document généré pour le module S3 EME - Introduction aux GTB (Gestion Technique du Bâtiment)*
*Séquence 2 : Protocole DMX512*
