\ProvidesClass{UFP}[2012/11/01 v1.0 UFP thesis class]
\newif\ifCU@bookmode
\CU@bookmodetrue

\DeclareOption{report}{\CU@bookmodefalse}
\DeclareOption{book}{\CU@bookmodetrue}
\ProcessOptions\relax%

\ifCU@bookmode
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}%
\ProcessOptions\relax%
\ifx\pdfoutput\undefined%
   \LoadClass[dvips, a4paper]{book}%
\else%
   \LoadClass[pdftex, a4paper]{book}%
\fi%
\else
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}%
\ProcessOptions\relax%
\ifx\pdfoutput\undefined%
  \LoadClass[dvips, a4paper]{report}%
\else%
   \LoadClass[pdftex, a4paper]{report}%
\fi%
\fi

%% codificação para caracteres PT
\usepackage[utf8]{inputenc}
%% usar times new roman font
\usepackage{pslatex}
\usepackage{setspace}
\usepackage{tocbibind}
\usepackage{amssymb}
%\usepackage{graphicx}
\usepackage{fancyhdr}
\usepackage{eucal}
\usepackage[english]{babel}
\usepackage[usenames, dvipsnames]{color}
\usepackage[perpage]{footmisc}

% Harvard Citation Style
\usepackage{natbib}
\setcitestyle{aysep={,}} % needed to fully emulate harvard's "dcu" citation style
\usepackage{har2nat}

\usepackage{ifthen}
\usepackage{ifpdf}

\usepackage[hypcap]{caption}

%\usepackage{subfig} %\let\belowcaptionskip\abovecaptionskip 




% Nomenclature
\usepackage{nomencl}
\makenomenclature
\renewcommand\nomgroup[1]{%
  \ifthenelse{\equal{#1}{A}}{%
   \item[\textbf{Roman Symbols}] }{%             A - Roman
    \ifthenelse{\equal{#1}{G}}{%
     \item[\textbf{Greek Symbols}]}{%             G - Greek
      \ifthenelse{\equal{#1}{R}}{%
        \item[\textbf{Superscripts}]}{%              R - Superscripts
          \ifthenelse{\equal{#1}{S}}{%
           \item[\textbf{Subscripts}]}{{%             S - Subscripts
	    \ifthenelse{\equal{#1}{X}}{%
	     \item[\textbf{Other Symbols}]}{{%    X - Other Symbols
	    \ifthenelse{\equal{#1}{Z}}{%
	     \item[\textbf{Acronyms}]}%              Z - Acronyms
              			{{}}}}}}}}}}

\ifpdf

\usepackage[ pdftex, plainpages = false, pdfpagelabels,
                 pdfpagelayout = OneColumn, % display single page, advancing flips the page - Sasa Tomic
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref,
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = black,
                 citecolor = black,
                 anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref}
    \usepackage[pdftex]{graphicx}
    \DeclareGraphicsExtensions{.png, .jpg, .pdf}

    \pdfcompresslevel=9
    \graphicspath{{ThesisFigs/PNG/}{ThesisFigs/PDF/}{ThesisFigs/}}
\else
    \usepackage[ dvips,
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref,
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = red,
                 anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref}

    %\usepackage{epsfig}
    \usepackage{graphicx}
    \DeclareGraphicsExtensions{.eps, .ps}
    \graphicspath{{ThesisFigs/EPS/}{ThesisFigs/}}
\fi




%A4 settings
\ifpdf
   \pdfpageheight=297mm
   \pdfpagewidth=210mm
\else
   \setlength{\paperheight}{297mm}
   \setlength{\paperwidth}{210mm}
\fi

% https://code.google.com/p/utmthesis/wiki/PageMargin
% Declare margin variables
\newlength{\margin@pagenumber@top}  % between page number and top paper edge
\newlength{\margin@top}             % between text and top paper edge
\newlength{\margin@bottom}          % between text and bottom paper edge
\newlength{\margin@left}            % between text and left paper edge
\newlength{\margin@right}           % between text and right paper edge
%
% Set margin values
\setlength\margin@pagenumber@top {1.25cm}
\setlength\margin@top            {2.5cm}
\setlength\margin@bottom         {2.5cm}
\setlength\margin@left           {3.0cm}
\setlength\margin@right          {3.0cm}

% Set page margins:
%
% left
\setlength\oddsidemargin    {\margin@left}
  \addtolength\oddsidemargin  {-1.0in}% remove the default 1 inch
%
% top
\setlength\topmargin        {\margin@pagenumber@top}
  \addtolength\topmargin      {-1.0in}% remove the default 1 inch
%
% header (where page number appears)
\setlength\headheight       {0.8\baselineskip}% 0.8 = -20% extra line spacing
\setlength\headsep          {\margin@top}
  \addtolength\headsep        {-\margin@pagenumber@top}
  \addtolength\headsep        {-\headheight}
%
% bottom
\setlength\textheight       {\paperheight}
  \addtolength\textheight     {-\margin@top}
  \addtolength\textheight     {-\margin@bottom}
%
% right
\setlength\textwidth        {\paperwidth}
  \addtolength\textwidth      {-\margin@left}
  \addtolength\textwidth      {-\margin@right}


\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\thechapter. #1 }}{}}
\renewcommand{\sectionmark}[1]{}
\fancyhf{}
\fancyhead[RO]{\bfseries\rightmark}
\fancyhead[LE]{\bfseries\leftmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}


\newcommand{\submittedtext}{{Tese submetida ao grau de}}

%
%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your college or department(eg. Trinity, Pembroke, Maths, Physics)
\def\collegeordept#1{\gdef\@collegeordept{#1}}
% The name of your University
\def\university#1{\gdef\@university{#1}}
% Defining the crest
\def\crest#1{\gdef\@crest{#1}}

% These macros define an environment for front matter that is always
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

%define title page layout
\renewcommand{\maketitle}{%
\pagenumbering{roman} % Sasa Tomic
\setcounter{page}{0}  % Sasa Tomic
\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
%  \null\vfill
  \begin{center}
    { \Huge {\bfseries {\@title}} \par}
{\large \vspace*{35mm} {{\@crest} \par} \vspace*{25mm}}
    {{\Large \@author} \par}
{\large \vspace*{1ex}
    {{\@collegeordept} \par}
\vspace*{1ex}
    {{\@university} \par}
\vspace*{25mm}
    {{\submittedtext} \par}
\vspace*{1ex}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}
  \null\vfill
\end{alwayssingle}}

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
  \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{quote} \begin{center}}
{\end{center} \end{quote} \end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{\pagestyle{empty}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Agradecimentos}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}



%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\newenvironment{abstracts} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Resumo}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}


\newenvironment{abstractsEN} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Summary}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

\newenvironment{abstractsFR} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Résumé}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\begin{alwayssingle} \pagestyle{empty}
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@collegeordept} \par}
    {{\@university} \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\end{alwayssingle}}

%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}
{\setcounter{page}{1}
  \renewcommand{\thepage}{\roman{page}}}
{\newpage\renewcommand{\thepage}{\arabic{page}}}
%{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}
