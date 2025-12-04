# TD DMX512 - Résumé des corrections

## État du document

Le TD DMX512 contient **18 exercices répartis sur 3 niveaux**, avec **toutes les corrections complètes et détaillées** déjà intégrées.

## Répartition des exercices et corrections

### Niveau 1 - Découverte du protocole DMX512
**6 exercices avec corrections complètes :**

1. **Identifier les composants d'une trame**
   - Structure de la trame DMX (BREAK, MAB, Start Code, canaux)
   - Plage de valeurs (0-255)
   - Maximum de 512 canaux

2. **Signification des valeurs de canal**
   - Correspondance valeur/intensité
   - Exemples RGB (rouge pur, blanc, jaune, éteint)

3. **Durée de transmission d'un octet**
   - Calculs avec débit de 250 kbits/s
   - Durée d'un bit (4 µs) et d'un octet (44 µs)

4. **Durée d'une trame DMX simplifiée**
   - Calcul pour 8 canaux
   - Durée totale incluant BREAK et MAB

5. **Adressage d'appareils simples**
   - Plan d'adressage pour 4 projecteurs RGB
   - Tableau d'adressage complet

6. **Nombre maximal d'appareils**
   - Calcul pour projecteurs RGBW (4 canaux)
   - 128 appareils maximum sur 512 canaux

### Niveau 2 - Approfondissement
**7 exercices avec corrections complètes :**

1. **Durée d'une trame DMX complète**
   - Calcul pour 512 canaux complets (22,76 ms)
   - Fréquence de rafraîchissement (≈44 Hz)

2. **Optimisation du nombre de canaux**
   - Comparaison 24 canaux vs 512 canaux
   - Gain de temps de 94,3% (fréquence x17)

3. **Caractéristiques du RS-485**
   - Transmission différentielle
   - Immunité au bruit
   - Distance max (300-400 m)
   - Impédance caractéristique (120 Ω)

4. **Topologie et câblage**
   - Topologie chaîne (daisy chain)
   - Limitation à 32 récepteurs
   - Solutions (splitter DMX)

5. **Installation mixte**
   - Plan d'adressage complexe (dimmers, RGB, lyres)
   - Calcul total : 50 canaux

6. **Détection d'erreur d'adressage**
   - Identification de conflits d'adresses
   - Conséquences et solutions

7. **Brochage XLR**
   - Brochage XLR 5 broches
   - Différences XLR 3 vs XLR 5
   - Compatibilité câbles audio

### Niveau 3 - Synthèse et applications
**5 exercices avec corrections complètes :**

1. **Projet d'installation scénique**
   - Dimensionnement complet (384 canaux)
   - Plan d'adressage détaillé par type d'appareil
   - Solutions pour longues distances (450 m)

2. **Pannes courantes - Analyse**
   - 4 situations de diagnostic :
     * Câble coupé/appareil défectueux
     * Absence de terminaison
     * Dépassement limite 32 récepteurs
     * Erreur d'adressage
   - Solutions détaillées pour chaque cas

3. **Étude de cas : Festival en plein air**
   - Installation complète (228 canaux)
   - Répartition sur 2 univers optimisée
   - Plans d'adressage détaillés
   - Calculs temporels (durées de trames, fréquences)
   - Schéma de câblage

4. **RDM (Remote Device Management)**
   - Protocole RDM (ANSI E1.20)
   - Avantages (configuration à distance, diagnostic)
   - Start Code RDM (0xCC)
   - Rétrocompatibilité

5. **DMX sur Ethernet (optionnel)**
   - Protocoles Art-Net et sACN
   - Avantages (longues distances, multi-univers)
   - Notion de nœud DMX

## Compilation

### Version Professeur (avec corrections)
```bash
# Dans td_dmx.tex : \documentVersion{P}
cd /home/ubuntu/supports_latex/disciplines/rli/S3_EME_Introdution_GTB/Seq02_DMX/TD_01
latexmk -pdf td_dmx.tex
# Résultat : 20 pages avec corrections en couleur
```

### Version Étudiant (sans corrections)
```bash
# Dans td_dmx.tex : \documentVersion{E}
cd /home/ubuntu/supports_latex/disciplines/rli/S3_EME_Introdution_GTB/Seq02_DMX/TD_01
latexmk -pdf td_dmx.tex
# Résultat : 12 pages sans corrections
```

## Fichiers modifiés

- `/home/ubuntu/supports_latex/disciplines/rli/S3_EME_Introdution_GTB/Seq02_DMX/TD_01/td_dmx.tex`
  * Paramètre `\documentVersion{P}` pour version professeur

## Qualité des corrections

Toutes les corrections incluent :
- ✓ Explications détaillées et pédagogiques
- ✓ Démarches complètes avec calculs intermédiaires
- ✓ Formules mathématiques en LaTeX
- ✓ Tableaux récapitulatifs
- ✓ Justifications des réponses
- ✓ Mise en contexte technique

## Exemple de correction typique

**Exercice : Durée d'une trame DMX complète**

La correction comprend :
1. Calcul du nombre d'octets (513 = 1 Start Code + 512 canaux)
2. Calcul de la durée de transmission des octets (513 × 44 µs = 22 572 µs)
3. Ajout de BREAK et MAB pour durée totale (22 760 µs = 22,76 ms)
4. Calcul de la fréquence maximale (f = 1/T ≈ 43,9 Hz)
5. Vérification de cohérence avec les valeurs théoriques

Toutes les corrections suivent ce niveau de détail et de rigueur pédagogique.
