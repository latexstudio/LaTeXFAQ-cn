\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\ProvidesExplClass{latex-faq-cn-class}{2018/08/09}{0.1}{Chinese LaTeX FAQ document class}

\PassOptionsToPackage { log-declarations = false } { xparse   }
\PassOptionsToPackage { no-math                  } { fontspec }

\LoadClass [ fontset = none ] { ctexart }

\RequirePackage
  {
    geometry,
    hologo,
    xurl,
    zref-base,
    hyperref
  }

% 西文字体
\IfFontExistsTF { libertinusserif-regular.otf }
  {
    \setmainfont { libertinusserif }
      [
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-italic,
        BoldItalicFont = *-bolditalic
      ]
  }
  { \BOOM }
\IfFontExistsTF { SourceSansPro-Regular.otf }
  {
    \setsansfont { SourceSansPro }
      [
        Extension      = .otf,
        UprightFont    = *-Regular,
        BoldFont       = *-Bold,
        ItalicFont     = *-regularIt,
        BoldItalicFont = *-BoldIt
      ]
  }
  { \BOOM }

% 中文字体

% 设置思源字体系列。由于命名比较复杂，这里需要做多次判断
% ttc 格式封装的思源字体中，简体中文位于第 3 个，因此 FontIndex = 2
% #1: \setCJK...font
% #2, #3, #4, #5: font names
% #2: options clist
\cs_new_protected:Npn \faqcn_set_cjk_fonts:Nnnnnn #1#2#3#4#5#6
  {
    \IfFontExistsTF { #2-Regular.ttc }
      { #1 { #2 } [ Extension = .ttc, FontIndex = 2, #6 ] }
      {
        \IfFontExistsTF { #3-Regular.ttc }
          { #1 { #3 } [ Extension = .ttc, FontIndex = 2, #6 ] }
          {
            \IfFontExistsTF { #4-Regular.otf }
              { #1 { #4 } [ Extension = .otf, #6 ] }
              {
                \IfFontExistsTF { #5-Regular.otf }
                  { #1 { #5 } [ Extension = .otf, #6 ] }
                  { \BOOM }
              }
          }
      }
  }

\faqcn_set_cjk_fonts:Nnnnnn \setCJKmainfont
  { NotoSerifCJK } { SourceHanSerif } { NotoSerifCJKsc } { SourceHanSerifSC }
  {
    UprightFont    = *-Regular,
    BoldFont       = *-Bold,
    ItalicFont     = *-Regular,
    BoldItalicFont = *-Bold,
  }
\faqcn_set_cjk_fonts:Nnnnnn \setCJKsansfont
  { NotoSansCJK } { SourceHanSans } { NotoSansCJKsc } { SourceHanSansSC }
  {
    UprightFont    = *-Medium,
    BoldFont       = *-Bold,
    ItalicFont     = *-Medium,
    BoldItalicFont = *-Bold,
  }
\faqcn_set_cjk_fonts:Nnnnnn \setCJKmonofont
  { NotoSansCJK } { SourceHanSans } { NotoSansCJKsc } { SourceHanSansSC }
  {
    UprightFont    = *-Medium,
    BoldFont       = *-Bold,
    AutoFakeSlant  = 0.2
  }

\ctexset
  {
    section / number = \Alph { section }
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
\NewDocumentEnvironment { faq } { m o }
  { \faqcn_faq_begin:nn {#1} {#2} }
  { \faqcn_faq_end: }
\cs_new_protected:Npn \faqcn_faq_begin:nn #1#2
  {
    \hypertarget { faq @ #2 } { \textbf { \int_use:N \g_faqcn_count_int \quad #1} }
    \tl_if_novalue:nF {#2} { \zref@labelbylist { faq: #2 } { faqcn } }
    \int_gincr:N \g_faqcn_count_int
    \par
  }
\int_new:N \g_faqcn_count_int
\int_set_eq:NN \g_faqcn_count_int \c_one

\cs_set_eq:NN \faqcn_faq_end: \par

\zref@newlist { faqcn }
\zref@newprop { faq@num } { 问题 \int_use:N \g_faqcn_count_int }
\zref@addprop { faqcn } { faq@num }

% 问答环境交叉引用
\NewDocumentCommand \faqref { m }
  { \faqcn_ref:n {#1} }
\cs_new_protected:Npn \faqcn_ref:n #1
  { \hyperlink { faq @ #1 } { \zref@extract { faq: #1 } { faq@num } } }

% 问答环境参考文献
\NewDocumentEnvironment { reference } { }
  { \textbf { 参考： } \enumerate }
  { \endenumerate }

% TeX logo 命令
\clist_map_inline:nn
  {
    TeX, LaTeX, LaTeXe, LaTeXTeX, ConTeXt
    pdfTeX, pdfLaTeX, LuaTeX, LuaLaTeX, XeTeX, XeLaTeX,
    BibTeX,
    METAFONT, METAPOST,
    MiKTeX
  }
  { \cs_set_protected:cpn {#1} { \hologo {#1} } }

\cs_set_protected:Npn \ApTeX   { Ap\TeX       }
\cs_set_protected:Npn \ApLaTeX { Ap\LaTeX     }
\cs_set_protected:Npn \TeXLive { \TeX{}~ Live }
\cs_set_protected:Npn \MacTeX  { Mac\TeX      }

% \NewDocumentCommand \zhquote { m } { “#1” }

\geometry
  {
    paper      = a4paper,
    vmargin    = 2.54 cm,
    hmargin    = 3.18 cm,
    headheight = 15 pt,
  }

\hypersetup{colorlinks}

\makeatletter
\def\@captype{figure}
\makeatother
