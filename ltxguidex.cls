\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{ltxguide}[2019/01/08 Extended LaTeX documentation class]

\raggedright
\parskip=.8ex
\advance\oddsidemargin-.5cm
\advance\textwidth1cm
\addtolength{\textheight}{2cm}
\addtolength{\topmargin}{-1.5cm}

% ltxguide code

% Input any local configuration file.
\InputIfFileExists{ltxguide.cfg}
  {\typeout         {**********************************************^^J%
                     * Local configuration file ltxguide.cfg used *^^J%
                     **********************************************}}
  {\ClassInfo{ltxguide}{Local configuration file not found}}

% All options are passed to the article class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}

% The names of some documents:
\newcommand{\clsguide}{\LaTeXe{} for Class and Package Writers}
\newcommand{\usrguide}{\LaTeXe{} for Authors}
\newcommand{\fntguide}{\LaTeXe{} Font Selection}
\newcommand{\cfgguide}{Configuration options for \LaTeXe}
\newcommand{\cyrguide}{Cyrillic languages support in \LaTeX}
\newcommand{\modguide}{Modifying \LaTeX}
\newcommand{\sourcecode}{\LaTeX: the program}
\newcommand{\LaTeXbook}{\LaTeX: A Document Preparation System}
\newcommand{\LaTeXcomp}{The \LaTeX{} Companion}
\newcommand\LaTeXGcomp{The \LaTeX{} Graphics Companion}
\newcommand\LaTeXWcomp{The \LaTeX{} Web Companion}

% Logos.
% The SliTeX logo:
\newcommand{\SLiTeX}{\textsc{Sli}\TeX}
\newcommand{\babel}{\textsf{babel}}
\newcommand{\ctan}{\textsc{ctan}}
\newcommand{\NFSS}{\textsf{NFSS}}
\newcommand{\AmS}{$${\protect\the\textfont2 A}\kern-.1667em\lower
         .5ex\hbox{\protect\the\textfont2 M}\kern
         -.125em{\protect\the\textfont2 S}}
\newcommand{\AmSLaTeX}{\mbox{\AmS-\LaTeX}}

\newcommand{\eg}{e.g.,~}
\newcommand{\ie}{i.e.,~}

% A declaration of a command, in a box, set out into the margin.
%
% Unfortunately, there is a bug with this command, which allows page
% breaks to happen after a \begin{decl}[DATE]: it is a bug with TeX that
% makes it very difficult to get page-breaks correct near marginals,
% especially at the end of a paragraph.
\newenvironment{decl}[1][]%
    {\par\small\addvspace{4.5ex plus 1ex}%
     \vskip -\parskip
     \ifx\relax#1\relax
        \def\@decl@date{}%
     \else
        \def\@decl@date{\NEWfeature{#1}}%
     \fi
     \noindent\hspace{-\leftmargini}%
     \begin{tabular}{|l|}\hline\ignorespaces}%
    {\\\hline\end{tabular}\nobreak\@decl@date\par\nobreak
     \vspace{2.3ex}\vskip -\parskip}

% Run the toc tighter:
\def\@starttoc#1{\begingroup
  \makeatletter
  \parskip\z@\@plus\p@\relax         % <----
  \@input{\jobname.#1}\if@filesw
  \expandafter\newwrite\csname tf@#1\endcsname
             \immediate\openout
                 \csname tf@#1\endcsname \jobname.#1\relax
  \fi \global\@nobreakfalse \endgroup}

% Some hacks with verbatim... NB: this would be better done with the
% verbatim package, but this document has to run on any LaTeX
% installation.
%\let\o@verbatim\verbatim
%\def\verbatim{%
  %\ifhmode\unskip\par\fi
%% \nopagebreak              % Overridden by list penalty
  %\ifx\@currsize\normalsize
     %\small
  %\fi
  %\o@verbatim
%}

% Here we extend the font-setting command to include making <> active
% (ie adjusting the input encoding).
%\renewcommand \verbatim@font {%
  %\normalfont \ttfamily
  %\catcode`\<=\active
  %\catcode`\>=\active
%}


% Make active <...> produce italics surrounded by angle brackets
% (used in verbatim and \verb).
% << produces a less-than, and >> produces a greater-than.

\def\@makeangleactive{%
  \catcode`\<=\active
  \catcode`\>=\active
}

%\begingroup
  %\catcode`\<=\active
  %\catcode`\>=\active
  %\gdef<{\@ifnextchar<\@lt\@meta}
  %\gdef>{\@ifnextchar>\@gt\@gtr@err}
  %\gdef\@meta#1>{\m{#1}}
  %\gdef\@lt<{\char`\<}
  %\gdef\@gt>{\char`\>}
%\endgroup
%\def\@gtr@err{%
   %\ClassError{ltxguide}{%
      %Isolated \protect>%
   %}{%
      %In this document class, \protect<...\protect>
      %is used to indicate a parameter.\MessageBreak
      %I've just found a \protect> on its own.
      %Perhaps you meant to type \protect>\protect>?
   %}%
%}
%%\def\verbatim@nolig@list{\do\`\do\,\do\'\do\-}

% Make |...| a synonym for \verb|...|.
\RequirePackage{listings}
\lstMakeShortInline[
	escapeinside=<>,
	%escapebegin=\@makeangleactive<\@ifnextchar<\@lt\@meta,
	%escapeend=>\@ifnextchar>\@gt\@gtr@err,
]|

% Various forms of argument:

\newcommand{\m}[1]{\mbox{$\langle$\it #1\/$\rangle$}}
\renewcommand{\arg}[1]{{\tt\string{}\m{#1}{\tt\string}}}
\newcommand{\oarg}[1]{{\tt[}\m{#1}{\tt]}}

% Table of contents is two deep.

\setcounter{tocdepth}{2}

% Allow more flexibility about bad paragraphs.

\tolerance500

% Marginal notes for new features and description:
% Changed to command and hacked by Chris to get better positioning and
% a better chance of printing:
\newcommand{\NEWfeature}[1]{%
   \hskip 1sp \marginpar{\small\sffamily\raggedright
     New feature\\#1}}
\newcommand{\NEWdescription}[1]{%
   \hskip 1sp \marginpar{\small\sffamily\raggedright
     New description\\#1}}

\newcommand{\URL}[1]{\texttt{#1}}

% End of ltxguide code

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
%    \item label wrapping command
\newcommand{\@newdescriptionenvironment}[3]
	{\expandafter#1{#2}%
		{\begin{description}%
		\let\ltxguidex@item@old\item
		\RenewDocumentCommand{\item}{o}{\IfValueTF
			{####1}%
			{\ltxguidex@item@old[\expandafter#3{####1}]}%
			{\ltxguidex@item@old}}%
		}
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

\let\ltxexample\LTXexample
\let\endltxexample\endLTXexample

\providecommand{\package}[1]{\texttt{#1}}
\providecommand{\ltxclass}[1]{\texttt{#1}}
\providecommand{\option}[1]{\texttt{#1}}
\providecommand{\extension}[1]{\texttt{.#1}}
\providecommand{\filename}[1]{\texttt{#1}}

\newcommand{\docstrip}{\textsc{docstrip}}
\newcommand{\pipe}{\char"7C}

\newcommand{\email}[1]{\href{mailto:#1}{#1}}
\newcommand{\http}[1]{\href{http://#1}{#1}}
\newcommand{\https}[1]{\href{https://#1}{#1}}
\renewcommand{\ctan}[1]{\href{https://ctan.org/pkg/#1}{\package{#1}}}
\NewExpandableDocumentCommand{\Th}{O{l} m}
	{\multicolumn{1}{#1}{\textbf{#2}}}
