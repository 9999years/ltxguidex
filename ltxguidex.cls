\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{ltxguidex}[2019/01/08 Extended LaTeX documentation class]

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
\RequirePackage{enumitem}

\definecolor{red}    {HTML}{BF4C4C}
\definecolor{green}  {HTML}{4CBF67}
\definecolor{orange} {HTML}{BF8D4C}
\definecolor{cyan}   {HTML}{4CA0BF}
\definecolor{magenta}{HTML}{594CBF}
\definecolor{light}  {HTML}{F5F5ED}

\definecolor{notes}{named}{red}
\definecolor{shadecolor}{named}{light}

\lstset{
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
	backgroundcolor={\color{shadecolor}},
}

% For showexpl
\renewcommand{\SX@explpreset}{
	language=[LaTeX]TeX,
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

\lstnewenvironment{latexcode}
	{\lstset{language=[LaTeX]TeX}}{}

% Arguments:
%    Environment defining command (e.g. \newenvironment or \renewenvironment)
%    Environment name
%    \makelabel command
\newcommand{\@newdescriptionenvironment}[3]
	{\expandafter#1{#2}%
		{\begin{description}%
		\let\makelabel#3}
		{\end{description}}}

% Arguments:
%    Environment name
%    \item label wrapping command
\newcommand{\newdescriptionenvironment}[2]
	{\@newdescriptionenvironment{\newenvironment}{#1}{#2}}
\newcommand{\renewdescriptionenvironment}[2]
	{\@newdescriptionenvironment{\renewenvironment}{#1}{#2}}

\newdescriptionenvironment{packages}{\package}
\newdescriptionenvironment{classes}{\ltxclass}
\newdescriptionenvironment{options}{\option}

% from lstdoc
\def\advisespace{\hbox{}\qquad}
\def\labeladvise{$\to$}
\def\advisestyle{\footnotesize\sffamily}
\newenvironment{advise}
	{\begin{itemize}[
		label=\labeladvise,
		itemsep=0pt,
	]%
	\advisestyle
	\let\Q\item
	\let\A\advisespace
	\let\advicespace\advisespace
	}
	{\end{itemize}}

% alias `advise' to `advice' and `faq'
\let\advice\advise
\let\endadvice\endadvise
\let\faq\advise
\let\endfaq\endadvise

% from ltxdoc; ``iterates down the list and inserts vertical rules'' between
% items
\def\alternative#1{\lst@true \alternative@#1,\relax,}
\def\alternative@#1,{%
    \ifx\relax#1\@empty
        \expandafter\@gobble
    \else
        \ifx\@empty#1\@empty\else
            \lst@if \lst@false \else $\vert$\fi
            \textup{\texttt{#1}}%
        \fi
    \fi
    \alternative@}

\newenvironment{keys}
	{\begin{description}
	% opts:
	% - v: min version
	% - note: left margin note
	% \key[<opts>]{<keyname>}[<value>][<default>]
	\NewDocumentCommand{\key}{o m o o}{}
	}
	{\end{description}}

\providecommand{\package}  [1]{\texttt{#1}}
\providecommand{\ltxclass} [1]{\texttt{#1}}
\providecommand{\option}   [1]{\texttt{#1}}
\providecommand{\extension}[1]{\texttt{.#1}}
\providecommand{\filename} [1]{\texttt{#1}}

\newcommand{\docstrip}{\textsc{docstrip}}
\newcommand{\pipe}{\char"7C}

\newcommand{\email}[1]{\href{mailto:#1}{#1}}
\newcommand{\http}[1]{\href{http://#1}{#1}}
\newcommand{\https}[1]{\href{https://#1}{#1}}
\renewcommand{\ctan}[1]{\href{https://ctan.org/pkg/#1}{\package{#1}}}
\NewExpandableDocumentCommand{\Th}{O{l} m}
	{\multicolumn{1}{#1}{\textbf{#2}}}
