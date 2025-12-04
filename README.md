# Supports Pédagogiques - RLI (Réseaux Locaux Industriels)

Ressources LaTeX pour l'enseignement RLI (Réseaux Locaux Industriels) - GTB, Domotique, Bus de terrain.

## 📋 Contenu

### S3 - EME Introduction à la GTB

- **Chemin** : `S3_EME_Introdution_GTB/`
- **Sujets** : Gestion Technique du Bâtiment, protocole DALI, bus de terrain, domotique
- **Niveau** : Troisième semestre (STI2D / BUT GEII)

**Organisation** :
```
S3_EME_Introdution_GTB/
├── Seq01_Intro_et_DALI/
│   ├── C01/ (Cours)
│   ├── TP01/ (TP DALI)
│   └── ...
└── Evaluations/
```

**Thématiques abordées** :
- Protocole DALI (Digital Addressable Lighting Interface)
- Bus de terrain industriels
- Gestion Technique du Bâtiment (GTB)
- Supervision et contrôle
- Communication industrielle

## 🚀 Démarrage Rapide

### Prérequis

- **LaTeX** : TeX Live 2023+ ou MiKTeX
- **UPSTI v2.0** : Classe LaTeX installée dans `~/texmf` ([Installation](#installation-upsti))
- **(Optionnel)** [scaffolder-pedagogique](https://github.com/<votre-organisation>/scaffolder-pedagogique) pour générer de nouveaux documents

### Installation UPSTI

UPSTI (Union des Professeurs de Sciences et Techniques Industrielles) est la classe LaTeX utilisée par tous les documents.

```bash
# Installation dans ~/texmf (recommandé)
git clone https://github.com/Rydness/upsti-latex ~/texmf/tex/latex/UPSTI
texhash ~/texmf
```

Vérification :
```bash
kpsewhich UPSTI_Document.cls
# Devrait afficher: /home/<user>/texmf/tex/latex/UPSTI/UPSTI_Document.cls
```

### Compiler un document

**Méthode 1 : Script helper** (recommandé)
```bash
./compile.sh S3_EME_Introdution_GTB/Seq01_Intro_et_DALI/TP01/TP01_DALI.tex
```

**Méthode 2 : pdflatex direct**
```bash
cd S3_EME_Introdution_GTB/Seq01_Intro_et_DALI/TP01/
pdflatex TP01_DALI.tex
pdflatex TP01_DALI.tex  # 2ème passe pour les références
```

**Méthode 3 : latexmk** (compilation automatique)
```bash
cd S3_EME_Introdution_GTB/Seq01_Intro_et_DALI/TP01/
latexmk -pdf TP01_DALI.tex
```

## 🛠️ Utilisation Avancée

### Générer un nouveau document (avec scaffolder)

```bash
# Installation scaffolder (une seule fois)
pip install -e ../scaffolder-pedagogique/

# Générer un nouveau TP
cd S3_EME_Introdution_GTB/Seq01_Intro_et_DALI/
scaffolder t tp "Modbus RTU" --num 02
cd TP02_Modbus_RTU/
pdflatex tp02.tex
```

### Profils UPSTI disponibles

Les documents peuvent utiliser différents profils établissements :

```latex
\documentclass[TP]{UPSTI_Document}
\usepackage{Lycee_STI2D}    % STI2D (par défaut pour RLI)
% \usepackage{BUT_GEII}      % BUT GEII
% \usepackage{IUT_Annecy}    % IUT/BUT
% \usepackage{CPGE_PSI}      % CPGE PSI
```

### Structure type d'un document

```latex
\documentclass[TP]{UPSTI_Document}
\usepackage{Lycee_STI2D}

\titre{Introduction au protocole DALI}
\numero{01}
\classe{STI2D}
\duree{2h}

\begin{document}

% Contenu du TP

\end{document}
```

## 📚 Documentation

- **Guide Utilisateur** : Consultez [docs/GUIDE_UTILISATEUR.md](docs/GUIDE_UTILISATEUR.md) pour les workflows quotidiens
- **UPSTI Documentation** : Référez-vous à `~/texmf/tex/latex/UPSTI/docs/` pour l'API complète

## 🤝 Contribution

### Ajouter un nouveau document

1. Utilisez le scaffolder (recommandé) ou copiez un document existant
2. Respectez les conventions de nommage (`TP##/`, `TD##/`, `C##/`)
3. Utilisez la classe `UPSTI_Document`
4. Testez la compilation avant de commiter

### Conventions de commit

```
Type: Description concise

Types:
- Add: Nouveau contenu (TP, TD, Cours)
- Fix: Correction d'erreur
- Update: Amélioration contenu existant
- Docs: Documentation uniquement

Exemples:
- Add: TP02 sur Modbus RTU
- Fix: Correction schéma TP01 DALI
- Update: Amélioration explications protocole
```

## 📊 Métriques

- **Taille** : ~2.6 Go
- **Public** : Étudiants STI2D, BUT GEII, enseignants

## 🔗 Ressources

- **Scaffolder** : [scaffolder-pedagogique](https://github.com/<votre-organisation>/scaffolder-pedagogique)
- **Supports Informatique** : [supports-informatique](https://github.com/<votre-organisation>/supports-informatique)
- **UPSTI** : [upsti-latex](https://github.com/Rydness/upsti-latex)
- **LaTeX Project** : https://www.latex-project.org/

## 📧 Contact

Équipe RLI - Lycée Technique STI2D / IUT GEII

## 📄 Licence

Contenu pédagogique distribué selon les termes de la licence académique.
Classe LaTeX UPSTI sous licence CC BY-NC-SA 2.0 FR.

---

**Version** : 1.0.0
**Dernière mise à jour** : Novembre 2025
**Source** : Extrait du monorepo supports_latex v2.0
