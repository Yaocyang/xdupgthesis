\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xdupgthesis}[2021/11/21 Xidian University Postgraduate Thesis document class, version 0.2.38, modified by @note286, published in https://note286.github.io/xdupgthesis/]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   class and packages

%%%%%%%%%%%%%%%%%%%%
%% Options
%%%%%%%%%%%%%%%%%%%%

%% disable oneside option
\DeclareOption{oneside}{\OptionNotUsed}

% overleaf
\newif\ifXDU@Option@overleaf\XDU@Option@overleaffalse
\DeclareOption{overleaf}{\XDU@Option@overleaftrue}

% mprof = Master of Professional
\newif\ifXDU@Option@mprof\XDU@Option@mproffalse
\DeclareOption{mprof}{\XDU@Option@mproftrue}

% psd = Paper Similarity Detection
\newif\ifXDU@Option@psd\XDU@Option@psdfalse
\DeclareOption{psd}{\XDU@Option@psdtrue}

% anonrvw = Anonymously Review
\newif\ifXDU@Option@anonrvw\XDU@Option@anonrvwfalse
\DeclareOption{anonrvw}{\XDU@Option@anonrvwtrue}

% noloftpre = No Prefix in Lists of Figures and Tables
\newif\ifXDU@Option@noloftpre\XDU@Option@noloftprefalse
\DeclareOption{noloftpre}{\XDU@Option@noloftpretrue}

% noloftgap = No Gap in Lists of Figures and Tables
\newif\ifXDU@Option@noloftgap\XDU@Option@noloftgapfalse
\DeclareOption{noloftgap}{\XDU@Option@noloftgaptrue}

% ragbtm = Ragged Bottom
\newif\ifXDU@Option@ragbtm\XDU@Option@ragbtmfalse
\DeclareOption{ragbtm}{\XDU@Option@ragbtmtrue}

%% others
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%
%% load class and packages
%%%%%%%%%%%%%%%%%%%%

%% book
%%
\newcommand\FakeBoldValue{3}
\newcommand\FakeSlantValue{0.2}
\PassOptionsToPackage{AutoFakeBold=\FakeBoldValue}{xeCJK}

\RequirePackage{etoolbox}

%% overleaf
\ifXDU@Option@overleaf
  \LoadClass[a4paper,zihao=-4,twoside,openright,punct,fontset=none]{ctexbook}
  \BeforeBeginEnvironment{document}{
  \newCJKfontfamily[zhsong]\songti{simsun.ttc}[Path=fonts/]
  \newCJKfontfamily[zhhei]\heiti{simhei.ttf}[Path=fonts/]
  \setCJKmainfont{simsun.ttc}
    [Path=fonts/,
    BoldFont={simsun.ttc},BoldFeatures={FakeBold=\FakeBoldValue},
    SlantedFont={simsun.ttc},SlantedFeatures={FakeSlant=\FakeSlantValue},
    BoldSlantedFont={simsun.ttc},BoldSlantedFeatures={FakeBold=\FakeBoldValue,FakeSlant=\FakeSlantValue},
    ItalicFont={simkai.ttf},
    BoldItalicFont={simkai.ttf},BoldItalicFeatures={FakeBold=\FakeBoldValue}]
  \setmainfont{times.ttf}
    [Path=fonts/,
    BoldFont=timesbd.ttf,
    ItalicFont=timesi.ttf,
    BoldItalicFont=timesbi.ttf]}
\else
  \LoadClass[a4paper,zihao=-4,twoside,openright,punct,fontset=windows]{ctexbook}
  \BeforeBeginEnvironment{document}{
  \setmainfont{Times New Roman}
  \setCJKmainfont{SimSun}
    [BoldFont={SimSun},BoldFeatures={FakeBold=\FakeBoldValue},
    SlantedFont={SimSun},SlantedFeatures={FakeSlant=\FakeSlantValue},
    BoldSlantedFont={SimSun},BoldSlantedFeatures={FakeBold=\FakeBoldValue,FakeSlant=\FakeSlantValue},
    ItalicFont={KaiTi},
    BoldItalicFont={KaiTi},BoldItalicFeatures={FakeBold=\FakeBoldValue}]}
\fi

\ifXDU@Option@ragbtm
  \BeforeBeginEnvironment{document}{\raggedbottom}
\fi

\RequirePackage{lmodern}

\RequirePackage{fancyhdr}

\RequirePackage{graphicx}
\graphicspath{{figures/}}

\RequirePackage{booktabs}

\RequirePackage{amsmath}

\RequirePackage{amsthm}

\RequirePackage{amssymb}

\RequirePackage{bm}

\RequirePackage{nicefrac}

\RequirePackage{diagbox}

\RequirePackage{multirow}

\RequirePackage[chapter]{algorithm}
\renewcommand{\ALG@name}{算法}

\RequirePackage{algorithmicx}

\RequirePackage{algpseudocode}

%% calc
\RequirePackage{calc}

%% ifthen
\RequirePackage{ifthen}

%% ifpdf
\RequirePackage{ifpdf}

\RequirePackage[titles]{tocloft}

\RequirePackage[labelsep=quad]{caption}

\RequirePackage{subfig}

\captionsetup[subfloat]{subrefformat=parens}

%% natbib & gbt7714
\RequirePackage[sort&compress,square,super]{natbib}
\RequirePackage{gbt7714}
\@ifpackagelater{gbt7714}{2020/03/04}
  {\PassOptionsToPackage{numbers}{natbib}}
  {\PassOptionsToPackage{numbers}{gbt7714}}

\RequirePackage{xurl}

%% hyperref
\RequirePackage[bookmarksnumbered,hidelinks]{hyperref}
\BeforeBeginEnvironment{document}{%
\hypersetup{%
pdftitle={\XDU@value@thesis@title},%
pdfauthor={\XDU@value@author@name},%
pdfsubject={\XDU@label@university\XDU@value@degreemark\XDU@value@cover@thesis}%
}}

%% config file
\AtEndOfPackage{\makeatletter\input{xdupgthesis.def}\makeatother}
\AtEndOfPackage{\makeatletter
\newcommand\setXDU@value@author@name[2]{\newcommand{\XDU@value@author@name}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@evalue@author@name[2]{\newcommand{\XDU@evalue@author@name}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@value@author@major[2]{\newcommand{\XDU@value@author@major}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@value@author@submajor[2]{\newcommand{\XDU@value@author@submajor}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@evalue@author@major[2]{\newcommand{\XDU@evalue@author@major}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@value@advisor@name[2]{\newcommand{\XDU@value@advisor@name}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@evalue@advisor@name[2]{\newcommand{\XDU@evalue@advisor@name}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@value@advisor@title[2]{\newcommand{\XDU@value@advisor@title}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@evalue@advisor@title[2]{\newcommand{\XDU@evalue@advisor@title}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@value@entadvisor@name[2]{\newcommand{\XDU@value@entadvisor@name}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@evalue@entadvisor@name[2]{\newcommand{\XDU@evalue@entadvisor@name}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@value@entadvisor@title[2]{\newcommand{\XDU@value@entadvisor@title}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@evalue@entadvisor@title[2]{\newcommand{\XDU@evalue@entadvisor@title}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@value@school[2]{\newcommand{\XDU@value@school}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@value@mprof@degree[2]{\newcommand{\XDU@value@mprof@degree}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@evalue@author@mprof@degree[2]{\newcommand{\XDU@evalue@author@mprof@degree}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@value@mprof@domain[2]{\newcommand{\XDU@value@mprof@domain}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@value@degree[2]{\newcommand{\XDU@value@degree}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@value@thesis@studentNo[2]{\newcommand{\XDU@value@thesis@studentNo}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@value@thesis@classification[2]{\newcommand{\XDU@value@thesis@classification}{\anonrvwinfo{#1}{#2}}}
\newcommand\setXDU@evalue@degree[2]{\newcommand{\XDU@evalue@degree}{#1}}
\newcommand\setXDU@value@degreemark[2]{\newcommand{\XDU@value@degreemark}{#1}}
\newcommand\setXDU@evalue@papertype[2]{\newcommand{\XDU@evalue@papertype}{#1}}
\newcommand\setXDU@value@thesis@title[2]{\newcommand{\XDU@value@thesis@title}{#1}}
\newcommand\setXDU@evalue@thesis@title[2]{\newcommand{\XDU@evalue@thesis@title}{#1}}
\newcommand\setXDU@value@thesis@confidential[2]{\newcommand{\XDU@value@thesis@confidential}{#1}}
\newcommand\setXDU@value@thesis@submit@date[2]{\newcommand{\XDU@value@thesis@submit@date}{#1}}
\newcommand\setXDU@evalue@thesis@submit@date[2]{\newcommand{\XDU@evalue@thesis@submit@date}{#1}}
\input{xdupgthesis.cfg}
\makeatother}
\AtEndOfPackage{\makeatletter\renewcommand{\numberline}[1]{%
\settowidth\@tempdimb{#1\hspace{0.25em}}%
\ifdim\@tempdima<\@tempdimb%
  \@tempdima=\@tempdimb%
\fi
\hb@xt@\@tempdima{\@cftbsnum #1\@cftasnum\hfil}\@cftasnumb}\makeatother}
\AtEndOfPackage{\makeatletter\@addtoreset{equation}{chapter}\makeatother}
\RequirePackage{xspace}
\xspaceaddexceptions{。？！，、；：“”‘’—….－-～·《》<>＿}
\AtEndOfPackage{\makeatletter \renewcommand{\figurename}{图} \renewcommand{\tablename}{表}
\newcommand{\figureref}[1]{图\xspace\ref{#1}\xspace}
\newcommand{\subfigureref}[1]{图\xspace\subref*{#1}\xspace}
\newcommand{\tableref}[1]{表\xspace\ref{#1}\xspace}
\newcommand{\algorithmref}[1]{算法\xspace\ref{#1}\xspace}
\newcommand{\equationref}[1]{公式(\ref{#1})}
\newcommand{\assumptionref}[1]{假设\xspace\ref{#1}\xspace}
\newcommand{\definitionref}[1]{定义\xspace\ref{#1}\xspace}
\newcommand{\propositionref}[1]{命题\xspace\ref{#1}\xspace}
\newcommand{\lemmaref}[1]{引理\xspace\ref{#1}\xspace}
\newcommand{\theoremref}[1]{定理\xspace\ref{#1}\xspace}
\newcommand{\axiomref}[1]{公理\xspace\ref{#1}\xspace}
\newcommand{\corollaryref}[1]{推论\xspace\ref{#1}\xspace}
\newcommand{\exerciseref}[1]{练习\xspace\ref{#1}\xspace}
\newcommand{\exampleref}[1]{例\xspace\ref{#1}\xspace}
\newcommand{\remarkref}[1]{注释\xspace\ref{#1}\xspace}
\newcommand{\problemref}[1]{问题\xspace\ref{#1}\xspace}
\newcommand{\conjectureref}[1]{猜想\xspace\ref{#1}\xspace}
\newcommand{\proofref}[1]{证明\xspace\ref{#1}\xspace}
\newcommand{\chapterref}[1]{第\ref{#1}章}
\newcommand{\sectionref}[1]{第\xspace\ref{#1}\xspace 节}
\newcommand{\appendixref}[1]{附录\xspace\ref{#1}\xspace}
\newcommand{\lineref}[1]{第\xspace\ref{#1}\xspace 行}
\def\@caption#1[#2]#3{%
   \par
   \addcontentsline{\csname ext@#1\endcsname}{#1}%
                   {\protect\numberline{\csname #1name\endcsname\hskip0.5em\csname the#1\endcsname}%
                   {\ignorespaces #2}}%
   \begingroup
   \@parboxrestore
   \if@minipage
   \@setminipage
   \fi
   \normalsize
   \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
   \endgroup}
 \makeatother}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   utilities

\DeclareRobustCommand{\XDU@toc@add}[1]
  {\cleardoublepage\phantomsection\addcontentsline{toc}{chapter}{#1}}

%% underline
\def\CJKunderlinecolor{}
\def\XDU@@underline[#1]#2{\underline{\hbox to #1{\hfill{#2}\hfill}}}
\DeclareRobustCommand{\XDU@underline}
  {\@ifnextchar[\XDU@@underline\underline}

\DeclareRobustCommand*{\XDU@bold}{\bfseries}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    font

%% family
\DeclareRobustCommand*{\XDU@font@st}{\songti}
\DeclareRobustCommand*{\XDU@font@ht}{\heiti}

%% size
\DeclareRobustCommand*{\XDU@font@zihao}[1]{\zihao{#1}\setlength{\baselineskip}{20pt}}
\renewcommand*{\baselinestretch}{1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    document setting

%% page ql head
\setlength{\textwidth}{\paperwidth}%
\setlength{\textheight}{\paperheight}%
\setlength\marginparwidth{0cm}%
\setlength\marginparsep{0cm}%
\addtolength{\textwidth}{-5.5cm}% 2.5+2.5+0.5
\setlength{\oddsidemargin}{3cm-1in-\hoffset}%
\setlength{\evensidemargin}{2.5cm-1in-\hoffset}%
\setlength{\topmargin}{2cm-1in-\voffset}%
\setlength{\headheight}{31pt}%
\setlength{\headsep}{0pt}%
\setlength{\textheight}{24cm}%
\setlength{\footskip}{\paperheight-3cm-6pt-\textheight-1.75cm}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    head and foot

%% remove header from empty page

%% label of even page header
\def\XDU@hdr@thesistitle
  {\XDU@label@university\XDU@value@degreemark\XDU@value@cover@thesis}

%% the double line under header
\newcommand{\makeheadrule}{%
\makebox[0pt][l]{\rule[9pt]{\headwidth}{0.5pt}}%
\rule[8pt]{\headwidth}{0.5pt}}
\renewcommand{\headrule}{%
{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
\makeheadrule}}

%% set header
\fancypagestyle{plain}{
    \pagestyle{fancy}
}

\pagestyle{fancy}
\fancyhf{}
\ifXDU@Option@psd
\else
  \fancyhead[CE]{{\XDU@font@st\XDU@font@zihao{5}\XDU@hdr@thesistitle}}
  \fancyhead[CO]{{\XDU@font@st\XDU@font@zihao{5}\nouppercase\leftmark}}
\fi
\fancyfoot[C]{{\XDU@font@st\XDU@font@zihao{-5}\thepage}}
%% par skip
%\parskip 0pt plus 6pt minus 0pt

%% section level
\setcounter{secnumdepth}{4}

%% chapter
\ctexset{chapter={name={\XDU@chapter@prenumber,\XDU@chapter@afternumber},
           number={\chinese{chapter}},
           format={\centering\XDU@font@ht\XDU@font@zihao{3}},
           nameformat={},
           numberformat={},
           aftername={\quad},
           titleformat={},
           beforeskip={6pt},
           afterskip={18pt},
           indent={0pt}}}

%% chapter without number
\DeclareRobustCommand{\XDU@nchapter}[1]{\chapter*{#1}\markboth{#1}{}}

%% section
\ctexset{section={name={,},
           number={\thesection},
           format={\raggedright\XDU@bold\XDU@font@st\XDU@font@zihao{-3}},
           nameformat={},
           numberformat={},
           aftername={\quad},
           titleformat={},
           beforeskip={18pt plus 0pt minus 0pt},
           afterskip={12pt},
           indent={0pt}}}

%% subsection
\ctexset{subsection={name={,},
           number={\thesubsection},
           format={\raggedright\XDU@bold\XDU@font@st\XDU@font@zihao{4}},
           nameformat={},
           numberformat={},
           aftername={\quad},
           titleformat={},
           beforeskip={12pt plus 0pt minus 0pt},
           afterskip={6pt},
           indent={24bp}}}

%% subsubsection
\ctexset{subsubsection={name={（,）},
           number={\arabic{subsubsection}},
           format={\raggedright\XDU@bold\XDU@font@st\XDU@font@zihao{-4}},
           nameformat={},
           numberformat={},
           aftername={},
           titleformat={},
           beforeskip={6pt plus 0pt minus 0pt},
           afterskip={0pt},
           indent={48bp}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% redefine equation number format
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    chinese  cover
%% ql first
\DeclareRobustCommand{\XDU@make@cover}
{{\parindent=0pt\thispagestyle{empty}%
    \normalfont\XDU@font@st\XDU@font@zihao{2}\setlength{\baselineskip}{30pt}%
    \makebox[\textwidth]{\rule{0pt}{12cm}}
    \rule[-3.2cm]{0pt}{3.2cm}\parbox[t]{\textwidth}{%
    \begin{center}%
        {\XDU@bold\XDU@value@thesis@title}%
    \end{center}%
    }
    \ifXDU@Option@mprof
      \makebox[\textwidth]{\rule{0pt}{3.5cm-\baselineskip}}
    \else
      \makebox[\textwidth]{\rule{0pt}{3.5cm}}
    \fi
    \rule[-3.2cm+15pt]{0pt}{3.2cm}\hspace{3cm}\parbox[t]{9cm}{%
    \XDU@font@zihao{4}\setlength{\baselineskip}{30pt}%
    % 存储标签与下划线总长度
    \newlength{\alllength}
    \setlength{\alllength}{9cm}
    % 存储下划线长度
    \newlength{\linelength}
    % 作者姓名
    \setlength{\linelength}{\alllength-\widthof{\XDU@label@fcover@author}}
    \XDU@bold\XDU@font@ht{\XDU@label@fcover@author}\XDU@font@st\XDU@underline[\linelength]{\XDU@value@author@name}\\%
    \ifXDU@Option@mprof
      % 学校导师姓名、职称
      \setlength{\linelength}{\alllength-\widthof{\XDU@label@fcover@mprof@advisor}}
      \XDU@bold\XDU@font@ht{\XDU@label@fcover@mprof@advisor}\XDU@font@st\XDU@underline[\linelength]{\XDU@value@advisor@name~\XDU@value@advisor@title}\\%
      % 企业导师姓名、职称
      \setlength{\linelength}{\alllength-\widthof{\XDU@label@fcover@mprof@entadvisor}}
      \XDU@bold\XDU@font@ht{\XDU@label@fcover@mprof@entadvisor}\XDU@font@st\XDU@underline[\linelength]{\XDU@value@entadvisor@name~\XDU@value@entadvisor@title}\\%
      % 申请学位类别
      \setlength{\linelength}{\alllength-\widthof{\XDU@label@fcover@degree}}
      \XDU@bold\XDU@font@ht{\XDU@label@fcover@degree}\XDU@font@st\XDU@underline[\linelength]{\XDU@value@mprof@degree}%
    \else
      % 指导教师姓名、职称
      \setlength{\linelength}{\alllength-\widthof{\XDU@label@fcover@aprof@advisor}}
      \XDU@bold\XDU@font@ht{\XDU@label@fcover@aprof@advisor}\XDU@font@st\XDU@underline[\linelength]{\XDU@value@advisor@name~\XDU@value@advisor@title}\\%
      % 申请学位类别
      \setlength{\linelength}{\alllength-\widthof{\XDU@label@fcover@degree}}
      \XDU@bold\XDU@font@ht{\XDU@label@fcover@degree}\XDU@font@st\XDU@underline[\linelength]{\XDU@value@degree}%
    \fi
    }}
\clearpage\thispagestyle{empty}\parindent=2\ccwd\cleardoublepage}

\DeclareRobustCommand{\XDU@make@title}
  {{\cleardoublepage\parindent=0pt\thispagestyle{empty}%

    \normalfont\XDU@font@st\renewcommand{\baselinestretch}{1.2}\zihao{5}%
    \rule{0pt}{1.35cm}\parbox[b]{4.5cm}{
        \XDU@bold\XDU@label@cover@UDC\XDU@underline[73pt]{\XDU@value@thesis@UDC}\par%
        \vspace{2pt}%
        \XDU@bold\XDU@label@cover@classification\XDU@underline[73pt]{\XDU@value@thesis@classification}%
    }
    \hfill\parbox[b]{4.5cm}{
        \XDU@bold\XDU@label@cover@studentNo\XDU@underline[83pt]{\XDU@value@thesis@studentNo}\par%
        \vspace{2pt}%
        \XDU@bold\XDU@label@cover@confidential\XDU@underline[83pt]{\XDU@value@thesis@confidential}%
    }

\renewcommand{\baselinestretch}{1}%
    \vspace{2.05cm}%
    \makebox[\textwidth]{\rule{0pt}{4.5cm}\shortstack[c]{
        \XDU@bold\XDU@font@ht\XDU@font@zihao{1}\setlength{\baselineskip}{30pt}\XDU@label@university\\%
        \vspace{60pt} \\%
        \XDU@bold\XDU@font@st\XDU@font@zihao{-1}\setlength{\baselineskip}{30pt}\XDU@value@degreemark\XDU@value@cover@thesis%
    }}
    \rule{0pt}{2.7cm}%
    \rule[-3.2cm]{0pt}{3.2cm}\parbox[t]{\textwidth}{
    \begin{center}%
     \XDU@bold\XDU@font@zihao{2}\setlength{\baselineskip}{30pt}\XDU@value@thesis@title%
    \end{center}%
    }

    \vspace{2.5cm}%
    \hspace{4.5cm}\parbox{10.5cm}{
        \XDU@font@st\XDU@font@zihao{4}\setlength{\baselineskip}{32pt}%
        % 作者姓名
        {\XDU@bold\XDU@label@cover@author}\XDU@value@author@name\\%
        \ifXDU@Option@mprof
          % 领域
          {\XDU@bold\XDU@label@cover@mprof@domain}\XDU@value@mprof@domain\\%
          % 学位类别
          {\XDU@bold\XDU@label@cover@degree}\XDU@value@mprof@degree\\%
          % 学校导师姓名、职称
          {\XDU@bold\XDU@label@cover@mprof@advisor}\XDU@value@advisor@name~\XDU@value@advisor@title\\%
          % 企业导师姓名、职称
          {\XDU@bold\XDU@label@cover@mprof@entadvisor}\XDU@value@entadvisor@name~\XDU@value@entadvisor@title\\%
        \else
          % 一级学科
          {\XDU@bold\XDU@label@cover@major}\XDU@value@author@major\\%
          % 二级学科（研究方向）
          {\XDU@bold\XDU@label@cover@submajor}\XDU@value@author@submajor\\%
          % 学位类别
          {\XDU@bold\XDU@label@cover@degree}\XDU@value@degree\\%
          % 指导教师姓名、职称
          {\XDU@bold\XDU@label@cover@aprof@advisor}\XDU@value@advisor@name~\XDU@value@advisor@title\\%
        \fi
        {\XDU@bold\XDU@label@cover@school}\XDU@value@school\\%
        {\XDU@bold\XDU@label@cover@submit@date}\XDU@value@thesis@submit@date%
    }
   \clearpage\thispagestyle{empty}%
   \renewcommand{\baselinestretch}{1}%
   \parindent=2\ccwd\cleardoublepage}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    english  cover

\DeclareRobustCommand{\XDU@make@titleenglish}
  {{\cleardoublepage\parindent=0pt\thispagestyle{empty}%
    \normalfont\XDU@font@st%

    \rule[-3.5cm]{0pt}{3.5cm}\parbox[t]{\textwidth}{%
    \XDU@font@zihao{2}\setlength{\baselineskip}{30pt}%
    \begin{center}%
        {\XDU@bold\XDU@evalue@thesis@title}%
    \end{center}%
    }
    \rule{0pt}{2.5cm}%
    \rule[-5.5cm]{0pt}{5.5cm}\parbox[t]{\textwidth}{%
    \XDU@font@zihao{3}\setlength{\baselineskip}{30pt}%
    \begin{center}%
A\space\XDU@evalue@papertype\space submitted to\par\XDU@elabel@university\par%
in partial fulfillment of the requirements \par for the degree of\space\XDU@evalue@degree%
    \ifXDU@Option@mprof
      \par in\space\XDU@evalue@author@mprof@degree%
    \else
      \par in\space\XDU@evalue@author@major%
    \fi
    \end{center}%
    }
    \ifXDU@Option@mprof
      \rule{0pt}{\textheight-3.5cm-2.5cm-5.5cm-4.5cm-12bp-12bp-30pt}%
    \else
      \rule{0pt}{7.2cm}%
    \fi
    \rule[-4.5cm]{0pt}{4.5cm}\parbox[t]{\textwidth}{%
    \XDU@font@zihao{3}\setlength{\baselineskip}{30pt}%
    \begin{center}%
By \par%
\XDU@evalue@author@name\par%
\ifXDU@Option@mprof
  % 导师姓名列宽度
  \newlength{\firstlength}
  \setlength{\firstlength}{\maxof{\widthof{\XDU@evalue@advisor@name}}{\widthof{\XDU@evalue@entadvisor@name}}}
  % 导师职称栏宽度
  \newlength{\secondlength}
  \setlength{\secondlength}{\maxof{\widthof{\XDU@evalue@advisor@title}}{\widthof{\XDU@evalue@entadvisor@title}}}
  % 学校导师姓名、职称
  \XDU@elabel@cover@advisor\makebox[\firstlength][l]{\XDU@evalue@advisor@name}{~~Title:~}\makebox[\secondlength][l]{\XDU@evalue@advisor@title}\par%
  % 企业导师姓名、职称
  \XDU@elabel@cover@advisor\makebox[\firstlength][l]{\XDU@evalue@entadvisor@name}{~~Title:~}\makebox[\secondlength][l]{\XDU@evalue@entadvisor@title}\par%
\else
  % 指导教师姓名、职称
  \XDU@elabel@cover@advisor\XDU@evalue@advisor@name~~{Title:~}\XDU@evalue@advisor@title\par%
\fi
% 提交日期
\XDU@evalue@thesis@submit@date\par%
    \end{center}%
    }
   \clearpage\thispagestyle{empty}%
   \parindent=2\ccwd\cleardoublepage}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    statement and copyright

\DeclareRobustCommand{\XDU@make@statementandcopyright}
  {{\cleardoublepage\parindent=0pt\thispagestyle{empty}%
  \normalfont\XDU@font@st%
   \begin{center}%
   \bfseries\XDU@font@zihao{4}%
     \XDU@label@stat@statement%
   \end{center}%
   \XDU@font@zihao{-4}%
   \hspace*{2em}\parindent=2\ccwd\XDU@value@stat@statement\parindent=0pt%
  \vskip 20pt%
   \hspace*{2em}\XDU@lable@stat@auther\XDU@underline[100pt]{}\hspace*{1em}%
    \hfill \XDU@lable@stat@date\XDU@underline[100pt]{}\hspace*{1em}
  \vskip \stretch{6}%
   \begin{center}%
     \bfseries\XDU@font@zihao{4}%
     \XDU@lable@stat@copyright%
   \end{center}%
   \XDU@font@zihao{-4}%
   \hspace*{2em}\parindent=2\ccwd\XDU@value@stat@copyright\parindent=0pt%
  \vskip 20pt%
   \normalfont\XDU@font@st\XDU@font@zihao{-4}%
   \hspace*{2em}\XDU@lable@stat@auther\XDU@underline[100pt]{}\hspace*{1em}%
    \hfill \XDU@lable@stat@advisor\XDU@underline[100pt]{}\hspace*{1em}%
  \vskip 20pt%
   \hspace*{2em}\XDU@lable@stat@date\XDU@underline[100pt]{}\hspace*{1em}%
    \hfill \XDU@lable@stat@date\XDU@underline[100pt]{}\hspace*{1em}%
  \vskip \stretch{1}%
  \clearpage\thispagestyle{empty}%
  \parindent=2\ccwd\cleardoublepage}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    abstract

%% chinese abstract
\newenvironment{abstract}
  {\XDU@toc@add{\XDU@toc@abstract}%
   \XDU@nchapter{\XDU@label@abstract}\XDU@font@zihao{-4}}
  {\cleardoublepage}

%% chinese keywords
\DeclareRobustCommand{\keywords}[1]
  {{\parindent=0pt\vspace{20pt}%
   \normalfont\XDU@font@st\bfseries\XDU@font@zihao{-4}%
   \XDU@label@keywords%
   \normalfont\XDU@font@st\XDU@font@zihao{-4}%
   {#1}\parindent=2\ccwd}}

%% english abstract
\newenvironment{englishabstract}
  {\XDU@toc@add{\XDU@etoc@abstract}\XDU@nchapter{\XDU@elabel@abstract}%
   \vspace{-2ex}\parindent=0pt\normalfont\XDU@font@zihao{-4}%
   \parindent=0pt}
  {\cleardoublepage}

%% english keywords
\DeclareRobustCommand{\englishkeywords}[1]
  {{\parindent=0pt\vspace{2ex}%
   \normalfont\XDU@font@st\bfseries\XDU@font@zihao{-4}%
   \XDU@elabel@keywords~%
   \normalfont\XDU@font@st\XDU@font@zihao{-4}%
   {#1}\parindent=2\ccwd}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    content
    % loft
    \ifXDU@Option@noloftpre
    \else
      \newlength{\tmplen}
      \renewcommand{\cftfigpresnum}{\figurename}
      \settowidth{\tmplen}{\cftfigpresnum}
      \addtolength{\cftfignumwidth}{\tmplen}
      \renewcommand{\cfttabpresnum}{\tablename}
      \settowidth{\tmplen}{\cfttabpresnum}
      \addtolength{\cfttabnumwidth}{\tmplen}
    \fi
    \setlength{\cftfigindent}{0em}
    \setlength{\cfttabindent}{0em}

    \setlength{\cftbeforechapskip}{0pt}
    \setlength{\cftbeforesecskip}{0pt}
    \setlength{\cftbeforesubsecskip}{0pt}
    \renewcommand{\cftchapfont}{\XDU@font@ht\XDU@font@zihao{-4}}
    \renewcommand{\cftsecfont}{\XDU@font@st\XDU@font@zihao{-4}}
    \renewcommand{\cftsubsecfont}{\XDU@font@st\XDU@font@zihao{-4}}
    \renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
    \renewcommand{\cftchapdotsep}{\cftdotsep}
    \renewcommand{\cftchappagefont}{\XDU@font@st\XDU@font@zihao{-4}}
    \renewcommand{\cftsecpagefont}{\XDU@font@zihao{-4}}
    \renewcommand{\cftsubsecpagefont}{\XDU@font@zihao{-4}}
    \renewcommand{\cftfigfont}{\XDU@font@st\XDU@font@zihao{-4}}
    \renewcommand{\cftloftitlefont}{\XDU@font@st\XDU@font@zihao{-4}}
    \renewcommand{\cftfigpagefont}{\XDU@font@st\XDU@font@zihao{-4}}
    \renewcommand{\cfttabfont}{\XDU@font@st\XDU@font@zihao{-4}}
    \renewcommand{\cftlottitlefont}{\XDU@font@st\XDU@font@zihao{-4}}
    \renewcommand{\cfttabpagefont}{\XDU@font@st\XDU@font@zihao{-4}}

    \setlength{\abovecaptionskip}{6bp}
    \setlength{\belowcaptionskip}{0pt}
    \renewcommand{\captionfont}{\XDU@font@st\XDU@font@zihao{5}}

%% list of figures
\ctexset{listfigurename={\XDU@label@listoffigures}}
\DeclareRobustCommand{\XDU@listoffigures}
  {\XDU@toc@add{\XDU@toc@listoffigures}%
    \ifXDU@Option@noloftgap
      \addtocontents{lof}{\vspace{10pt}}%
      {\renewcommand{\addvspace}[1]{}\listoffigures}
    \else
      \listoffigures
    \fi
  }

%% list of tables
\ctexset{listtablename={\XDU@label@listoftables}}
\DeclareRobustCommand{\XDU@listoftables}
  {\XDU@toc@add{\XDU@toc@listoftables}%
    \ifXDU@Option@noloftgap
      \addtocontents{lot}{\vspace{10pt}}%
      {\renewcommand{\addvspace}[1]{}\listoftables}
    \else
      \listoftables
    \fi
  }

\RequirePackage{tabulary}

\RequirePackage{tabularx}
\RequirePackage{ltablex}
\keepXColumns

\RequirePackage{environ}

\RequirePackage{makecell}

% Define Table Font Size
\let\oldtabular\tabular
\let\endoldtabular\endtabular
\renewenvironment{tabular}
{\small\oldtabular}
{\endoldtabular}

\let\oldtabularx\tabularx
\let\endoldtabularx\endtabularx
\renewenvironment{tabularx}
{\small\oldtabularx}
{\endoldtabularx}

\let\oldtabulary\tabulary
\let\endoldtabulary\endtabulary
\renewenvironment{tabulary}
{\small\oldtabulary}
{\endoldtabulary}

%% list of Symbols
\NewEnviron{symbollist}[1]
{
  \ifXDU@Option@psd
  \else
    \parindent=0pt\XDU@toc@add{\XDU@toc@symbollist@title}%
    \XDU@nchapter{\XDU@label@symbollist@title}\parindent=.5\ccwd%
    \renewcommand{\arraystretch}{1.6666666667}
    \renewcommand{\small}{\zihao{-4}}
    \begin{tabularx}{\linewidth}{#1}
    \BODY
    \end{tabularx}\parindent=2\ccwd\cleardoublepage
    \renewcommand{\small}{\zihao{5}}
  \fi
}

%% list of abbreviations
\NewEnviron{abbreviationlist}[1]
{
  \ifXDU@Option@psd
  \else
    \parindent=0pt\XDU@toc@add{\XDU@toc@abbreviationlist@title}%
    \XDU@nchapter{\XDU@label@abbreviationlist@title}\parindent=.5\ccwd%
    \renewcommand{\arraystretch}{1.6666666667}
    \renewcommand{\small}{\zihao{-4}}
    \begin{tabularx}{\linewidth}{#1}
    \BODY
    \end{tabularx}\parindent=2\ccwd\cleardoublepage
    \renewcommand{\small}{\zihao{5}}
  \fi
}

%% content
\ctexset{contentsname={\XDU@label@content}}
\DeclareRobustCommand{\XDU@tableofcontents}
  {\tableofcontents}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    referrence
\renewcommand{\UrlFont}{\XDU@font@zihao{5}}
\ctexset{bibname={\XDU@label@ref@title}}
\@ifpackagelater{gbt7714}{2020/03/04}
  {\bibliographystyle{gbt7714-numerical}}
  {}

\renewenvironment{thebibliography}[1]
  {\XDU@toc@add{\XDU@toc@ref@title}%
   \XDU@nchapter{\bibname}%
   \XDU@font@zihao{5}%
   \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
   \list{\@biblabel{\@arabic\c@enumiv}}%
    {\setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
    \settowidth\labelwidth{\@biblabel{#1}}%
     \leftmargin\labelwidth\advance\leftmargin\labelsep%
     \@openbib@code\usecounter{enumiv}\let\p@enumiv\@empty%
     \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy\clubpenalty4000\@clubpenalty\clubpenalty%
   \widowpenalty4000\sfcode`\.\@m}
  {\def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
   \endlist}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    thanks

\RenewEnviron{thanks}
{
  \ifXDU@Option@psd
  \else
    \XDU@toc@add{\XDU@toc@thanks}%
    \XDU@nchapter{\XDU@label@thanks}
    \BODY
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    resume

\NewEnviron{resume}
{
  \ifXDU@Option@psd
  \else
    \parindent=0pt\XDU@toc@add{\XDU@toc@resume@title}%
    \XDU@nchapter{\XDU@label@resume@title}%
    \renewcommand{\thesection}{\arabic{section}}\parindent=2\ccwd
    \BODY
    \cleardoublepage
  \fi
}

%% resume list
\newcounter{XDU@counter@resumelistcounter}
\newenvironment{resumelist}[1]
  {{\subsection*{\textbf{#1}}\parindent=2\ccwd}%
   \begin{list}{[\arabic{XDU@counter@resumelistcounter}]}
    {\usecounter{XDU@counter@resumelistcounter}
     \setcounter{XDU@counter@resumelistcounter}{0}
     \setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
     \parindent=0pt\normalfont\XDU@font@st\XDU@font@zihao{-4}
     \setlength{\leftmargin}{2\labelwidth}}}
  {\end{list}}

\newenvironment{resumelist*}
  {\begin{list}{}
    {\setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
    \parindent=0pt\normalfont\XDU@font@st\XDU@font@zihao{-4}
     \setlength{\leftmargin}{\labelwidth}}}
  {\end{list}}

%% resume list item
\DeclareRobustCommand{\resumelistitem}{\item{}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    thesis structure

%% front matter
\DeclareRobustCommand{\XDUfrontmatter}
{
  \ifXDU@Option@psd
  \else
    \XDU@make@cover%
    \XDU@make@title%
    \XDU@make@titleenglish%
    \XDU@make@statementandcopyright%
  \fi
  \frontmatter\pagenumbering{Roman}%
  \setlength{\baselineskip}{20pt}
}

%% premain matter
\DeclareRobustCommand{\XDUpremainmatter}
{
  \ifXDU@Option@psd
  \else
    \XDU@listoffigures\cleardoublepage%
    \XDU@listoftables\cleardoublepage%
  \fi
}
%% main matter
\DeclareRobustCommand{\XDUmainmatter}
{
  \ifXDU@Option@psd
  \else
    \XDU@tableofcontents\cleardoublepage%
  \fi
  \mainmatter
}

% appendix
\NewEnviron{appendixes}
{
  \ifXDU@Option@psd
  \else
    \appendix
    \BODY
  \fi
}

%% back matter
\RequirePackage{bibentry}
\DeclareRobustCommand{\XDUbackmatter}
{
  \backmatter{}
  \ifXDU@Option@psd
    \nobibliography{xdupgthesis}{}
  \else
    \bibliography{xdupgthesis}{}
  \fi
}

\newcommand{\anonrvwinfo}[2]
{
  \ifXDU@Option@anonrvw
    #2
  \else
    #1
  \fi
}

% redefine float fraction
\renewcommand{\topfraction}{.8}
\renewcommand{\floatpagefraction}{.8}
