\raggedright
\parskip=.8ex
\advance\oddsidemargin-.5cm
\advance\textwidth1cm
\addtolength{\textheight}{2cm}
\addtolength{\topmargin}{-1.5cm}

\LoadClass{ltxguide}

%\RequirePackage{hypdoc}
%\RequirePackage[
	%loadHyperref=false,
	%createIndexEntries=false
%]{doctools}
\RequirePackage[colorlinks=true]{hyperref}
\RequirePackage{xparse}
\RequirePackage{xcolor}
\RequirePackage{framed}
\RequirePackage{showexpl}

\definecolor{red}    {HTML}{BF4C4C}
\definecolor{green}  {HTML}{4CBF67}
\definecolor{orange} {HTML}{BF8D4C}
\definecolor{cyan}   {HTML}{4CA0BF}
\definecolor{magenta}{HTML}{594CBF}
\definecolor{light}  {HTML}{F5F5ED}

\definecolor{notes}{named}{red}
\definecolor{shadecolor}{named}{light}

\renewcommand{\SX@explpreset}{
	language=[LaTeX]TeX,
	basicstyle=\ttfamily,
	numbers=none,
	aboveskip=1em,
	belowskip=0.5em,
	breaklines,
	breakatwhitespace=true,
	tabsize=4,
	keywordstyle={\bfseries\color{magenta}},
	commentstyle={\color{green}},
	stringstyle={\color{orange}},
}

\newenvironment{desc}
  {\if@nobreak
     \vskip-\lastskip
     \vspace*{-2.5ex}%
   \fi
   \decl}
  {\enddecl}

\newcommand{\ltxguidex@noticestyle}{\sffamily\bfseries\color{notes}}
\def\@begintheorem#1#2{%
  \list{}{}%
  \global\advance\@listdepth\m@ne
  \item[{\ltxguidex@noticestyle\MakeUppercase{#1}}]}
\newcommand{\newnotice}[2]{\newtheorem{#1}{#2}}

\newnotice{warning}{Warning}
\newnotice{note}{Note}
\newnotice{example}{Example}
\newnotice{bug}{Bug}

\let\bblxv\verbatim
\let\bblexv\endverbatim
\def\verbatim{\begin{shaded*}\bblxv\vskip-\baselineskip\vskip2.5\parsep}
\def\endverbatim{\bblexv\vskip-2\baselineskip\end{shaded*}}

\addtolength{\topmargin}{-3pc}
\addtolength{\textwidth}{6pc}
\addtolength{\oddsidemargin}{-2pc}
\addtolength{\textheight}{7pc}

\raggedright
\parindent1.8em
\parskip0pt

\newcommand\New[1]{%
  \colorbox[rgb]{.87, .9, .83}{New #1}\enspace\ignorespaces}

\newenvironment{packages}
	{\begin{description}
	\let\ltxguidex@item@old\item
	\RenewDocumentCommand{\item}{o}{\IfValueTF
		{##1}%
		{\ltxguidex@item@old[\package{##1}]}%
		{\ltxguidex@item@old}}
	}
	{\end{description}}

\newenvironment{classes}
	{\begin{description}
	\let\ltxguidex@item@old\item
	\RenewDocumentCommand{\item}{o}{\IfValueTF
		{##1}%
		{\ltxguidex@item@old[\ltxclass{##1}]}%
		{\ltxguidex@item@old}}
	}
	{\end{description}}

\providecommand{\package}[1]{\texttt{#1}}
\providecommand{\ltxclass}[1]{\texttt{#1}}
\providecommand{\option}[1]{\texttt{#1}}
\providecommand{\extension}[1]{\texttt{.#1}}
\providecommand{\filename}[1]{\texttt{#1}}

\newcommand{\docstrip}{\textsc{docstrip}}

\newcommand{\email}[1]{\href{mailto:#1}{#1}}
\newcommand{\http}[1]{\href{http://#1}{#1}}
\newcommand{\https}[1]{\href{https://#1}{#1}}
\renewcommand{\ctan}[1]{\href{https://ctan.org/pkg/#1}{\package{#1}}}
\NewExpandableDocumentCommand{\Th}{O{l} m}
	{\multicolumn{1}{#1}{\textbf{#2}}}
