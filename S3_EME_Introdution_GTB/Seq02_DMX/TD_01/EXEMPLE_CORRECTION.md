# Exemple de correction complète - TD DMX512

Voici un exemple représentatif de la qualité des corrections intégrées dans le TD DMX512.

## Exercice 8 : Optimisation du nombre de canaux (Niveau 2)

### Énoncé
Dans la pratique, on ne transmet pas toujours les 512 canaux. Un contrôleur DMX peut optimiser 
la transmission en n'envoyant que les canaux réellement utilisés.

On considère une installation utilisant uniquement les canaux 1 à 24.

**Questions :**
1. Calculer la durée d'une trame DMX optimisée transmettant uniquement 24 canaux.
2. Calculer la fréquence de rafraîchissement maximale pour cette installation.
3. Quel est le gain de temps (en %) par rapport à une trame complète de 512 canaux ?

---

### Correction complète (visible uniquement en version Professeur)

**1)** Durée avec 24 canaux (+ Start Code = 25 octets) :

Calcul de la durée de transmission des octets :
```
T_octets = 25 × 44 μs = 1 100 μs
```

Durée totale de la trame :
```
T_trame = T_BREAK + T_MAB + T_octets
        = 176 μs + 12 μs + 1 100 μs
        = 1 288 μs = 1,288 ms
```

**2)** Fréquence maximale :
```
f_max = 1 / T_trame
      = 1 / (1,288 × 10⁻³)
      ≈ 776,4 Hz
```

**3)** Gain de temps :

Pour calculer le gain, on compare avec la trame complète (22,76 ms) :
```
Gain = (T_complète - T_optimisée) / T_complète × 100%
     = (22,76 - 1,288) / 22,76 × 100%
     ≈ 94,3%
```

**Conclusion pédagogique :**
L'optimisation permet une fréquence de rafraîchissement environ **17 fois plus élevée** !
Ceci explique pourquoi les contrôleurs DMX modernes n'envoient que les canaux utilisés.

---

## Points forts de cette correction

1. **Démarche complète** : Chaque étape du calcul est détaillée
2. **Calculs intermédiaires** : Aucune étape n'est sautée
3. **Unités explicites** : Toutes les conversions sont montrées
4. **Mise en contexte** : Conclusion pédagogique reliant calcul et pratique industrielle
5. **Formatage LaTeX** : Équations alignées, symboles mathématiques corrects
6. **Boîtes de résultats** : Résultats finaux mis en évidence avec `\boxed{}`

---

## Autre exemple : Exercice 12 - Détection d'erreur d'adressage (Niveau 2)

### Énoncé
Un technicien a mal configuré l'adressage d'une installation comportant :
- 1 projecteur RGB à l'adresse 10
- 1 stroboscope (1 canal) à l'adresse 11
- 1 autre projecteur RGB à l'adresse 13

**Questions :**
1. Identifier le problème dans cette configuration.
2. Expliquer les conséquences sur le fonctionnement des appareils.
3. Proposer une correction de l'adressage pour que tous les appareils fonctionnent correctement.

---

### Correction complète

**1)** **Problème identifié :**
Le premier projecteur RGB (adresse 10) utilise les canaux 10, 11 et 12. 
Le stroboscope est configuré sur le canal 11, qui est **déjà utilisé** par le projecteur RGB.
Il y a un **conflit d'adressage**.

**2)** **Conséquences :**
- Le stroboscope et le canal Vert du projecteur RGB écouteront tous deux le canal 11
- Le contrôle du projecteur RGB sera incorrect (impossible de régler le vert indépendamment)
- Le stroboscope s'activera quand on règle le vert du projecteur RGB
- Comportement imprévisible et non conforme aux attentes

**3)** **Correction proposée :**

| Appareil          | Adresse DMX | Canaux utilisés |
|-------------------|-------------|-----------------|
| Projecteur RGB 1  | 10          | 10, 11, 12      |
| Stroboscope       | 13          | 13              |
| Projecteur RGB 2  | 14          | 14, 15, 16      |

**Règle générale :** 
L'adresse du prochain appareil doit toujours être égale à :
```
Adresse suivante = Adresse actuelle + Nombre de canaux utilisés
```

---

## Caractéristiques pédagogiques observées

Les corrections du TD DMX512 respectent systématiquement les principes suivants :

1. **Progressivité** : Du simple au complexe
2. **Explications** : Pas seulement la réponse, mais le raisonnement
3. **Formules** : Toujours présentées avant l'application numérique
4. **Vérifications** : Cohérence avec les valeurs théoriques
5. **Tableaux** : Synthèses visuelles pour les plans d'adressage
6. **Contexte industriel** : Liens avec la pratique professionnelle
7. **Alternatives** : Plusieurs solutions quand pertinent
8. **Mise en garde** : Signalement des erreurs courantes

---

## Compilation

Pour générer le PDF avec corrections :
```bash
cd /home/ubuntu/supports_latex/disciplines/rli/S3_EME_Introdution_GTB/Seq02_DMX/TD_01
# Modifier td_dmx.tex : \documentVersion{P}
latexmk -pdf td_dmx.tex
```

Le document généré affichera :
- Les corrections en **italique**
- Avec une **couleur distinctive** (définie par UPSTIcouleurCorrige)
- Numérotées clairement pour correspondre aux questions
- Formatées professionnellement avec espacement approprié
