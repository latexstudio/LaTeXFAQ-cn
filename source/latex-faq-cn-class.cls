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
\RequirePackage
  {
    enumitem,
    fancyvrb,
    geometry,
    hologo,
    unicode-math,
    xurl,
    zref-base,
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
% ttc 格式封装的思源字体中，简体中文位于第 3 个，因此 FontIndex = 2
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
\cs_new_protected:Npn \__faqcn_source_super_otc:Nnn #1#2#3
  {
    \IfFontExistsTF {#2}
      { #1 {#2} [#3] }
      { \BOOM }
  }
\bool_new:N \l__source_han_super_otc_bool

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
        UprightFont    = *-Medium,
        BoldFont       = *-Bold,
        AutoFakeSlant  = 0.2
      }
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

% 列表环境
\setlist
  {
    itemsep       = 0 pt,
    parsep        = 0 pt,
    listparindent = \parindent
  }

% 页面尺寸
\geometry
  {
    paper      = a4paper,
    vmargin    = 2.54 cm,
    hmargin    = 3.18 cm,
    headheight = 15 pt
  }

\hypersetup { colorlinks }

% 问答环境
% #1: 选项
% #2: 长名称
% #3: 短名称
\NewDocumentCommand \faq { o m m }
  {
    \faqcn_faq:nn {#2} {#3}
  }

\cs_new_protected:Npn \faqcn_faq:nn #1#2
  {
    \hypertarget { faq @ #2 } { \textbf { \int_use:N \g_faqcn_count_int \quad #1} }
    \tl_if_novalue:nF {#2} { \zref@labelbylist { faq: #2 } { faqcn } }
    \int_gincr:N \g_faqcn_count_int
    \par
  }
\int_new:N \g_faqcn_count_int
\int_set_eq:NN \g_faqcn_count_int \c_one

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
    TeX, LaTeX, LaTeXe, LaTeXTeX, plainTeX, ConTeXt,
    pdfTeX, pdfLaTeX, LuaTeX, LuaLaTeX, XeTeX, XeLaTeX,
    BibTeX, MetaFun,
    MiKTeX
  }
  { \cs_set_protected:cpn {#1} { \hologo {#1} } }
\clist_map_inline:nn
  { METAFONT, METAPOST }
  {
    % TODO
    \cs_set_protected:cpn {#1}
      {
        \bool_if:NTF \g_faqcn_use_customized_fonts_bool
          { \group_begin: \fontspec { ffmr10.otf } #1 \group_end: }
          {#1}
      }
  }

\cs_set_protected:Npn \pTeX     { p\TeX         }
\cs_set_protected:Npn \pLaTeX   { p\LaTeX       }
\cs_set_protected:Npn \ApTeX    { Ap\TeX        }
\cs_set_protected:Npn \ApLaTeX  { Ap\LaTeX      }
\cs_set_protected:Npn \TeXLive  { \TeX{}~ Live  }
\cs_set_protected:Npn \MacTeX   { Mac\TeX       }
\cs_set_protected:Npn \PlainTeX { Plain~ \TeX   }
\cs_set_protected:Npn \TikZ     { Ti\textit{k}Z }

% 宏包与文档类
\cs_set_protected:Npn \pkg #1 { \textsf {#1} }
\cs_set_protected:Npn \cls #1 { \textsf {#1} }

% 允许使用 |...| 作为行内抄录
\AtBeginDocument
  { \DefineShortVerb   { \| } }
\AtEndDocument
  { \UndefineShortVerb { \| } }
