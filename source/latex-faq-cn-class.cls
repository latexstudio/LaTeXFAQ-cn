% Copyright (C) 2018 by latexstudio <http://www.latexstudio.net>
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%

\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\ProvidesExplClass{latex-faq-cn-class}{2018/08/09}{0.1}{Chinese LaTeX FAQ document class}

% 见 https://github.com/CTeX-org/ctex-kit/issues/286
\tex_XeTeXgenerateactualtext:D = 1

\PassOptionsToPackage { log-declarations = false } { xparse   }
\PassOptionsToPackage { no-math                  } { fontspec }
\RequirePackage { xparse, xtemplate, l3keys2e }

\cs_new:Npn \__faqcn_msg_new:nn  { \msg_new:nnn      { faqcn } }
\cs_new:Npn \__faqcn_warning:nnn { \msg_warning:nnnn { faqcn } }

% 文档类选项
\bool_new:N \g_faqcn_use_customized_fonts_bool
\keys_define:nn { faqcn / option }
  {
    use-customized-fonts .bool_gset:N = \g_faqcn_use_customized_fonts_bool,
    use-customized-fonts .initial:n   = true
  }
\ProcessKeysOptions { faqcn / option }

% 根据是否使用自定义字体来决定 ctex 文档类的载入方式
\bool_if:NTF \g_faqcn_use_customized_fonts_bool
  { \LoadClass [ fontset = none ] { ctexart } }
  { \LoadClass { ctexart } }

% 载入相关宏包
\PassOptionsToPackage { table   } { xcolor }
\PassOptionsToPackage { hyphens } { url    }
\RequirePackage
  {
    amsmath,
    caption,
    diagbox,
    dirtree,
    enumitem,
    fancyvrb,
    fontawesome,
    geometry,
    graphicx,
    hologo,
    listings,
    % longtable,
    % tabularx,
    unicode-math,
    xcolor,
    xunicode,
    xurl,
    zref-abspage,
    hyperref
  }

% 西文字体
\bool_if:NT \g_faqcn_use_customized_fonts_bool
  {
    \setmainfont { libertinusserif }
      [
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-italic,
        BoldItalicFont = *-bolditalic
      ]
    \setsansfont { Roboto }
      [
        Extension      = .ttf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Italic,
        BoldItalicFont = *-BoldItalic
      ]
    \setmonofont { cmun }
      [
        Extension   = .otf,
        UprightFont = * btl,
        BoldFont    = * tb,
        SlantedFont = * bto,
        HyphenChar  = None
      ]
    % \setmonofont { RobotoMono }
    %   [
    %     Extension      = .ttf,
    %     UprightFont    = *-Regular,
    %     BoldFont       = *-Bold,
    %     ItalicFont     = *-Italic,
    %     BoldItalicFont = *-BoldItalic
    %   ]
    \setmathfont { libertinusmath-regular.otf }
  }

% 中文字体

% 设置思源字体系列。由于命名比较复杂，这里需要做多次判断
% TTC 格式封装的思源字体中，简体中文位于第 3 个，因此 FontIndex = 2
% #1: \setCJK...font 命令
% #2, #3, #4, #5: OTC/OTF 文件名
% #6: Super OTC 字体名
% #7: 选项
\cs_new_protected:Npn \faqcn_set_cjk_font:Nnnnnnn #1#2#3#4#5#6#7
  {
    \bool_set_false:N \l__source_han_super_otc_bool
    \__faqcn_source_han_otc_otf:Nnnnnn #1 {#2} {#3} {#4} {#5} {#7}
    \bool_if:NT \l__source_han_super_otc_bool
      { \__faqcn_source_super_otc:Nnn #1 {#6} {#7} }
  }
\cs_new_protected:Npn \__faqcn_source_han_otc_otf:Nnnnnn #1#2#3#4#5#6
  {
    \IfFontExistsTF { #2-Regular.ttc }
      { #1 {#2} [ Extension = .ttc, FontIndex = 2, #6 ] }
      {
        \IfFontExistsTF { #3-Regular.ttc }
          { #1 {#3} [ Extension = .ttc, FontIndex = 2, #6 ] }
          {
            \IfFontExistsTF { #4-Regular.otf }
              { #1 {#4} [ Extension = .otf, #6 ] }
              {
                \IfFontExistsTF { #5-Regular.otf }
                  { #1 {#5} [ Extension = .otf, #6 ] }
                  { \bool_set_true:N \l__source_han_super_otc_bool }
              }
          }
      }
  }
\bool_new:N \l__source_han_super_otc_bool
\cs_new_protected:Npn \__faqcn_source_super_otc:Nnn #1#2#3
  {
    \IfFontExistsTF {#2}
      { #1 {#2} [#3] }
      { \BOOM }
  }
\bool_if:NT \g_faqcn_use_customized_fonts_bool
  {
    \faqcn_set_cjk_font:Nnnnnnn \setCJKmainfont
      { NotoSerifCJK } { SourceHanSerif } { NotoSerifCJKsc } { SourceHanSerifSC }
      { Source~ Han~ Serif~ SC }
      {
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Regular,
        BoldItalicFont = *-Bold
      }
    \faqcn_set_cjk_font:Nnnnnnn \setCJKsansfont
      { NotoSansCJK } { SourceHanSans } { NotoSansCJKsc } { SourceHanSansSC }
      { Source~ Han~ Sans~ SC }
      {
        UprightFont    = *-Medium,
        BoldFont       = *-Bold,
        ItalicFont     = *-Medium,
        BoldItalicFont = *-Bold
      }
    \faqcn_set_cjk_font:Nnnnnnn \setCJKmonofont
      { NotoSansCJK } { SourceHanSans } { NotoSansCJKsc } { SourceHanSansSC }
      { Source~ Han~ Sans~ SC }
      {
        UprightFont    = *-Light,
        BoldFont       = *-Medium,
        AutoFakeSlant  = 0.2
      }
  }

% 其他字体
\bool_if:NTF \g_faqcn_use_customized_fonts_bool
  {
    % 用于代码环境
    \newfontfamily \CodeFont { RobotoMono }
      [
        Extension      = .ttf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-Italic,
        BoldItalicFont = *-BoldItalic
      ]
    % 用于 METAFONT logo 等
    % 只选择 10 号
    \newfontfamily \LogoFont { ffm }
      [
        Extension      = .otf,
        UprightFont    = * r10,
        BoldFont       = * b10,
        ItalicFont     = * o10,
        BoldItalicFont = * bo10
      ]
  }
  {
    \cs_set_eq:NN \CodeFont \ttfamily
    \cs_set_eq:NN \LogoFont \sffamily
  }

% 中文版式设置
\ctexset
  {
    % punct = kaiming,
    section / number = \Alph { section },
    section / format = \Large \normalfont \sffamily \centering
  }

% 列表环境
\setlist
  {
    itemsep       = 0 pt,
    parsep        = 0 pt,
    topsep        = 0 pt,
    listparindent = \parindent,
    leftmargin    = \parindent,
    itemindent    = 0 pt
  }

% 页面尺寸
\geometry
  {
    paper      = a4paper,
    vmargin    = 2.54 cm,
    hmargin    = 3.18 cm,
    headheight = 15 pt,
    % showframe
  }

% 浮动体标题样式
\captionsetup [ figure ]
  {
    font     = small,
    labelsep = quad
  }
\captionsetup [ table  ]
  {
    font     = { small, sf },
    labelsep = quad
  }

% hyperref 有关设置
\hypersetup
  {
    bookmarksnumbered = true,
    colorlinks        = true,
    pdftitle          = \faqTitle,
    pdfauthor         = \faqAuthor
  }

% 脚注
\cs_set:Npn \thefootnote { \faqcn_footnote_symbol:n { \int_use:N \c@footnote } }
\cs_new_protected:Npn \faqcn_footnote_symbol:n #1
  {
    \int_compare:nTF { #1 >= 21 }
      {
        \int_compare:nTF { #1 >= 47 }
          { \symbol { \int_eval:n { "24B6 - 47 + #1 } } }
          { \symbol { \int_eval:n { "24D0 - 21 + #1 } } }
      }
      { \symbol { \int_eval:n { "2460 - 1 + #1 } } }
  }
\cs_set:Npn \@makefntext #1
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn { 1.5 em } { \@thefnmark \hfil }
    #1
  }

% 问答环境
% #1: 选项
% #2: 长名称
% #3: 短名称
\NewDocumentCommand \faq { o m m }
  {
    % TODO: 选项准备仿照 l3doc，如 added、updated 选项
    \faqcn_faq:nn {#2} {#3}
  }
\cs_new_protected:Npn \faqcn_faq:nn #1#2
  {
    \tl_set:Nn \l__faqcn_faq_title_tl { \textbf { \int_use:N \g_faqcn_count_int \quad #1 } }
    \tl_if_empty:nTF {#2}
      {
        \tl_set:Nn \l__faqcn_faq_name_tl  { faq: no-tag- \int_use:N \g_faqcn_no_tag_count_int }
        \int_gincr:N \g_faqcn_no_tag_count_int
      }
      { \tl_set:Nn \l__faqcn_faq_name_tl  { faq: #2 } }
    % 问题之间留空
    \skip_vertical:n { 2 ex }
    % 排版标题，以及交叉引用
    \hypertarget {  \tl_use:N \l__faqcn_faq_name_tl } { \noindent \tl_use:N \l__faqcn_faq_title_tl }
    \zref@labelbylist { \tl_use:N \l__faqcn_faq_name_tl } { faqcn }
    % PDF 书签
    \pdfbookmark [ 2 ]
      { \int_use:N \g_faqcn_count_int \ #1 }
      { \tl_use:N \l__faqcn_faq_name_tl }
    \int_gincr:N \g_faqcn_count_int
    \par
  }
\tl_new:N \l__faqcn_faq_title_tl
\tl_new:N \l__faqcn_faq_name_tl
\int_new:N \g_faqcn_count_int
\int_new:N \g_faqcn_no_tag_count_int
\int_set_eq:NN \g_faqcn_count_int        \c_one
\int_set_eq:NN \g_faqcn_no_tag_count_int \c_one

\zref@newlist { faqcn }
\zref@newprop { faq@num } { \int_use:N \g_faqcn_count_int }
\zref@addprop { faqcn } { faq@num }

% 问答环境交叉引用
\NewDocumentCommand \faqref { m }
  { 问题 \nobreakspace \faqcn_ref:n {#1} }
\cs_new_protected:Npn \faqcn_ref:n #1
  { \hyperlink { faq @ #1 } { \zref@extract { faq: #1 } { faq@num } } }

% 问答环境参考文献
\NewDocumentEnvironment { reference } { }
  {
    \skip_vertical:n { 2 ex }
    \small
    \noindent \textsf{ 参考文献 } \marginpar { \raggedleft \faBook }
    \enumerate [ topsep = 0pt ]
    % \ignorespaces
  }
  { \endenumerate }

\NewDocumentEnvironment { note } { }
  {
    \skip_vertical:n { 2 ex }
    \small
    \noindent \textsf{ 注意 } \marginpar { \raggedleft \faWarning }
    \par
    % \ignorespaces
  }
  { }

\reversemarginpar

% TeX logo 命令
\clist_map_inline:nn
  {
    TeX, eTeX, pdfTeX, XeTeX, LuaTeX,
    LaTeX, LaTeXe, LaTeXTeX, ConTeXt,
    pdfLaTeX, LuaLaTeX, XeLaTeX,
    BibTeX, MetaFun,
    MiKTeX
  }
  { \cs_set:cpn {#1} { \hologo {#1} } }
\clist_map_inline:nn
  { METAFONT, METAPOST }
  {
    \cs_set_protected:cpn {#1}
      {
        \group_begin:
          \LogoFont #1
        \group_end:
      }
  }

\cs_set:Npn \pTeX     { p\TeX         }
\cs_set:Npn \pLaTeX   { p\LaTeX       }
\cs_set:Npn \ApTeX    { Ap\TeX        }
\cs_set:Npn \ApLaTeX  { Ap\LaTeX      }
\cs_set:Npn \TeXLive  { \TeX{}~ Live  }
\cs_set:Npn \MacTeX   { Mac\TeX       }
\cs_set:Npn \proTeXt  { pro\TeX t     }
\cs_set:Npn \PlainTeX { Plain~ \TeX   }
\cs_set:Npn \TikZ     { Ti\textit{k}Z }

% 宏包与文档类
% TODO
\DeclareRobustCommand\cs[1]{\texttt{\char`\\#1}}
\DeclareRobustCommand\meta[1]{%
     \ensuremath\langle
     \ifmmode \expandafter \nfss@text \fi
     {%
      \meta@font@select
      \edef\meta@hyphen@restore
        {\hyphenchar\the\font\the\hyphenchar\font}%
      \hyphenchar\font\m@ne
      \language\l@nohyphenation
      #1\/%
      \meta@hyphen@restore
     }\ensuremath\rangle
}
\def\meta@font@select{\itshape}
\newcommand\Arg[1]
  { \texttt{\char`\{} \meta{#1} \texttt{\char`\}} }
\providecommand\marg[1]{ \Arg{#1} }
\providecommand\oarg[1]{ \texttt[ \meta{#1} \texttt] }
\providecommand\parg[1]{ \texttt( \meta{#1} \texttt) }
\DeclareRobustCommand \file {\nolinkurl}
\DeclareRobustCommand \env {\texttt}
\DeclareRobustCommand \pkg {\textsf}
\DeclareRobustCommand \cls {\textsf}

% 强调
\cs_set_eq:NN \strong \textsf

% 英文书名，应该用意大利体
\cs_new_eq:NN \book \emph

% 允许使用 |...| 作为行内抄录
\AtBeginDocument
  { \DefineShortVerb   { \| } }
\AtEndDocument
  { \UndefineShortVerb { \| } }
% 公式中仍会用到（vl = vertical line）
\cs_set_eq:NN \vl |

% 为 dirtree 宏包打补丁，使得跨页时可以正常显示
% 见 https://tex.stackexchange.com/q/6103/136923
%    https://gist.github.com/flaviotoribio/e35402f9220835a998e444ec5b2adfd4
\ctex_preto_cmd:NnnTF \dirtree
  {
    \ExplSyntaxOff
    \char_set_catcode_letter:n { 64 }
  }
  { \global\advance\DT@treenum by\@ne }
  { } { \ctex_patch_failure:N \dirtree }
\ctex_patch_cmd:Nnn \dirtree
  { \count@=\z@ }
  {
    \count@=\z@
    \DT@splitfalse
  }
\ctex_patch_cmd:Nnn \dirtree
  { \ifnum\count@=\z@ }
  {
      \ifnum0\zref@extract{DT\the\DT@treenum.\the\DT@countiv}{abspage} =
        0\zref@extract{DT\the\DT@treenum.\the\DT@countii}{abspage}\relax
      \else
        \advance\DT@countiv\@ne
        \count@=\@ne
        \DT@splittrue
      \fi
    \ifnum\count@=\z@
  }
\ctex_patch_cmd:Nnn \dirtree
  { \kern-0.5\DT@rulewidth }
  {
    \ifDT@split
      \advance\dimen\z@ by.4\baselineskip
    \fi
    \kern-0.5\DT@rulewidth
  }
\ctex_patch_cmd:Nnn \DT@readarg
  { \@namedef{DT@body@\the\DT@counti}{\strut{\DTstyle{#2}\strut}} }
  {
    \edef\DT@label{DT\the\DT@treenum.\the\DT@counti}
    \expandafter\def\csname DT@body@\the\DT@counti\expandafter\endcsname
        \expandafter{\expandafter\strut\expandafter\zref@label\expandafter{
        \DT@label}
      {\DTstyle{#2}\strut}
    }
  }
\newcount\DT@treenum \DT@treenum=0
\newif\ifDT@split

% 代码高亮环境
\cs_set:Npn \htmlcolor #1
  { \color [ HTML ] {#1} }
\lstdefinelanguage { JSON }
  {
    keywords    = { true, false, null },
    sensitive   = false,
    comment     = [l] { // },
    morecomment = [s] { /* } { */ },
    morestring  = [b] ',
    morestring  = [b] "
  }
\lstdefinestyle { style@base }
  {
    extendedchars   = true,
    gobble          = 1,
    % frame           = l,
    % framerule       = 1 pt,
    framesep        = 0 pt,
    escapeinside    = {(*}{*)},
    basicstyle      =     \htmlcolor { 37474F } \small \CodeFont \CJKfamily { tt },
    keywordstyle    = [1] \htmlcolor { 3B78E7 },
    keywordstyle    = [2] \htmlcolor { 9C27B0 } \bfseries,
    commentstyle    =     \htmlcolor { ADADAD } \itshape,
    stringstyle     =     \htmlcolor { 0D904F },
    backgroundcolor =     \htmlcolor { F7F7F7 },
  }
\lstdefinestyle { style@tex }
  {
    style       = style@base,
    rulecolor   = \htmlcolor { 859900 },
    language    = [LaTeX] TeX,
    alsoletter  = { * },
    texcsstyle  = * [1] \htmlcolor { 3B78E7 },
    texcsstyle  = * [2] \htmlcolor { 9C27B0 },
    texcsstyle  = * [3] \htmlcolor { D81B60 },
    texcsstyle  = * [4] \htmlcolor { C53929 } \bfseries,
    deletetexcs =
      { begin, end, documentclass, usepackage, def, fi, if, let, newcommand, renewcommand },
    moretexcs   = [1] { part, chapter, section, subsection, subsubsection, paragraph, subparagraph },
    moretexcs   = [2] { begin, end },
    moretexcs   = [3] { documentclass, usepackage },
    moretexcs   = [4] { def, fi, if, let, newcommand, renewcommand },
    % literate    =
    %   * { \\!  } { { \textcolor {red} { \textbackslash!              } } } 2
    %     { \\,  } { { \textcolor {red} { \textbackslash,              } } } 2
    %     { \\\\ } { { \textcolor {red} { \textbackslash\textbackslash } } } 2,
  }
\lstdefinestyle { style@lua }
  {
    style        = style@base,
    % rulecolor    = \htmlcolor { 073642 },
    language     = [5.2] Lua,
  }
\lstdefinestyle { style@sh }
  {
    style        = style@base,
    % rulecolor    = \htmlcolor { D30102 },
    language     = sh,
    alsoletter   = { - / \$ },
    keywords     = [1] { fi, if, then },
    keywords     = [2] { cd, export, ls, rm, rmdir }
  }
\lstdefinestyle { style@bat }
  {
    style        = style@base,
    % rulecolor    = \htmlcolor { D33682 },
    language     = command.com,
  }
\lstdefinestyle { style@py }
  {
    style        = style@base,
    % rulecolor    = \htmlcolor { 268BD2 },
    language     = Python,
  }
\lstdefinestyle { style@json }
  {
    style        = style@base,
    % rulecolor    = \htmlcolor { 268BD2 },
    language     = JSON,
  }
% 连字符 - 原本以数学模式输出，此处改为普通文本。
% 见 https://tex.stackexchange.com/q/33185/136923。
\lst@CCPutMacro
  \lst@ProcessOther { "2D } { \lst@ttfamily { -{} } { -{} } }
  \@empty \z@ \@empty
% 高亮 \\、\! 等
% 见 https://tex.stackexchange.com/q/267481/136923。
% \lst@AddToHook{SelectCharTable}
%   {\ifx\lst@literate\@empty\else
%        \expandafter\lst@Literate\lst@literate{}\relax\z@
%    \fi}
\clist_map_inline:nn
  { tex, sh, bat, py, lua, json }
  {
    \lstnewenvironment { #1 code } [1] [ ]
      { \lstset { style = style @ #1, ##1 } }
      { }
  }

% 标题页
\AtBeginDocument
  {
    \begin{titlepage}
      \hbox:n { } \vfil
      \skip_vertical:n { 60 pt }
      \begin{center}
        \group_begin:
          \Huge \sffamily \faqTitle \quad \faqVersion \par
        \group_end:
        \skip_vertical:n { 3 em }
        \group_begin:
          \Large \faqAuthor \par
        \group_end:
        \skip_vertical:n { 1.5 em }
        \group_begin:
          \Large \@date \par
        \group_end:
        \vfill
        \includegraphics [ width = 10 cm] { ../images/hummingbird.pdf }
        \vfill
      \end{center}
    \end{titlepage}
  }

% TODO
\definecolor{gbblue}{RGB}{23,74,117}
\lstnewenvironment{texlist}{%
    \lstset{% general command to set parameter(s)
    %name=#1,
    %label=#2,
    %caption=\lstname,
    xleftmargin=3em,%\parindent
    linewidth=\linewidth,
    breaklines=true,
    %showspaces=true,
    extendedchars=false,
    columns=fullflexible,%flexible,
    %aboveskip=2pt,
    boxpos=t,
    rulesep=0pt,
    frame=tb,
    framesep=0pt,
    rulecolor=\color{gbblue},
    fontadjust=true,
    language=[LaTeX]TeX,
    %backgroundcolor=\color{yellow}, %背景颜色
    numbers=left,
    numberstyle=\tiny\color{gbblue},
    basicstyle=\footnotesize\ttfamily, % print whole listing small
    keywordstyle=\color{blue}\bfseries,%\underbar,
    % underlined bold black keywords
    identifierstyle=, % nothing happens
    commentstyle=\color{green!50!black}, % white comments
    stringstyle=\ttfamily, % typewriter type for strings
    showstringspaces=false}% no special string spaces
}{}
\lstnewenvironment{texinlist}{%
    \lstset{% general command to set parameter(s)
        %name=#1,
        %label=#2,
        %caption=\lstname,
        %xleftmargin=\parindent,
        linewidth=\linewidth,
        breaklines=true,
        %showspaces=true,
        extendedchars=false,
        columns=fullflexible,%flexible,
        %aboveskip=2pt,
        boxpos=t,
        rulesep=0pt,
        frame=tb,
        framesep=0pt,
        rulecolor=\color{gbblue},
        fontadjust=true,
        language=[LaTeX]TeX,
        %backgroundcolor=\color{yellow}, %背景颜色
        numbers=left,
        numberstyle=\tiny\color{gbblue},
        basicstyle=\footnotesize\ttfamily, % print whole listing small
        keywordstyle=\color{blue}\bfseries,%\underbar,
        % underlined bold black keywords
        identifierstyle=, % nothing happens
        commentstyle=\color{green!50!black}, % white comments
        stringstyle=\ttfamily, % typewriter type for strings
        showstringspaces=false% no special string spaces
    }
}{}
\lst@AddToHook{SelectCharTable}
    {\ifx\lst@literate\@empty\else
         \expandafter\lst@Literate\lst@literate{}\relax\z@
     \fi}
