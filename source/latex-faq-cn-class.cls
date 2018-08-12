\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\ProvidesExplClass{latex-faq-cn-class}{2018/08/09}{0.1}{Chinese LaTeX FAQ}

\LoadClass [ fontset = none ] { ctexart }

% 西文字体
\setmainfont { Libertinus~ Serif }
\setsansfont { Source~ Sans~ Pro }
  [
    UprightFont = *~ Semibold,
    BoldFont    = *~ Bold
  ]
\setmonofont { CMU~ Typewriter~ Text}
  [
    UprightFont = *~ Light,
    BoldFont    = *~ Bold,
    SlantedFont = *~ Light~ Oblique,
    HyphenChar  = None
  ]

% 中文字体
\setCJKmainfont { Source~ Han~ Serif~ SC }
\setCJKsansfont { Source~ Han~ Sans~ SC}

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

\NewDocumentCommand \zhquote { m } { “#1” }

\RequirePackage{xurl}

\RequirePackage{hyperref}
\hypersetup{colorlinks}
