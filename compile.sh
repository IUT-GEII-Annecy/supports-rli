#!/bin/bash
# Script de compilation simple pour supports-rli
# Usage: ./compile.sh path/to/document.tex

if [ -z "$1" ]; then
    echo "Usage: $0 <fichier.tex>"
    echo "Exemple: $0 S3_EME_Introdution_GTB/Seq01_.../TP01/TP01_DALI.tex"
    exit 1
fi

FILE="$1"
OUT="${2:-pdf}"

if [ ! -f "$FILE" ]; then
    echo "❌ Erreur: Le fichier '$FILE' n'existe pas"
    exit 1
fi

DIR=$(dirname "$FILE")
BASENAME=$(basename "$FILE" .tex)


echo "📄 Compilation: $FILE"
echo "📁 Répertoire: $DIR"
echo "📁 Répertoire de sortie: $OUT"
echo ""

# Aller dans le répertoire du fichier
cd "$DIR" || exit 1
mkdir -p "$OUT"

# Compilation (2 passes pour les références)
echo "🔨 Passe 1/2..."
pdflatex -output-directory="$OUT" -interaction=nonstopmode "$BASENAME.tex" > /dev/null

echo "🔨 Passe 2/2..."
pdflatex -output-directory="$OUT" -interaction=nonstopmode "$BASENAME.tex" 

if [ -f "$OUT/$BASENAME.pdf" ]; then
    echo ""
    echo "✅ PDF généré: $OUT/$BASENAME.pdf"
    ls -lh "$OUT/$BASENAME.pdf"
else
    echo ""
    echo "❌ Erreur: PDF non généré. Vérifiez les erreurs LaTeX ci-dessus."
    exit 1
fi
