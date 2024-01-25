% ==============================================================================
% Identification
% ==============================================================================
\NeedsTeXFormat{LaTeX2e}
\newcommand\version{0.0.1}
\newcommand\versiondate{2024-01-18}
\ProvidesClass{boscmanual}[%
  \versiondate\space%
  v\version\space%
  An Unofficial Manual Template for BOSC %
]

\PassOptionsToClass{
  UTF8,
  a4paper,
  oneside,
  openany,
  scheme = plain,
  fontset = none
}{ctexbook}

\LoadClass{ctexbook}


% ==============================================================================
% Preliminary declarations
% ==============================================================================
\RequirePackage{xunicode}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{hyperref}
\RequirePackage{geometry}
\RequirePackage{fontspec}
\RequirePackage[clearempty]{titlesec}
\RequirePackage{zhnumber}
\RequirePackage{fancyhdr}
\RequirePackage{listings}
\RequirePackage{fontawesome5}
\RequirePackage[many]{tcolorbox}
\RequirePackage{indentfirst}
\RequirePackage{titletoc}
\RequirePackage{enumitem} 
\RequirePackage{xhfill}
\RequirePackage{etoolbox}
\RequirePackage{nameref}
\RequirePackage[normalem]{ulem}
\RequirePackage{amssymb}
\RequirePackage{kvoptions}
\RequirePackage{changepage}
\RequirePackage{booktabs}
\RequirePackage{ragged2e}
\RequirePackage{caption}
\SetupKeyvalOptions{family=bosc, prefix=bosc@, setkeys=\kvsetkeys}

\setlength{\parindent}{2em}

% ==============================================================================
% Color
% ==============================================================================
\definecolor{maincolor}{RGB}{41, 94, 163}
\definecolor{notecolor}{RGB}{41, 94, 163}

% ==============================================================================
% Font
% ==============================================================================
\setCJKmainfont{SimSun}
\setCJKmonofont{SimSun}
\setmainfont{NeoSansPro-Regular.ttf}[BoldFont=NeoSansPro-Bold.otf, ItalicFont=NeoSansPro-Italic.otf,
BoldItalicFont=NeoSansPro-BoldItalic.otf]
\setsansfont{DejaVu Sans}
\setmonofont{Consolas}

\setCJKmainfont[BoldFont={FZHei-B01},ItalicFont={FZKai-Z03}]{FZShuSong-Z01}
\setCJKsansfont{FZHei-B01}
\setCJKmonofont{FZFangSong-Z02}
\setCJKfamilyfont{zhsong}{FZShuSong-Z01}
\setCJKfamilyfont{zhhei}{FZHei-B01}
\setCJKfamilyfont{zhkai}{FZKai-Z03}
\setCJKfamilyfont{zhfs}{FZFangSong-Z02}
\setCJKfamilyfont{zhli}{FZLiShu-S01}

\newcommand*{\songti}{\CJKfamily{zhsong}} % 宋体
\newcommand*{\heiti}{\CJKfamily{zhhei}} % 黑体
\newcommand*{\kaiti}{\CJKfamily{zhkai}} % 楷体
\newcommand*{\fangsong}{\CJKfamily{zhfs}} % 仿宋
\newcommand*{\lishu}{\CJKfamily{zhli}}    % 隶书

\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt

\newfontfamily\fzss{FZShuSong-Z01}
\newfontfamily\fzxbs{FZShuSong-Z01}
\newfontfamily\fzhei{FZHei-B01}
\newfontfamily\fzkai{FZKai-Z03}
\newfontfamily\fzfs{FZFangSong-Z02}
\newfontfamily\fzzdx{FZHei-B01}

% ==============================================================================
% Options
% ==============================================================================
\DeclareStringOption[zh]{lang}
\DeclareStringOption[BOSC手册模版]{titlenamezh}
\DeclareStringOption[A Manual Template for BOSC]{titlenameen}
\DeclareStringOption[This is a note]{note}
\DeclareStringOption[BOSC Team]{author}
\DeclareStringOption[BOSC Team]{reviewer}
\DeclareStringOption[草稿]{state}
\DeclareStringOption[2024/01/19]{date}
\ProcessKeyvalOptions*\relax

% ==============================================================================
% Layouts and geometry
% ==============================================================================
\geometry{
  textwidth=138mm,
  textheight=215mm,
  inner=23mm,
  outer=18mm,
  marginparwidth = 106pt,
  top=25.4mm, bottom=25.4mm, left = 45mm,
  headheight=2.17cm,
  headsep=4mm,
  footskip=12mm
}

% ==============================================================================
% Title page layout
% ==============================================================================
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\reviewer}[1]{\gdef\@reviewer{#1}}
\newcommand{\note}[1]{\gdef\@note{#1}}
\newcommand{\docstate}[1]{\gdef\@docstate{#1}}
\newcommand{\openright}[1]{\gdef\@openright{#1}}

\renewcommand*{\maketitle}{%
\begin{titlepage}
  \ifodd\c@page\else\thispagestyle{empty}\null\newpage\fi
  \begin{flushright}
  \includegraphics[width=0.25\textwidth]{logo/bosc_logo.jpeg}
  \end{flushright}
  \vspace*{5ex}
  \hspace{0.05\textwidth}\begin{minipage}{.9\textwidth}
    \begin{flushright}
    {\zihao{2}{\color{maincolor}\textbf{\@title}}} 
    \color{maincolor}\rule{\linewidth}{1.5pt} \\
    \vspace{2ex}
    {\zihao{1}\color{maincolor}\textsf{\@subtitle}} \\
    \vspace{15ex}
    {\zihao{4}\color{maincolor}\textsf{\@author}~\textbf{编著}} \\
    \vspace{1ex}
    {\zihao{4}\color{maincolor}\textsf{\@reviewer}~\textbf{审校}} \\
    \vspace{10ex}
    {\zihao{4}\color{maincolor}\textbf{文档状态：}\color{red}\textbf{\@docstate}} \\
    \vspace{2ex}
    {\zihao{4}\color{maincolor}\textbf{最近修改时间：}\color{red}\textbf{\@date}}        
    \end{flushright}
    \begin{flushleft}
    \vspace{15ex}
    {\zihao{4}{\color{notecolor}\textbf{Note: }}\color{black}\textsf{\@note}}
    \end{flushleft}
  \end{minipage}
  \vfill
  \newpage
  \begin{flushleft}
  \vspace*{\fill}
  \textbf{Openright Notice} \\
  \vspace{1cm}
  \textit\@openright \\
  \vspace{1cm}
  \normalsize\textcopyright\ 2024 Your Name \\
  All rights reserved. \\
  \vspace*{\fill}
  \end{flushleft}
  \thispagestyle{empty}
\end{titlepage}
\restoregeometry
\thispagestyle{empty}}

% ==============================================================================
% Tableofcontents layout
% ==============================================================================
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}


\titlecontents{part}[0pt]{\vspace{0.2cm}\bfseries\Large\color{maincolor}}
    {\thecontentslabel\hspace{0.5em}}{}{\hfill\contentspage}

\titlecontents{chapter}[0pt]{\vspace{0.2cm}\bfseries\large\color{maincolor}}
    {\thecontentslabel\hspace{0.5em}}{}{\hfill\contentspage}

\titlecontents{section}[1.5em]{\vspace{0.2cm}\color{maincolor}}
    {\contentslabel{1.5em}\hspace{2.5em}}{}{\titlerule*[0.5pc]{.}\contentspage}

\titlecontents{subsection}[1.5em]{\vspace{0.2cm}\color{maincolor}}
    {\contentslabel{1.5em}\hspace{2.5em}}{}{\titlerule*[0.5pc]{.}\contentspage}

% ==============================================================================
% Head and foot layout
% ==============================================================================
\pagestyle{fancy}
\fancyhf{} % clean old layout

\renewcommand\headrulewidth{0pt}
\renewcommand\footrulewidth{.5pt}
\futurelet\TMPfootrule\def\footrule{{\color{maincolor}\TMPfootrule}}

\renewcommand{\chaptermark}[1]{\markboth{第\zhnum{chapter}章\hspace{1em}#1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}}

\fancyfoot[LE]{\thepage\quad\vrule\quad\color{maincolor}\leftmark}
\fancyfoot[RO]{\color{maincolor}\leftmark\quad\vrule\quad\thepage}

% ==============================================================================
% Part
% ==============================================================================
\titleformat{\part} % command
[display] % shape
{\bfseries\color{maincolor}} % format
{
  \zihao{1}\hfill 第{\zhnum{part}}部分
  \vspace{1ex}
  \hrule width \hsize height .5pt
  \thispagestyle{empty}
} % label
{1ex} % sep
{
  \ifodd\c@page\else\thispagestyle{empty}\null\newpage\fi
  \vspace{-7ex}\flushright\zihao{2}
} % before-code
[\vspace{1ex}]

\CTEXsetup[name={第,部分},number={\chinese{part}},format={\zihao{-4}\bfseries\raggedright\color{maincolor}}]{part}
% ==============================================================================
% Chapter
% ==============================================================================
\titleformat{\chapter} % command
[display] % shape
{\bfseries\color{maincolor}} % format
{
  \ifodd\c@page\else\thispagestyle{empty}\null\newpage\fi
  \flushright\zihao{4}第\zhnum{chapter}章
} % label
{1ex} % sep
{
  \hrule width \hsize height .5pt
  \vspace{1ex}\flushright\zihao{2}
} % before-code
[
\vspace{1ex}
] % after-code
\CTEXsetup[name={第,
章},number={\chinese{chapter}},format={\zihao{-4}\bfseries\raggedright\color{maincolor}}]{chapter}
% ==============================================================================
% Section
% ==============================================================================
% 
\titleformat{\section}
  [hang]
  {\rmfamily\color{maincolor}}
  {\hspace{-3.1cm}\parbox[t]{1.5cm}{\zihao{-4}\bfseries{\thesection}\enspace}}
  {1pt}
  {\zihao{4}\bfseries\filright}[]

%% subsection
  \titleformat{\subsection}[hang]
  {\rmfamily}
  {\hspace{-3.4cm}\parbox[t]{1.5cm}{\zihao{-4}\bfseries\thesubsection\enspace}}
  {1pt}
  {\zihao{4}\bfseries\filright}[]

\renewcommand{\contentsname}{目\hspace{1em}录}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\renewcommand{\partname}{部分}
\renewcommand{\listfigurename}{插图目录}
\renewcommand{\listtablename}{表格目录}
\renewcommand{\bibname}{参考文献}
\renewcommand{\appendixname}{附\hspace{1em}录}
\renewcommand{\indexname}{索\hspace{1em}引}

% ==============================================================================
% Message box
% ==============================================================================
\newtcolorbox{keypoint}{%
  enhanced,
  arc=3pt,
  interior style={white},
  boxrule=.5pt,
  left=40pt, right=0pt, top=2pt, bottom=0pt,
  boxsep=10pt,
  colframe=maincolor,
  overlay={
    \node[anchor=north west,outer sep=10pt] at (frame.north west)
    {
      \zihao{2}\textcolor{maincolor}{\faIcon{key}}
    };
  }
}

\newtcolorbox{attention}{%
  enhanced,
  arc=3pt,
  interior style={white},
  boxrule=.5pt,
  left=40pt, right=0pt, top=2pt, bottom=0pt,
  boxsep=10pt,
  colframe=maincolor,
  overlay={
    \node[anchor=north west,outer sep=10pt] at (frame.north west)
    {
      \zihao{2}\textcolor{maincolor}{\faIcon{exclamation-triangle}}
    };
  }
}

\newtcolorbox{info}{%
  enhanced,
  arc=3pt,
  interior style={white},
  boxrule=.5pt,
  left=40pt, right=0pt, top=2pt, bottom=0pt,
  boxsep=10pt,
  colframe=maincolor,
  overlay={
    \node[anchor=north west,outer sep=10pt] at (frame.north west)
    {
      \zihao{2}\textcolor{maincolor}{\faIcon{info-circle}}
    };
  }
}

\newtcolorbox{ban}{%
  enhanced,
  arc=3pt,
  interior style={white},
  boxrule=.5pt,
  left=40pt, right=0pt, top=2pt, bottom=0pt,
  boxsep=10pt,
  colframe=maincolor,
  overlay={
    \node[anchor=north west,outer sep=10pt] at (frame.north west)
    {
      \zihao{2}\textcolor{maincolor}{\faIcon{ban}}
    };
  }
}


% ==============================================================================
% Code style
% ==============================================================================
\DeclareCaptionFormat{lablestyle}{\color{maincolor}\bf #1#2#3}
\captionsetup[lstlisting]{format=lablestyle,labelfont=bf,singlelinecheck=off,labelsep=space,justification=centering}
\renewcommand{\lstlistingname}{代码}

\lstset{
  basicstyle=\ttfamily,
  frame=tb,
  framerule=.5pt,
  rulecolor=\color{maincolor},
  abovecaptionskip=0pt,
  belowcaptionskip=5pt,
  commentstyle=\color{gray},
  keywordstyle=\color{blue},
  numberstyle=\small\color{maincolor},
  stringstyle=\color{red},
  breakatwhitespace=false,
  breaklines=true,
  captionpos=t,
  keepspaces=true,
  numbers=left,
  numbersep=10pt,
  stepnumber=1,
  firstnumber=1,
  numberfirstline=true,
  tabsize=4,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  breaklines=true,
}

\lstdefinestyle{Python}{
  language=Python,
  basicstyle=\ttfamily,
  frame=tb,
  framerule=.5pt,
  rulecolor=\color{maincolor},
  abovecaptionskip=0pt,
  belowcaptionskip=5pt,
  commentstyle=\color{gray},
  keywordstyle=\color{blue},
  numberstyle=\small\color{maincolor},
  stringstyle=\color{red},
  morekeywords={False, None, True, and, as, assert, async, await, break, class, continue, def, del, elif, else, except, False, finally, for, from, global, if, import, in, is, lambda, nonlocal, not, or, pass, raise, return, True, try, while, with, yield},
  breakatwhitespace=false,
  breaklines=true,
  captionpos=t,
  keepspaces=true,
  numbers=left,
  numbersep=10pt,
  stepnumber=1,
  firstnumber=1,
  numberfirstline=true,
  tabsize=4,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  breaklines=true,
}


\lstdefinestyle{C++}{
  language=C++,
  basicstyle=\ttfamily,
  frame=tb,
  framerule=.5pt,
  rulecolor=\color{maincolor},
  abovecaptionskip=0pt,
  belowcaptionskip=5pt,
  commentstyle=\color{gray},
  keywordstyle=\color{blue},
  numberstyle=\small\color{maincolor},
  stringstyle=\color{red},
  morekeywords={alignas, alignof, and, and_eq, asm, auto, bitand, bitor, bool, break, case, catch, char, char8_t, char16_t, char32_t, class, compl, concept, const, consteval, constexpr, const_cast, continue, co_await, co_return, co_yield, decltype, default, delete, do, double, dynamic_cast, else, enum, explicit, export, extern, false, float, for, friend, goto, if, inline, int, long, mutable, namespace, new, noexcept, not, not_eq, nullptr, operator, or, or_eq, private, protected, public, register, reinterpret_cast, requires, return, short, signed, sizeof, static, static_assert, static_cast, struct, switch, template, this, thread_local, throw, true, try, typedef, typeid, typename, union, unsigned, using, virtual, void, volatile, wchar_t, while, xor, xor_eq
},
  breakatwhitespace=false,
  breaklines=true,
  captionpos=t,
  keepspaces=true,
  numbers=left,
  numbersep=10pt,
  stepnumber=1,
  firstnumber=1,
  numberfirstline=true,
  tabsize=4,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  breaklines=true,
}

\lstdefinestyle{Chisel}{
  language=Scala,
  basicstyle=\ttfamily,
  frame=tb,
  framerule=.5pt,
  rulecolor=\color{maincolor},
  abovecaptionskip=0pt,
  belowcaptionskip=5pt,
  commentstyle=\color{gray},
  keywordstyle=\color{blue},
  numberstyle=\small\color{maincolor},
  stringstyle=\color{red},
  morekeywords={abstract, case, catch, class, def, do, else, extends, false, final, finally, for, if, implicit, import, match, new, null, object, override, package, private, protected, return, sealed, super, this, throw, trait, try, true, type, val, var, while, with, yield},
  breakatwhitespace=false,
  breaklines=true,
  captionpos=t,
  keepspaces=true,
  numbers=left,
  numbersep=10pt,
  stepnumber=1,
  firstnumber=1,
  numberfirstline=true,
  tabsize=4,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  breaklines=true,
}

% ==============================================================================
% List style
% ==============================================================================
\setlist[enumerate,1]{left=0pt..2em,label=\arabic*.}
\setlist[enumerate,2]{left=2em..4em,label=\alph*.}
\setlist[enumerate,3]{left=4em..6em,label=\roman*.}
\setlist[enumerate,4]{left=6em..8em,label=\Alph*.}



% ==============================================================================
% Ref style
% ==============================================================================
\hypersetup{
  colorlinks=true,
  linkcolor=maincolor,    % 设置链接颜色为蓝色
  urlcolor=black,      % 设置URL颜色为红色
  citecolor=black    % 设置引用颜色为绿色
}

% ==============================================================================
% Figure style
% ==============================================================================
\captionsetup[figure]{format=lablestyle,labelfont=bf,singlelinecheck=off,labelsep=space,justification=centering}

% ==============================================================================
% Table style
% ==============================================================================
\captionsetup[table]{format=lablestyle,labelfont=bf,singlelinecheck=off,labelsep=space,justification=centering}

% ==============================================================================
% Global parameters
% ==============================================================================
\setlength{\parindent}{0pt}