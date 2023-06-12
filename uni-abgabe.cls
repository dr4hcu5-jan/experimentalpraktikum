\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uni-abgabe}
[2023/02/01 v1.1]
\LoadClass[a4paper,12pt,leqno]{article}
\RequirePackage{babel}
\RequirePackage[left=1.75cm, right=1.75cm, top=1.75cm, bottom=1.75cm, footskip=15pt, head=28pt, headsep=0.125cm]{geometry}
\RequirePackage{amsmath,amssymb,amsfonts,amsthm}
\RequirePackage{mathtools}
\RequirePackage{fancyhdr}
\RequirePackage{titling}
\RequirePackage{subcaption}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage[bottom,hang,flushmargin]{footmisc}
\RequirePackage[useregional]{datetime2}
\RequirePackage{listings}
\RequirePackage[hypcap=true]{caption}
\RequirePackage{pdfpages}
\RequirePackage{siunitx}
\RequirePackage{esdiff}
\RequirePackage{tcolorbox}
\RequirePackage{xcolor}
\RequirePackage{titleref}
\RequirePackage{parskip}
\RequirePackage{setspace}
\RequirePackage[european,siunitx]{circuitikz}
\RequirePackage[pdfusetitle,hidelinks]{hyperref}
\RequirePackage[nameinlink,capitalize]{cleveref}
\RequirePackage{arrayjobx}
\RequirePackage{multido}
\RequirePackage[compact,newparttoc]{titlesec}
\RequirePackage{tabularx}
\RequirePackage{multicol}
\RequirePackage{enumitem}

\pagestyle{fancy}
\setlength{\headheight}{27.5pt}
\sisetup{group-digits=none, table-alignment=center, locale=DE, uncertainty-mode=separate, output-open-uncertainty = [, output-close-uncertainty = ], uncertainty-separator = \ , space-before-unit=true, use-xspace=true, quantity-product = \ ,}
\setcounter{tocdepth}{3}
\fancyhead[L]{\small\multido{\iP=1+1}{\value{partnerCounter}}{\arrayx{PartnerLastNames}(\iP)\ifnumcomp{\iP}{<}{\value{partnerCounter}}{, }{}}}
\fancyhead[C]{\small\@title \\ \@moduleNumber \ -- \@moduleName}
\fancyhead[R]{\small\@date \\ \@semester}
\titleformat{\part}{\large\scshape}{\thepart}{1em}{}
\titleformat{\section}{\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}{\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\bfseries}{\thesubsubsection}{1em}{}
\titlespacing*{\part}{0pt}{0pt}{*1}
\titlespacing*{\section}{0pt}{*1}{*1}
\titlespacing*{\subsection}{0pt}{*1}{*1}
\titlespacing*{\subsubsection}{0pt}{*1}{*1}
\@addtoreset{section}{part}
\captionsetup{font=footnotesize, format=hang}
\newarray\PartnerFirstNames
\newarray\PartnerLastNames
\newarray\PartnerEmails
\newarray\PartnerMatriculationNumbers
\newcounter{partnerCounter}
\newcommand{\rom}[1]{\uppercase\expandafter{\romannumeral #1\relax}}

\newtcolorbox{messageBox}[3][]
{
  colframe = #2!25,
  colback  = #2!10,
  coltitle = #2!20!black,  
  title    = {#3},
  #1,
}

\DeclareMathOperator{\const}{const.}


\newcommand{\partner}[4]{%%
    \addtocounter{partnerCounter}{1}
    \PartnerFirstNames(\value{partnerCounter})={#1}
    \PartnerLastNames(\value{partnerCounter})={#2}
    \PartnerEmails(\value{partnerCounter})={#3}
    \PartnerMatriculationNumbers(\value{partnerCounter})={#4}
}
\newcommand{\module}[2]{
    \renewcommand{\@moduleNumber}{#1}
    \renewcommand{\@moduleName}{#2}
}
\newcommand{\@moduleNumber}{}
\newcommand{\@moduleName}{}
\newcommand{\semester}[1]{
    \renewcommand{\@semester}{#1}
}
\newcommand{\@semester}{}
\newcommand{\submissiondate}[1]{
    \renewcommand{\@submissiondate}{#1}
}
\newcommand{\@submissiondate}{}
\newcommand{\group}[1]{
    \renewcommand{\@group}{#1}
}
\newcommand{\@group}{}
\newcommand{\team}[1]{
    \renewcommand{\@team}{#1}
}
\newcommand{\@team}{}
\renewcommand{\maketitle}{%
\begin{titlepage}
    \newgeometry{left=1cm,right=1cm,top=1cm,bottom=1cm,footskip=0cm, head=0cm, headsep=0cm}
    \begin{center}
        \singlespacing
        \topskip0pt
        \vspace*{\fill} 
        \vspace{-5.5cm}   
        \begin{figure}[H]
            \centering
            \includegraphics*[height=5.5cm]{uol-logo.png}
        \end{figure}   
        \pagenumbering{Roman}
        {\large \@semester}

        {\Large \@moduleName}
        
        \vspace{3em}

        {\huge \textsc{\@title}}

        \vspace{3em}
        {\LARGE Versuchsdatum: \@date}

        {\Large Abgabedatum: \@submissiondate}

        \vspace{2.5em}
        {\Large Gruppe: \@group \\ Team: \@team}

        \vspace{1em}
        {\large \bfseries Teammitglieder}
        \begin{multicols}{\value{partnerCounter}}
            \setlength\columnsep{1cm}
            \multido{\iP=1+1}{\value{partnerCounter}}{%
            {\large\slshape {\arrayx{PartnerFirstNames}(\iP) \arrayx{PartnerLastNames}(\iP)}}\\
            Matrikelnummer: \arrayx{PartnerMatriculationNumbers}(\iP)\\
            \arrayx{PartnerEmails}(\iP)\\
            \columnbreak
            }
        \end{multicols}
        \vspace*{\fill}
        \thispagestyle{empty}
        \newpage
    \end{center}
    \restoregeometry
    \tableofcontents
\end{titlepage}
\pagenumbering{arabic}
}
\endinput
%%
%% End of file `uol-physics-report.cls'.
