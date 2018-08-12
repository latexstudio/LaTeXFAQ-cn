\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\ProvidesExplClass{latex-faq-cn-class}{2018/08/09}{0.1}{Chinese LaTeX FAQ document class}

\LoadClass [ fontset = none ] { ctexart }

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
        ItalicFont     = *-It,
        BoldItalicFont = *-BoldIt
      ]
  }
  { \BOOM }

% 中文字体
\clist_const:Nn \c__faqcn_source_han_serif_options_clist
  {
    UprightFont    = *-Regular,
    BoldFont       = *-Bold,
    ItalicFont     = *-Regular,
    BoldItalicFont = *-Bold,
  }
\clist_const:Nn \c__faqcn_source_han_sans_options_clist
  {
    UprightFont    = *-Medium,
    BoldFont       = *-Bold,
    ItalicFont     = *-Medium,
    BoldItalicFont = *-Bold,
  }
\IfFontExistsTF { SourceHanSerif-Regular.ttc }
  {
    \setCJKmainfont { SourceHanSerif }
      [
        Extension = .ttc,
        FontIndex = 2,
        \c__faqcn_source_han_serif_options_clist
      ]
  }
  {
    \IfFontExistsTF { NotoSerifCJK-Regular.ttc }
      {
        \setCJKmainfont { NotoSerifCJK }
          [
            Extension = .ttc,
            FontIndex = 2,
            \c__faqcn_source_han_serif_options_clist
          ]
      }
      {
        \IfFontExistsTF { NotoSerifCJKsc-Regular.otf }
          {
            \setCJKmainfont { NotoSerifCJKsc }
              [
                Extension = .otf,
                \c__faqcn_source_han_serif_options_clist
              ]
          }
          { \BOOM }
      }
  }
\IfFontExistsTF { SourceHanSans-Regular.ttc }
  {
    \setCJKsansfont { SourceHanSans }
      [
        Extension = .ttc,
        FontIndex = 2,
        \c__faqcn_source_han_sans_options_clist
      ]
  }
  {
    \IfFontExistsTF { NotoSerifCJK-Regular.ttc }
      {
        \setCJKsansfont { NotoSansCJK }
          [
            Extension = .ttc,
            FontIndex = 2,
            \c__faqcn_source_han_sans_options_clist
          ]
      }
      {
        \IfFontExistsTF { NotoSansCJKsc-Regular.otf }
          {
            \setCJKsansfont { NotoSansCJKsc }
              [
                Extension = .otf,
                \c__faqcn_source_han_sans_options_clist
              ]
          }
          { \BOOM }
      }
  }

\ctexset
  {
    section / number = \Alph { section }
  }

\NewDocumentEnvironment { faq } { m }
  { \faqcn_faq_begin:n {#1} }
  { \par }

\cs_new_protected:Npn \faqcn_faq_begin:n #1
  {

    \textbf { \int_use:N \g_faqcn_count_int \quad #1}
    \int_gincr:N \g_faqcn_count_int
    \par
  }
\int_new:N \g_faqcn_count_int
\int_set_eq:NN \g_faqcn_count_int \c_one

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

% \NewDocumentCommand \zhquote { m } { “#1” }

\RequirePackage{xurl}

\RequirePackage{hyperref}
\hypersetup{colorlinks}
