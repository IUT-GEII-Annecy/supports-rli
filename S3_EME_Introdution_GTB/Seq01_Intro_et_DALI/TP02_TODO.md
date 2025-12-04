# TP02 - Gestion avancée du protocole DALI : Structures de données et organisation du code

## Statut : À développer

Ce document décrit la planification pédagogique du TP02, qui sera développé après le TP01.

---

## 1. Objectifs pédagogiques du TP02

### Objectifs principaux
- **Maîtriser les types structurés** en programmation automate (CoDeSys/ST)
- **Organiser les données** pour éviter l'éparpillement et améliorer la lisibilité du code
- **Comprendre l'encapsulation** des données liées à un même périphérique
- **Développer une architecture logicielle modulaire** pour des systèmes d'éclairage DALI

### Compétences visées
- Créer et manipuler des structures de données (STRUCT en ST)
- Instancier plusieurs objets à partir d'un même type structuré
- Gérer des tableaux de structures pour des configurations multi-luminaires
- Appliquer les bonnes pratiques de programmation structurée en automatisme

### Savoirs associés
- Types de données composés (STRUCT)
- Accès aux membres d'une structure (notation pointée)
- Initialisation de structures
- Tableaux de structures
- Passage de structures à des blocs fonction

---

## 2. Prérequis (acquis dans TP01)

### Connaissances techniques DALI
- ✓ Architecture matérielle du bus DALI (automate, coupleur, ballasts)
- ✓ Principe de communication maître/esclave
- ✓ Adressage DALI (adresses courtes, groupes)
- ✓ Commandes DALI de base (allumer, éteindre, variation)

### Compétences en programmation CoDeSys
- ✓ Déclaration de variables simples (BOOL, BYTE, INT, REAL)
- ✓ Utilisation du langage CFC (Continuous Function Chart)
- ✓ Utilisation du langage ST (Structured Text)
- ✓ Appel de blocs fonction de bibliothèque (FbDALI_Master, FbDALI_Joblist)
- ✓ Connexion directe d'entrées/sorties de blocs fonction
- ✓ Utilisation de tableaux simples (ARRAY)

### Compétences pratiques
- ✓ Navigation dans l'environnement CoDeSys V2.3
- ✓ Gestion de bibliothèques (DALI_02.lib)
- ✓ Test et débogage sur maquette réelle
- ✓ Détection de fronts montants/descendants

---

## 3. Progression pédagogique proposée

### Phase 1 : Motivation et problématique (15 min)

**Activité de découverte :**
Les étudiants observent un programme du TP01 fonctionnel mais comportant :
- De nombreuses variables éparpillées pour un même luminaire
- Des difficultés à suivre quelles variables sont liées à quel ballast
- Du code redondant pour gérer plusieurs luminaires similaires

**Question problématisante :**
> "Comment organiser les données pour gérer efficacement 10, 20 ou 50 luminaires DALI sans perdre en lisibilité ?"

**Introduction de la notion :**
Présentation de l'analogie avec le monde physique :
- Un ballast DALI = un objet physique avec plusieurs caractéristiques (adresse, intensité, état, etc.)
- Une structure = un "contenant" logiciel qui regroupe toutes ces caractéristiques

---

### Phase 2 : Découverte guidée des structures (Préparation - 30 min)

#### Préparation 1 : Analyse d'un ballast DALI
**Objectif :** Identifier les données à regrouper

**Questions :**
1. Lister toutes les informations nécessaires pour commander un ballast DALI :
   - Adresse DALI du ballast
   - Valeur de commande (intensité lumineuse)
   - Signal de démarrage de la commande
   - État de la commande (en cours, terminée)
   - Numéro du module DALI

2. Pourquoi serait-il pratique de regrouper ces informations ?

**Exemple guidé :**
```
TYPE CEcg : STRUCT
    bAdresseDali    : BYTE;      (* Adresse du ballast sur le bus DALI *)
    bValeurCommande : BYTE;      (* Intensité lumineuse 0-254 *)
    xDemarrer       : BOOL;      (* Déclenchement de l'envoi *)
    xCommandeEnCours: BOOL;      (* Indicateur d'état *)
END_STRUCT
```

#### Préparation 2 : Instanciation de structures
**Objectif :** Comprendre la création d'instances

**Exercice :**
1. Définir trois variables de type CEcg pour les lampes Rouge, Verte et Bleue
2. Dessiner un schéma montrant la relation entre le type CEcg et ses instances

#### Préparation 3 : Accès aux membres
**Objectif :** Maîtriser la notation pointée

**Exercice :**
Compléter les lignes de code ST pour :
1. Définir l'adresse DALI de la lampe rouge à 10
2. Régler l'intensité à 75%
3. Déclencher l'envoi de la commande

```
ecgRouge.__________ := 10;
ecgRouge.__________ := FuDimmValue(75.0);
ecgRouge.__________ := TRUE;
```

---

### Phase 3 : Mise en œuvre guidée (Manipulation - 45 min)

#### Activité 1 : Définition de la structure CEcg
**Guidage maximal**

**Étapes détaillées :**
1. Dans CoDeSys, ouvrir l'onglet "Type de données"
2. Créer un nouveau type nommé `CEcg`
3. Saisir la structure fournie dans la préparation
4. Valider et compiler

**Vérification enseignant :** Point de contrôle obligatoire

#### Activité 2 : Création d'une instance pour la lampe rouge
**Guidage modéré**

**Étapes :**
1. Déclarer une variable `ecgRouge` de type `CEcg`
2. Dans le programme ST, initialiser les valeurs par défaut :
   ```
   ecgRouge.bAdresseDali := 10;
   ```
3. Modifier le bloc `FbDALI_Master` existant pour utiliser les membres de `ecgRouge`

**Aide fournie :**
- Exemple de syntaxe d'appel du bloc fonction avec structure
- Schéma du flux de données

#### Activité 3 : Extension aux trois lampes RGB
**Guidage minimal**

**Consigne :**
Créer trois instances de CEcg (ecgRouge, ecgVert, ecgBleu) et adapter le programme pour gérer les trois lampes avec structures.

**Ressources fournies :**
- Documentation de la structure CEcg
- Liste des adresses DALI (10, 11, 12)

**Auto-évaluation :**
Critères de réussite :
- [ ] Les trois structures sont déclarées
- [ ] Les adresses DALI sont correctement initialisées
- [ ] Le programme compile sans erreur
- [ ] Les lampes répondent aux commandes

---

### Phase 4 : Approfondissement - Structure pour JobList (30 min)

#### Préparation 4 : Analyse du bloc FbDALI_Joblist
**Objectif :** Identifier les paramètres du gestionnaire de commandes

**Questions :**
1. Quelles sont les entrées du bloc FbDALI_Joblist ?
2. Pourquoi créer une structure CDaliJobList ?

**Proposition guidée :**
```
TYPE CDaliJobList : STRUCT
    bModule_750_641     : BYTE;      (* Numéro du module DALI *)
    fbDALI_Joblist      : FbDALI_Joblist; (* Instance du bloc fonction *)
END_STRUCT
```

#### Activité 4 : Implémentation de CDaliJobList
**Guidage modéré**

**Étapes :**
1. Créer le type structuré `CDaliJobList`
2. Déclarer une instance `jobList`
3. Adapter le programme pour utiliser cette structure
4. Tester le fonctionnement

---

### Phase 5 : Application autonome - Tableaux de structures (45 min)

#### Cahier des charges avancé
**Travail en autonomie**

**Objectif :** Gérer un tableau de structures pour simplifier la gestion multi-luminaires

**Contexte :**
Vous devez gérer les 4 plafonniers de la salle (adresses DALI 1 à 4) de manière homogène.

**Consignes :**
1. Créer un tableau `abPlafonniers : ARRAY[1..4] OF CEcg`
2. Initialiser les adresses dans une boucle FOR
3. Implémenter une commande séquentielle d'allumage (effet vague)

**Ressources disponibles :**
- Documentation CoDeSys sur les tableaux
- Exemples de boucles FOR
- Référence rapide de la structure CEcg

**Critères d'évaluation :**
- Utilisation correcte du tableau de structures
- Initialisation dynamique dans une boucle
- Code lisible et commenté
- Respect du cahier des charges fonctionnel

---

## 4. Exercices progressifs envisagés

### Exercice 1 : Structure simple (★☆☆)
**Titre :** "Ma première structure"
- Créer une structure `CLampe` avec adresse et intensité
- Déclarer une instance
- Affecter des valeurs
- Afficher en mode debug

### Exercice 2 : Plusieurs instances (★★☆)
**Titre :** "RGB avec structures"
- Créer trois instances pour R, G, B
- Implémenter une commande simple par bouton
- Comparer avec la version TP01 (sans structure)

### Exercice 3 : Tableau de structures (★★☆)
**Titre :** "Gestion de plafonniers multiples"
- Tableau de 4 structures CEcg
- Initialisation en boucle
- Commande globale (tout allumer/éteindre)

### Exercice 4 : Structures imbriquées (★★★)
**Titre :** "Scène d'éclairage complète"
- Structure CScene contenant :
  - Nom de la scène
  - Tableau de CEcg
  - Durée de transition
- Implémenter deux scènes préenregistrées
- Commutation entre scènes

### Exercice 5 : Projet intégrateur (★★★)
**Titre :** "Système complet de gestion d'éclairage"
- Structure complète du système :
  - Joblist (CDaliJobList)
  - Plafonniers (tableau de CEcg)
  - Lampes RGB (tableau de CEcg)
  - Gestion de scènes
- Interface utilisateur avec boutons/sélecteurs
- Stratégie d'éclairage intelligente (détection présence simulée)

---

## 5. Évaluation des acquis

### Évaluation formative (pendant le TP)
- Vérification des structures créées (syntaxe, complétude)
- Observation de l'utilisation de la notation pointée
- Questions orales sur la compréhension des concepts

### Évaluation sommative (fin de séquence)
**QCM (20% de la note) :**
- Syntaxe des structures
- Avantages de l'encapsulation
- Manipulation de tableaux de structures

**Pratique (80% de la note) :**
- Créer une structure pour un nouveau type de périphérique DALI
- Implémenter un cahier des charges avec structures
- Déboguer un code utilisant des structures

---

## 6. Ressources pédagogiques à développer

### Documents enseignant
- [ ] Fiche de préparation détaillée (2h)
- [ ] Corrigés des préparations
- [ ] Grille d'évaluation formative
- [ ] Barème de l'évaluation sommative

### Documents étudiant
- [ ] Poly de TP (introduction théorique + activités)
- [ ] Annexes techniques (syntaxe STRUCT en ST)
- [ ] Tutoriel CoDeSys : création de types de données
- [ ] Aide-mémoire : structures vs variables simples

### Support matériel
- [ ] Squelette de projet CoDeSys avec structures pré-définies (pour dépannage)
- [ ] Projet de démonstration enseignant
- [ ] Vidéo : déclaration d'une structure dans CoDeSys (5 min)

### Annexes techniques
- [ ] Référence complète : types de données composés en ST
- [ ] Exemples de structures pour différents bus (DALI, Modbus, etc.)
- [ ] Bonnes pratiques de nommage des structures et membres

---

## 7. Déroulement temporel suggéré (séance de 3h)

| Temps | Activité | Type | Description |
|-------|----------|------|-------------|
| 0:00-0:15 | Introduction | Cours magistral | Motivation, problématique, présentation structures |
| 0:15-0:45 | Préparations 1-3 | Travail individuel | Analyse et conception de CEcg |
| 0:45-1:00 | Correction collective | Classe entière | Mise en commun, clarification |
| 1:00-1:45 | Activités 1-2 | TP guidé | Implémentation première structure |
| 1:45-2:00 | **PAUSE** | | |
| 2:00-2:30 | Activité 3 | TP semi-autonome | Extension aux 3 lampes RGB |
| 2:30-3:00 | Activités 4-5 | TP autonome ou projet | CDaliJobList et/ou tableaux |
| 3:00-3:10 | Synthèse | Classe entière | Bilan des acquis, annonce évaluation |

---

## 8. Différenciation pédagogique

### Pour les étudiants en difficulté
- Fournir la structure CEcg complète dès le début
- Proposer un programme partiellement complété à trous
- Tutorat par un pair avancé
- Objectif minimal : une structure fonctionnelle pour une lampe

### Pour les étudiants avancés
- Exercice bonus : structure imbriquée (CEcg dans CScene)
- Défi : créer une structure pour gérer les groupes DALI (16 groupes)
- Mini-projet : interface de configuration des scènes
- Réflexion : comparaison avec la POO (classes en C++/Python)

---

## 9. Liens avec le programme et autres modules

### Compétences du BUT GEII
- **C1 - Concevoir** : Architecture logicielle, modélisation de données
- **C2 - Vérifier** : Tests unitaires, validation de structures
- **C3 - Maintenir** : Code structuré, lisibilité, maintenabilité

### Liens avec autres modules
- **Informatique (S1-S2)** : Structures en C (analogie directe)
- **Automatisme (S2)** : Grafcet et données associées
- **Projet (S3)** : Application dans projet d'intégration
- **Stage (S4)** : Pratiques industrielles de programmation automate

---

## 10. Points de vigilance pédagogique

### Difficultés prévisibles
1. **Confusion type/instance** : Les étudiants confondent parfois le type structuré (CEcg) et ses instances (ecgRouge)
   - **Remédiation** : Utiliser systématiquement l'analogie "recette/gâteau" ou "plan/maison"

2. **Syntaxe de la notation pointée** : Oubli du point ou inversion
   - **Remédiation** : Exercices de complétion nombreux, aide de l'auto-complétion CoDeSys

3. **Initialisation de structures** : Valeurs par défaut non définies
   - **Remédiation** : Check-list systématique d'initialisation

4. **Compréhension de l'intérêt** : "Pourquoi c'est mieux qu'avant ?"
   - **Remédiation** : Exercice de refactoring : comparer code TP01 vs TP02

### Prérequis à vérifier absolument
- [ ] Maîtrise de la déclaration de variables simples
- [ ] Compréhension des tableaux
- [ ] À l'aise avec la syntaxe ST de base

---

## 11. Extensions possibles (TP03 ou projet)

### Vers la Programmation Orientée Objet (POO)
- Introduction des méthodes dans les structures (Function Block en CoDeSys)
- Encapsulation complète : données + traitements
- Héritage simplifié (FB dérivé)

### Vers les architectures complexes
- Gestion de plusieurs bus DALI (structure de structures)
- Intégration avec autres protocoles (DMX, KNX)
- Base de données de configuration en structure

### Vers l'industrie 4.0
- Sérialisation de structures pour communication réseau
- Structure JSON pour interface web
- Historisation de données structurées

---

## 12. Checklist de développement du TP02

### Avant rédaction
- [x] Validation de l'approche pédagogique par l'équipe
- [ ] Test de faisabilité sur maquette (timing, difficultés)
- [ ] Identification des ressources existantes à réutiliser

### Pendant rédaction
- [ ] Rédaction du poly étudiant (préparation + manips)
- [ ] Création des annexes techniques
- [ ] Développement du projet CoDeSys de référence
- [ ] Réalisation des captures d'écran et schémas

### Après rédaction
- [ ] Relecture croisée par un collègue
- [ ] Test complet du TP sur maquette
- [ ] Ajustement des timings
- [ ] Validation par le responsable de module

### Première utilisation
- [ ] Feedback des étudiants (questionnaire)
- [ ] Auto-évaluation enseignant (points à améliorer)
- [ ] Mise à jour du document en conséquence

---

## 13. Notes et remarques

### Historique des modifications
- 2025-11-27 : Création du document de planification (suite à refonte TP01)

### Auteur
Document créé dans le cadre de la restructuration de la séquence DALI S3 EME.

### Contacts
- Responsable module : [À compléter]
- Enseignant référent TP : [À compléter]

---

## Conclusion

Ce TP02 constitue une progression logique et cohérente après le TP01 simplifié. En retirant les structures du TP01, nous permettons aux étudiants de :
1. **Maîtriser d'abord** les bases du protocole DALI et de la programmation CoDeSys
2. **Découvrir ensuite** l'intérêt des structures face à un besoin réel d'organisation
3. **Appliquer enfin** ces concepts dans des projets plus complexes

Cette approche pédagogique respecte le principe de **complexité progressive** et favorise une **compréhension profonde** plutôt qu'une application mécanique de recettes.
