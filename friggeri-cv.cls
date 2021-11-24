\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

%% \DeclareOption{print}{\def\grayflag{}}
%% \DeclareOption{printbw}{\def\bwflag{}}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption{printbw}{\def\@cv@printbw{}}
\DeclareOption{web}{\def\@cv@web{}}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}
\RequirePackage{changepage}
\RequirePackage{nameref}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{teal}{HTML}{008080}

\definecolor{darkblue}{HTML}{483D8B}
\definecolor{darkgreen}{HTML}{32CD32}
\definecolor{darkred}{HTML}{8B0000}
\definecolor{black}{RGB}{0,0,0}


%%%  % Print black and white
%%%  \ifdefined\bwflag
%%%      \colorlet{green}{black}
%%%      \colorlet{orange}{black}
%%%      \colorlet{purple}{black}
%%%      \colorlet{red}{black}
%%%      \colorlet{blue}{black}
%%%      \colorlet{teal}{black}
%%%      \colorlet{darkblue}{black}
%%%      \colorlet{darkgreen}{black}
%%%      \colorlet{darkred}{black}
%%%      \colorlet{lightgray}{black}
%%%      \colorlet{fillheader}{white}
%%%      \colorlet{header}{black}
%%%      \colorlet{textcolor}{black}
%%%      \colorlet{headercolor}{black}
%%%  \else
%%%  % Print gray
%%%  	\ifdefined\grayflag
%%%  		\colorlet{green}{gray}
%%%  		\colorlet{orange}{gray}
%%%  		\colorlet{purple}{gray}
%%%  		\colorlet{red}{gray}
%%%  		\colorlet{blue}{gray}
%%%  		\colorlet{teal}{gray}
%%%  		\colorlet{darkblue}{gray}
%%%  		\colorlet{darkgreen}{gray}
%%%  		\colorlet{darkred}{gray}
%%%  		\colorlet{fillheader}{white}
%%%  		\colorlet{header}{gray}
%%%  		\colorlet{textcolor}{gray}
%%%  		\colorlet{headercolor}{gray}
%%%  % Print color
%%%  	\else
%%%  		\colorlet{fillheader}{gray}
%%%  		\colorlet{header}{white}
%%%  		\colorlet{textcolor}{gray}
%%%  		\colorlet{headercolor}{gray}
%%%  	\fi
%%%  \fi


\ifdefined\@cv@print
	\colorlet{green}{gray}
	\colorlet{orange}{gray}
	\colorlet{purple}{gray}
	\colorlet{red}{gray}
	\colorlet{blue}{gray}
	\colorlet{teal}{gray}
	\colorlet{darkblue}{gray}
	\colorlet{darkgreen}{gray}
	\colorlet{darkred}{gray}
	\colorlet{fillheader}{white}
	\colorlet{header}{gray}
	\colorlet{textcolor}{gray}
	\colorlet{headercolor}{gray}
\else
	\ifdefined\@cv@printbw
		\colorlet{green}{black}
		\colorlet{orange}{black}
		\colorlet{purple}{black}
		\colorlet{red}{black}
		\colorlet{blue}{black}
		\colorlet{teal}{black}
		\colorlet{darkblue}{black}
		\colorlet{darkgreen}{black}
		\colorlet{darkred}{black}
		\colorlet{lightgray}{black}
		\colorlet{fillheader}{white}
		\colorlet{header}{black}
		\colorlet{textcolor}{black}
		\colorlet{headercolor}{black}
	\else
		\colorlet{fillheader}{gray}
		\colorlet{header}{white}
		\colorlet{textcolor}{gray}
		\colorlet{headercolor}{gray}
	\fi
\fi


%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}
\RequirePackage{fontawesome}

\newfontfamily\bodyfont[Path=./fonts/HelveticaNeue/]{HelveticaNeue}
\newfontfamily\thinfont[Path=./fonts/HelveticaNeue/]{HelveticaNeueUltraLight}
\newfontfamily\headingfont[Path=./fonts/HelveticaNeue/]{HelveticaNeueCondensedBold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor, Path=./fonts/HelveticaNeue/]{HelveticaNeueLight}

\setmonofont[Mapping=tex-text, Color=textcolor, Path=./fonts/HelveticaNeue/]{HelveticaNeueLight}
\setmathfont{XITS Math}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
		teal\or%
        orange\or%
        green\or%
        blue\or%
        red\or%
        purple\or%
        darkblue\or%
        darkgreen\or%
        darkred\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}
  {%
  	\Large\headingfont\color{headercolor}
  	\ifblank{#2}{#1}{#2\space}%
  }
  \par\vspace{.25\parskip}
}

\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[5]{%
  #1&\parbox[t]{11.3cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4
    \begin{adjustwidth}{0.3cm}{}
    {\footnotesize#5}%
    \end{adjustwidth}
    \vspace{\parsep}
  }\\}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \renewcommand{\subsection}[1]{
    \par\vspace{0.2\baselineskip}{\scriptsize\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.6}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose,maxnames=99,sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}
\DeclareFieldFormat[thesis]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{howpublished}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{thesis}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\addcomma\space}%
    \printlist{institution}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareNameFormat{author}{%
  \small\addfontfeature{Color=lightgray}%
  \ifgiveninits
    {\usebibmacro{name:given-family}
      {\namepartfamily}
      {\namepartgiveni}
      {\namepartprefix}
      {\namepartsuffix}}
    {\usebibmacro{name:given-family}
      {\namepartfamily}
      {\namepartgiven}
      {\namepartprefix}
      {\namepartsuffix}}%
  \usebibmacro{name:andothers}}

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
  \end{refsection}
}




%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hide sensitive information in Web mode   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{comment}
\ifdefined\@cv@web
	\excludecomment{sensitive}
\else
	\includecomment{sensitive}
\fi


\RequirePackage{emoji}

