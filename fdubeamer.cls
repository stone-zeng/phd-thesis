\ProvidesClass{fdubeamer}[2023/12/01 v0.1 Beamer template for Fudan University]

\LoadClass[aspectratio=1610, t]{beamer}

\RequirePackage{bookmark}
\RequirePackage[mono=false]{libertinus}
\RequirePackage{tikz}

\definecolor{FudanBlue}{HTML}{0E419C}
\definecolor{FudanRed}{HTML}{CC1A1A}
\useoutertheme{metropolis}
\usefonttheme[onlymath]{serif}
\setbeamercolor{structure}{fg=FudanBlue}
\setbeamercolor{alerted text}{fg=structure}
\setbeamertemplate{itemize items}{\textbullet}
\setbeamertemplate{footnote}{%
  \parindent1em\scriptsize\color{lightgray}%
  \insertfootnotetext\par}
\renewcommand{\footnoterule}{}
\renewcommand{\metropolis@frametitlestrut@start}{\rule{0pt}{2.5em}}
\renewcommand{\metropolis@frametitlestrut@end}{\rule[-0.5em]{0pt}{0.5em}}
\setlength{\metropolis@frametitle@padding}{2em}

% Title page
\setbeamertemplate{title page}{%
  \vfill
  \hspace{-2.5em}%
  \begin{beamercolorbox}[wd=0.75\textwidth,leftskip=2em]{title}
    \LARGE
    \inserttitle\\[3ex]
    \usebeamercolor[fg]{normal text}%
    \normalsize
    \insertauthor\\
    \insertinstitute\\[2ex]
    \insertdate
  \end{beamercolorbox}
}
\renewcommand{\maketitle}{
  \begingroup
    \setbeamertemplate{background}{%
      \rule{0.56\paperwidth}{0pt}%
      \begin{tikzpicture}[x=\paperwidth, y=\paperheight]
        \fill [FudanBlue] (-0.1,-0.5) -- (0.5,-0.5) -- (0.5,0.5) -- (0.1,0.5) -- cycle;
        \node at (0.14,-0.3) {\inserttitlegraphic};
      \end{tikzpicture}
    }
    \begin{frame}[plain, noframenumbering]
      \titlepage
    \end{frame}
  \endgroup
}

% Section page
\setbeamertemplate{section page}{%
  \begin{center}
    \usebeamercolor[fg]{section title}
    \usebeamerfont{section title}
    \insertsectionhead
  \end{center}
}
\AtBeginSection{
  \frame[plain, c]{
    \sectionpage
    \vspace{-2em}
  }
}

% PDF bookmark
\apptocmd{\beamer@@frametitle}{%
  \only<1>{\expandafter\ifnum\insertcontinuationcount<2\relax
    \bookmark[page=\the\c@page,level=4]{#1}\fi}}{}{}

\endinput
