# Structure LaTeX des corrections - TD DMX512

## Syntaxe utilisée

Toutes les corrections utilisent la structure suivante dans les fichiers sources :

```latex
\begin{UPSTIexercice}{Titre de l'exercice}
    % Énoncé de l'exercice
    \UPSTIquestion{Question 1}
    \UPSTIquestion{Question 2}
    % etc.
\end{UPSTIexercice}

\begin{UPSTIprofOnlyEnv}
    \begin{UPSTIcorrectionP}{Titre de l'exercice}
        \textbf{1)} Réponse à la question 1 avec explications détaillées
        
        \textbf{2)} Réponse à la question 2
        % Formules mathématiques en LaTeX
        \[
        f_{\text{max}} = \frac{1}{T_{\text{trame}}}
        \]
    \end{UPSTIcorrectionP}
\end{UPSTIprofOnlyEnv}
```

## Environnements utilisés

### UPSTIprofOnlyEnv
- Conteneur principal pour tout contenu réservé au professeur
- Contrôlé par `\documentVersion{P}` ou `\documentVersion{E}`
- En version E (Étudiant) : tout le contenu est masqué
- En version P (Professeur) : contenu affiché en italique avec couleur spéciale

### UPSTIcorrectionP
- Environnement spécifique pour les corrections
- Prend en paramètre le titre de l'exercice
- Doit être imbriqué dans `UPSTIprofOnlyEnv`
- Mise en forme automatique (couleur, espacement)

## Exemple complet de correction

Voici un exemple réel tiré du fichier `sources/td_niveau2.tex` :

```latex
\begin{UPSTIexercice}{Durée d'une trame DMX complète}
On considère une trame DMX transmettant les \textbf{512 canaux} complets.

Valeurs à utiliser :
\begin{itemize}
    \item BREAK : 176 $\mu$s
    \item MAB : 12 $\mu$s
    \item Durée d'un octet : 44 $\mu$s
\end{itemize}

\UPSTIquestion{Calculer la durée totale de transmission des octets (Start Code + 512 canaux).}
\UPSTIquestion{Calculer la durée totale de la trame complète.}
\UPSTIquestion{Exprimer ce résultat en millisecondes avec 2 chiffres après la virgule.}
\UPSTIquestion{En déduire la fréquence maximale théorique de rafraîchissement (en Hz) pour une trame de 512 canaux.}
\UPSTIquestion{Comparer ce résultat avec la fréquence indiquée dans l'encart page~\pageref{info:refresh}.}
\end{UPSTIexercice}

\begin{UPSTIprofOnlyEnv}
    \begin{UPSTIcorrectionP}{Durée d'une trame DMX complète}
        \textbf{1)} Nombre d'octets : 1 Start Code + 512 canaux = 513 octets
        \[
        T_{\text{octets}} = 513 \times 44~\mu\text{s} = 22\,572~\mu\text{s}
        \]

        \textbf{2)} Durée totale :
        \begin{align*}
        T_{\text{trame}} &= T_{\text{BREAK}} + T_{\text{MAB}} + T_{\text{octets}} \\
        &= 176 + 12 + 22\,572 \\
        &= 22\,760~\mu\text{s}
        \end{align*}

        \textbf{3)} En millisecondes : $T_{\text{trame}} = \boxed{22{,}76~\text{ms}}$

        \textbf{4)} Fréquence maximale :
        \[
        f_{\text{max}} = \frac{1}{T_{\text{trame}}} = \frac{1}{22{,}76 \times 10^{-3}} \approx \boxed{43{,}9~\text{Hz}}
        \]

        \textbf{5)} Ce résultat est cohérent avec la valeur de $\approx$ 44 Hz indiquée page~\pageref{info:refresh}.
    \end{UPSTIcorrectionP}
\end{UPSTIprofOnlyEnv}
```

## Éléments pédagogiques utilisés

### 1. Numérotation claire
Chaque réponse commence par `\textbf{1)}`, `\textbf{2)}`, etc.

### 2. Formules mathématiques LaTeX
```latex
\[
f_{\text{max}} = \frac{1}{T_{\text{trame}}}
\]
```

### 3. Alignement des équations
```latex
\begin{align*}
T_{\text{trame}} &= T_{\text{BREAK}} + T_{\text{MAB}} + T_{\text{octets}} \\
&= 176 + 12 + 22\,572 \\
&= 22\,760~\mu\text{s}
\end{align*}
```

### 4. Mise en valeur des résultats
```latex
$\boxed{22{,}76~\text{ms}}$
```

### 5. Tableaux récapitulatifs
```latex
\begin{center}
\begin{tabular}{|c|c|c|c|}
\hline
\textbf{Appareil} & \textbf{Adresse} & \textbf{Canaux} \\
\hline
PAR 1 & 1 & 1-4 \\
\hline
\end{tabular}
\end{center}
```

### 6. Listes à puces pour les explications
```latex
\begin{itemize}
    \item Point 1
    \item Point 2
\end{itemize}
```

### 7. Mise en contexte technique
Les corrections incluent des justifications, des rappels de concepts et des liens avec la réalité industrielle.

## Configuration du document

Dans le fichier principal `td_dmx.tex` :

```latex
\documentclass[td]{UPSTI_Document}
\UPSTIloadProfile{BUT_GEII}

% Pour version PROFESSEUR (avec corrections)
\documentVersion{P}

% Pour version ÉTUDIANT (sans corrections)
% \documentVersion{E}
```

## Résultat de compilation

- **Version P** : 20 pages avec corrections en couleur
- **Version E** : 12 pages sans corrections

La différence de 8 pages correspond exactement aux corrections qui sont conditionnellement affichées.
