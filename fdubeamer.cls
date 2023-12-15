\ProvidesClass{fdubeamer}[2023/12/01 v0.1 Beamer template for Fudan University]

\LoadClass[aspectratio=1610, onlytextwidth, t]{beamer}

\RequirePackage{bookmark}
\RequirePackage[no-math]{fontspec}
\RequirePackage{tikz}
\RequirePackage{unicode-math}

\definecolor{FudanBlue}{HTML}{0E419C}
\definecolor{FudanRed}{HTML}{CC1A1A}

\useoutertheme{metropolis}
\usefonttheme[onlymath]{serif}

\setbeamercolor{structure}{fg=FudanBlue}
\setbeamercolor{alerted text}{fg=structure}
\setbeamerfont{section title}{size=\LARGE, series=\bfseries}
\setbeamerfont{frametitle}{size=\Large, series=\bfseries}
\setbeamertemplate{itemize items}{\textbullet}
\setbeamertemplate{enumerate item}{(\alph{enumi})}
\setbeamertemplate{footnote}{%
  \parindent1em\tiny\color[HTML]{9E9E9E}%
  \insertfootnotetext\par}
\renewcommand{\appendixname}{Appendix}
\renewcommand{\footnoterule}{}
\renewcommand{\metropolis@frametitlestrut@start}{\rule{0pt}{2.5em}}
\renewcommand{\metropolis@frametitlestrut@end}{\rule[-0.5em]{0pt}{2.5em}}
\setlength{\metropolis@frametitle@padding}{2em}

% Title page
\setbeamertemplate{title page}{%
  \vfill
  \hspace{-2.5em}%
  \begin{beamercolorbox}[wd=0.75\textwidth,leftskip=2em]{title}
    \LARGE
    \bfseries
    \inserttitle\\[3ex]
    \usebeamercolor[fg]{normal text}%
    \normalsize
    \normalfont
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
        \node at (0.14,-0.3) {\includegraphics[width=4.5cm]{images/fudan-logo.pdf}};
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
    \vspace{-4em}
  }
}

% PDF bookmark
\apptocmd{\beamer@@frametitle}{%
  \only<1>{\expandafter\ifnum\insertcontinuationcount<2\relax
    \bookmark[page=\the\c@page,level=4]{#1}\fi}}{}{}

% Image credits
\ExplSyntaxOn
\AtBeginDocument{
  \exp_args:NNo \prop_set_from_keyval:Nn \g_tmpa_prop { \CreditsData }
  \DeclareDocumentCommand \citet { m }
    {
      \prop_get:NnN \g_tmpa_prop {#1} \l_tmpa_tl
      \exp_last_unbraced:No \href { \l_tmpa_tl }
    }
}
\ExplSyntaxOff

% Fonts
\setsansfont{MonaSans}[
  Path           = fonts/,
  Extension      = .otf,
  UprightFont    = *-Light,
  BoldFont       = *-SemiBold,
  ItalicFont     = *-LightItalic,
  BoldItalicFont = *-SemiBoldItalic,
  Ligatures      = CommonOff,
  StylisticSet   = 1,
]
\linespread{1.2}
\selectfont
\unimathsetup{math-style=ISO, bold-style=ISO}

\endinput
