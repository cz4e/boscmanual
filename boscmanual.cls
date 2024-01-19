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
  twoside,
  openany,
  scheme = plain,
  fontset = none,
  12pt
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

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\setlength{\parindent}{2em}

% ==============================================================================
% Font
% ==============================================================================
\setCJKmainfont{SimSun}
\setCJKmonofont{SimSun}
\setmainfont{Times New Roman}
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

% ==============================================================================
% Layouts and geometry
% ==============================================================================
\geometry{
  textwidth=138mm,
  textheight=215mm,
  inner=23mm,
  outer=18mm,
  top=25.4mm, bottom=25.4mm,
  headheight=2.17cm,
  headsep=4mm,
  footskip=12mm
}

% ==============================================================================
% Title page layout
% ==============================================================================
\newcommand{\titlename}[2]{
    %中文书名
    {\zihao{2}\textbf{#1}\selectfont}
    \rule{\linewidth}{1.5pt} \\
    \vspace{2ex}
    %% 英文书名
    {\zihao{1}\textsf{#2}}
}

\newcommand{\titleauthor}[1]{
    {\zihao{4}\textsf{#1}~\textbf{编著}}
}

\newcommand{\reviewname}[1]{
    {\zihao{4}\textsf{#1}~\textbf{审校}}
}

\newcommand{\titlenote}[1]{
    {\zihao{4}{\color{red}\textbf{Note: }}\textsf{#1}}
}

\renewcommand{\titlepage}[4]{
  \ifodd\c@page\else\thispagestyle{empty}\null\newpage\fi
  \begin{flushright}
  \includegraphics[width=0.25\textwidth]{logo/bosc_logo.jpeg}
  \end{flushright}
  \vspace*{5ex}
  \hspace{0.05\textwidth}\begin{minipage}{.9\textwidth}
    \begin{flushleft}
    \titlename{#1}{#2} \\
    \vspace{15ex}
    \titleauthor{#3} \\
    \vspace{1ex}
    \reviewname{#4} \\
    \vspace{15ex}
    \titlenote{This is a note}
    \end{flushleft}
  \end{minipage}
  \vfill
  \begin{center}
      \zihao{4}\textbf{文档状态：\color{red}草稿/已审校/已冻结/已发布/已废弃} \\
      \vspace{1ex}
      \zihao{4}\textbf{最近修改时间：\color{red}{2024/01/19}}
  \end{center}
  \vspace{1ex}
  \begin{center}
      \zihao{4}\textbf{北京}
  \end{center}
  \vspace{.1ex}
  \begin{center}
      \zihao{4}BEIJING
  \end{center}
  \thispagestyle{empty}
  \newpage
}


\newenvironment{openright}{
  \vspace*{70ex}
  \raggedright{\zihao{3}\textbf{通知及免责声明}\selectfont}\\
  \thispagestyle{empty}
  \zihao{4}
}{
  \newpage
}

% ==============================================================================
% Head and foot layout
% ==============================================================================
\pagestyle{fancy}
\fancyhf{} % clean old layout

\renewcommand\headrulewidth{0pt}
\renewcommand\footrulewidth{.5pt}
\futurelet\TMPfootrule\def\footrule{{\color{black}\TMPfootrule}}

\renewcommand{\chaptermark}[1]{\markboth{第\zhnum{chapter}章\hspace{1em}#1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}}

\fancyfoot[LE]{\thepage\quad\vrule\quad\leftmark}
\fancyfoot[RO]{\leftmark\quad\vrule\quad\thepage}

% ==============================================================================
% Part
% ==============================================================================
\titleformat{\part} % command
[display] % shape
{\bfseries} % format
{
  \zihao{1}\hfill 第{\zhnum{part}}部分
  \vspace{1ex}
  \hrule width \hsize height .5pt
} % label
{1ex} % sep
{\vspace{-7ex}\flushright\zihao{2}} % before-code
[\vspace{1ex}]
\CTEXsetup[name={第,部分},number={\chinese{part}},format={\zihao{-4}\bfseries\raggedright}]{part}
% ==============================================================================
% Chapter
% ==============================================================================
\titleformat{\chapter} % command
[display] % shape
{\bfseries} % format
{
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
章},number={\chinese{chapter}},format={\zihao{-4}\bfseries\raggedright}]{chapter}

% ==============================================================================
% Section
% ==============================================================================
\titleformat{\section}
[hang]
{\rmfamily}
{\zihao{-4}\bfseries{\thesection}\enspace}
{1pt}
{\zihao{4}\bfseries\filright}[]

%% subsection
\titleformat{\subsection}
[hang]
{\rmfamily}
{\zihao{-4}\bfseries\thesubsection\enspace}
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
% listings
\renewcommand{\lstlistingname}{代码}
\renewcommand{\lstlistlistingname}{\lstlistingname 列表}


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
  colframe=black,
  overlay={
    \node[anchor=north west,outer sep=10pt] at (frame.north west)
    {
      \zihao{2}\textcolor{black}{\faIcon{key}}
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
  colframe=black,
  overlay={
    \node[anchor=north west,outer sep=10pt] at (frame.north west)
    {
      \zihao{2}\textcolor{black}{\faIcon{exclamation-triangle}}
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
  colframe=black,
  overlay={
    \node[anchor=north west,outer sep=10pt] at (frame.north west)
    {
      \zihao{2}\textcolor{black}{\faIcon{info-circle}}
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
  colframe=black,
  overlay={
    \node[anchor=north west,outer sep=10pt] at (frame.north west)
    {
      \zihao{2}\textcolor{black}{\faIcon{ban}}
    };
  }
}


% ==============================================================================
% Code style
% ==============================================================================
\lstset{
  basicstyle=\ttfamily,
  frame=tb,
  framerule=.5pt,
  rulecolor=\color{black},
  abovecaptionskip=0pt,
  belowcaptionskip=5pt,
  commentstyle=\color{gray},
  keywordstyle=\color{blue},
  numberstyle=\small\color{gray},
  stringstyle=\color{red},
  morekeywords={as},
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
  rulecolor=\color{black},
  abovecaptionskip=0pt,
  belowcaptionskip=5pt,
  commentstyle=\color{gray},
  keywordstyle=\color{blue},
  numberstyle=\small\color{gray},
  stringstyle=\color{red},
  morekeywords={as},
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
  rulecolor=\color{black},
  abovecaptionskip=0pt,
  belowcaptionskip=5pt,
  commentstyle=\color{gray},
  keywordstyle=\color{blue},
  numberstyle=\small\color{gray},
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

\lstdefinestyle{Chisel}{
  language=Scala,
  basicstyle=\ttfamily,
  frame=tb,
  framerule=.5pt,
  rulecolor=\color{black},
  abovecaptionskip=0pt,
  belowcaptionskip=5pt,
  commentstyle=\color{gray},
  keywordstyle=\color{blue},
  numberstyle=\small\color{gray},
  stringstyle=\color{red},
  morekeywords={Enum},
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
