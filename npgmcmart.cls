\ProvidesClass{npgmcmart}[2005/06/14 v050601, by Mao Ziyang,2008/09/19,Amend,bywangzhaoli]

\let\CCTCJKfonts=1
\LoadClass[12pt,oneside]{cctart}

\endlinechar -1

\renewcommand\contentsname{\centering \ziju{2}Ŀ¼}

%------------------------ Page layout ----------------------------------

\topmargin=-15.4mm
\oddsidemargin=-0.4mm
\evensidemargin=-0.4mm
\textwidth=160mm
\textheight=247mm

\def\maketitle{%
  \null
  \thispagestyle{plain}%
  \leavevmode
%\input{declaration}
  \null
  %\cleardoublepage
  \setcounter{page}{1}
  \begin{center}
     {\Large \@title \par}%
  \end{center}
  \vspace{3\ccht}\par
  }

%------------------------ Abstract & Keywords -------------------------
\newcommand\cnabstractname{\ziju{2}ժҪ}
\newcommand\enabstractname{ABSTRACT}
\newcommand\cnkeywords[1]{\pushziti {\heiti\zihao{-4}\cnkeywordsname��#1}\popziti}
\newcommand\cnkeywordsname{�ؼ���}
\newcommand\enkeywords[1]{\pushziti {\bfseries\zihao{-4}\enkeywordsname��#1}\popziti}
\newcommand\enkeywordsname{Key words}

\newenvironment{cnabstract}{\pushziti%
    \begin{center}{\zihao{4}\heiti \cnabstractname}\end{center}\vspace{1\ccht}
    \songti\zihao{-4}
    \@afterheading}
    {\par\popziti\newpage}

%------------------------ sections -------------------------
\renewcommand\section{\@startsection
                 {section}{3}{\z@}%   {name}{depth}{}
                {3.5ex \@plus 1ex \@minus .2ex}% positive->leave parindent
                {2.3ex \@plus.2ex}%
                {\reset@font\fontsize{13.75pt}{\baselineskip}\sectionformat}}
\renewcommand\sectionname{\Roman{section}}
\renewcommand\sectionformat{\zihao{4}\centering\selectfont\bfseries}


%------------------------ subsections -------------------------
\renewcommand\subsectionname{\arabic{section}.\arabic{subsection}}
\renewcommand\subsectionformat{\zihao{-4}\selectfont\bfseries}


%----------------------- Theorems -----------------------------------
\newtheorem{theorem}{{����}}
\newtheorem{proposition}{{����}}
\newtheorem{lemma}{{����}}
\newtheorem{corollary}{{����}}[theorem]
\newtheorem{definition}{{����}}
\newtheorem{example}{{��}}


%------------------------ ��ʽ��� -----------------------------------
\renewcommand{\theequation}{\thesection-\arabic{equation}}


%------------------------ ͼƬ��� -----------------------------------
\renewcommand{\thefigure}{\thesection-\arabic{figure}}

%------------------------ ������ -----------------------------------
\renewcommand{\thetable}{\thesection-\arabic{table}}

% �ο��ļ������½�
\renewcommand\refname{\section{�ο�����}}

% �����������ϱ����
\makeatletter
\def\@cite#1#2{\textsuperscript{[{#1\if@tempswa , #2\fi}]}}
\makeatother

\endlinechar `\^^M
\endinput