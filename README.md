



# **【建设LaTeX史上最宏伟的中文FAQ工程，见证我们LaTeX中文社区的新生力量，大家是历史创造者。】**

**更新前请仔细阅读：**
1. **大家不要刷格式##，可以微调，主要完成内容更新，格式我们后期集中调整。**
2. **一级标题已经设置好了，二级标题大家可以采用序号的方式进行编号。**
3. **每周末，根据编辑历史，没有内容贡献的用户，将取消其权限并移出群。**
4. **感谢大家的参与，** **请大家加入我们的微信群！方便大家沟通！（协作平台与微信名片统一，便于清理和沟通）**

![图片](images/weixin.jpg)
**模块冠名（按照各个模块更新贡献多少，观其量，冠其名）**

|**模块**|冠名|**备注**|
|:----:|:----:|:----:|
| | |
| | |
| | |
| | |
| | |
| | |
| | |


## 一、背景知识与基本概念

### 1. 什么是TeX？

TeX是由著名的计算机科学家 [Donald E. Knuth](https://www-cs-faculty.stanford.edu/~knuth/)（高德纳）发明的排版系统，他在他的书的前言中曾提到「TeX旨在创造美丽的书籍，特别是那些包含很多数学公式的书」。（如果说TeX仅仅是为了更方便些数学方面的书而生的，那么它就不会像今天这么使用广泛了：事实上，TeX是一个很好的文字排版工具）。
Knuth是美国加州斯坦福大学计算机编程专业的名誉教授，他在1978年开发了第一个版本的TeX用来处理他的“计算机编程艺术”的修订。这个想法特别受欢迎，所以1982年他推出了TeX的第二个版本，也就是们今天所用的TeX的基础。
Knuth开发了一套“识字编程”来编写TeX，他还提供了免费的TeX资源，以及可以将网络资源转化为可以编译或者打印的东西的工具；Knuth做了什么，对人们来说从来都不是什么神秘的事情。TeX以及它的文档都是高度可移植的。
对于感兴趣的程序员来说，TeX有其迷人之处：没有什么能比得上一个人可以构建这样一个程序，至今它的持续时间比大多数的程序都好，而且已经被移植到了许多不同的计算机构架和操作系统中——许多现代编程所追求的属性。经过处理的“可读”的TeX程序源代码可以在 [TDS structured](https://texfaq.org/FAQ-tds) 版本中找到。

### 2. TeX 中常见术语的解释
* **引擎**

LaTeX/TeX解析引擎，其实就是一个编译器，它输入一个.tex文件作为输入，根据源文件的内容送入解析引擎和渲染引擎进行处理，并将排版的成果——文档编译输出，LaTeX/TeX的解析引擎目前有pdflatex、xelatex、lualatex等，它们都可以输出pdf文档文件（部分解析器可以输出dvi文件），用于在多平台进行分发甚至打印出版。
* **格式**

TeX是存在各种不同的封装格式的，比如原生的TeX或者LaTeX，我们所使用的LaTeX只是tex封装格式的其中一种，是目前流行的封装规范。
* **发行版**

 LaTeX/TeX都包含了成千上万个宏包，甚至有可能我们需要安装新的宏包，除了手动安装外，最好的方式就是利用发行版的宏包管理器，所谓发行版就是把LaTeX/TeX的相关组件打包，形成一个独立完善的LaTeX/TeX系统，目前流行的发行版有MiKTeX、proTeXt 以及TeXLive。

### 3. 不同的TeX封装格式的区别？
* **原生TeX**

TeX本身是一个基于控制序列的排版系统，它指示TeX如何在页面上放置文本。例如，\hskip指在文档中在文档中插入一定数量的水平空间，而\font是指给文档中的文字定义一种给定的字体。TeX是完全可编程的，它使用一种集成的宏脚本语言，支持变量，范围，条件执行，控制流和函数定义等。
* **TeX宏包（TeX格式）**
TeX的一些控制序列直接使用是单调乏味的；它们主要作为更高层次的构建快，因此更易于用户使用。例如，在基础TeX中没有办法能够制定一段文字应该排版为更大的字体，相反，你必须了解当前的字体和大小，然后加载一种同样字体但更大字号的字体。幸运的是，TeX是可编程的，它可以通过写一个宏将这些复杂性都隐藏在一个简单的，新的控制序列之后。例如，我们可以通过 \larger{my text}将“my text”定义为比当前更大的字体。
    一些使用者会写一些完全由自己定义的宏集，然后再一些文档中重复使用，但，常见的还是依赖于由专家编写的TeX宏包——一些宏的集合。为了方便用户，这些宏包通常与基本的TeX引擎结合到一个独立的可执行的文件中。
  
* **TeXLive、MacTeX、MikTeX、CTEX**

TeXLive 由类 UNIX 系统上的 teTeX 发展并取而代之，最终成为跨平台的 TeX 发行版。TeXLive 自 2011 年起以年份作为发行版的版本号，保持了一年一更的频率。
MacTeX 是 macOS（OS X）系统下的一个定制化的 TeXLive 版本，与 TeXLive 同步更新。
MikTeX 是主要用于 Windows 平台的一个稳定发展的 TeX 发行版，目前已开发出跨平台版本。
中国的 LaTeX 用户应该对“CTeX 套装”比较熟悉，它是一个经过本地化配置的MikTeX，目前已不推荐使用。
### 4. TeX有哪些不同的封装格式

TeX是一种排版文件的计算机程序，它需要一个计算机文件，根据TeX的规则进行准备，并将其转换成一种可以在高质量打印机上打印的形式，比如激光打印机，可以打印出一份与高质量的书籍和期刊相媲美的打印文档。不包含数学公式或表格的简单文档可以很容易就生成，事实上，所有人都必须直接输入文本（只是遵循不同的符号规则）。输入数学公式时比较复杂的，但当考虑到产生一些数学公式的复杂性时，TeX是相对容易使用的，它可以产生大量的数学符号。
     TeX包括各种不同的“方言”，其中包括LaTeX。Plain TeX是TeX中最基础的版本，也是其他“方言”的基础。为了用TeX生成文档，我们必须首先在计算机上创建一个合适的输入文件，我们将TeX程序应用到输入文件中，然后再用打印机打印由TeX程序生成的所谓的“DVI”文件。

* **Plain TeX(TeX)**

Knuth设计了一个名叫PlainTeX的基本格式，以与低层次的原始TeX呼应。这种格式是用TeX处理文本时相当基本的部分，以致于我们有时都分不清到底哪条指令是真正的处理程序TeX的原始命令，哪条是PlainTeX格式的。大多数声称只使用TeX的人，实际上指的是只用PlainTeX。
PlainTeX也是其它格式的基础，这进一步加深了很多人认为TeX和PlainTeX是同一事物的印象。
PlainTeX的重点还只是在于如何排版的层次上，而不是从一位作者的观点出发。对它的深层功能的进一步发掘，需要相当丰富的编程技巧。因此它的应用就局限于高级排版和程序设计人员。
注：有关Plain TeX的相关信息可见：[http://www.ntg.nl/doc/wilkins/pllong.pdf](http://www.ntg.nl/doc/wilkins/pllong.pdf)

* **LaTeX(latex)**

有两个版本，分别是LaTeX2e和LaTeX2.09，前者是当前使用的版本，后者是1994年最开使用的过时的版本。
[LeslieLamport](https://baike.sogou.com/lemma/ShowInnerLink.htm?lemmaId=73792246&ss_c=ssc.citiao.link)开发的LaTeX是当今世界上最流行和使用最为广泛的TeX格式。它构筑在PlainTeX的基础之上，并加进了很多的功能以使得使用者可以更为方便的利用TeX的强大功能。使用LaTeX基本上不需要使用者自己设计命令和宏等，因为LaTeX已经替你做好了。因此，即使使用者并不是很了解TeX，也可以在短短的时间内生成高质量的文档。对于生成复杂的数学公式，LaTeX表现的更为出色。
	   LaTeX自从二十世纪八十年代初问世以来，也在不断的发展。最初的正式版本为2.09，在经过几年的发展之后，许多新的功能，机制被引入到LaTeX中。在享受这些新功能带来的便利的同时，它所伴随的副作用也开始显现，这就是不兼容性。标准的LaTeX2.09，引入了“新字体选择框架”(NFSS)的LaTeX，SLiTeX，AMSLaTeX等等，相互之间并不兼容。这给使用者和维护者都带来很大的麻烦。
	   为结束这种糟糕的状况，Frank Mittelbach等人成立了LaTeX3项目小组，目标是建立一个最优的，有效的，统一的，标准的命令集合。即得到LaTeX的一个新版本3。这是一个长期目标，向这个目标迈出第一步就是在1994年发布的LaTeX2e。LaTeX2e采用了NFSS作为标准，加入了很多新的功能，同时还兼容旧的LaTeX2.09。LaTeX2e每6个月更新一次，修正发现的错误并加入一些新的功能。在LaTeX3p最终完成之前，LaTeX2e将是标准的LaTeX版本。
* **ConTeXt(context)**

ConTeXt是TeX的一种格式，是Hans Hagen和荷兰Pragma-ADE公司设计的一种高端的文档制造工具，官方网站为 [ConTeXtGarden](http://wiki.contextgarden.net/Main_Page)。ConTeXt就像LaTeX是基于TeX排班系统的文档制作系统，如果说LaTeX将作者从排版的细节中隔离出来，那么ConTeXt就是采用一种互补的方法来处理结构化的界面来处理排版，包括对颜色、背景、超链接、演示文稿、图形文本集成和条件编译的广泛支持， 对于数学、化学等科技文档的支持同等优秀甚至更为方便，而且其为了更容易实现各种华丽排版效果。它可以让用户对格式进行广泛的控制，同时又可以在不需要学习TeX宏语言的情况下轻松地创建新的布局和样式。 因此ConTeX的图形功能要远远强于TeX和LaTeX，可以制作非常漂亮的PD文档，特别适合做幻灯片和一些非正式的文档。
ConTeXt将MetaFun，MetaPost的超集以及一个强大的矢量图形系统整合起来。MetaFun可以作为一个独立的系7统来生成数据，但是它的优势在于用精确的图形元素来增强ConTeXt文档。
目前，ConTeXt主要分为两个版本，分别是Mark Ⅱ—后缀名为mkii，在pdfTeX上运行但不是主动开发阶段；和Mark Ⅳ—后缀名为mkiv，在LuaTeX上运行而且正在开发阶段。（LuaTeX的发展也是由于ConTeXt驱动）。
注：CTAN不支持ConTeXt的发布——潜在的用户可以去 [ConTeXt Garden](http://wiki.contextgarden.net/Main_Page)了解当前发行版的详细信息。

* **TeXinfo(TeX,makeinfo)**

TeXinfo是一个使用同一个源文件生成在线信息和打印输出的文档系统，所以只需要编写一个文档源文件，当工作被修改时，只需要修改源文件即可。其源文件的后缀名为texi或texinfo。
TeXinfo是一门宏语言，就像LaTeX一样，但是它的表达能力略弱，它的表观与TeX的其他宏语言相似，只不过它的宏要以@开头，而TeX系统中用\开头。
你可以在GNU Emacs中编写以及将TeXinfo文件转化成info文件，你也可以在makeinfo中将TeXinfo文件转换成info文件，然后再info中阅读，所以也不是必须依赖于Emacs。这个发行版包括一个Perl脚本，texi2html，可以将texinfo文件转换成HTML，这种语言比LaTeX更适合HTML，所以将LaTeX转换成HTML的痛苦就可以避免了。
当然，你也可以用pdfTeX将输入文件转换成PDF格式。
makeinfo可将texinfo文档转换成HTML，DocBook,，Emacs info,，XML和全文本。TeX（或者texi2dvi和texi2pdf），因为TeX加载了普通的TeX宏，而并不是TeXinfo，所以TeXinfo文档必须以“\input texinfo”开头来加载texinfo包。
* **Eplain(eplain)**

* **Eplain扩展并延伸了Plain TeX的定义，它并不像ConTeX**

### 5. LaTeX2.09和LaTeX2e有什么区别？

后者是前者的改进，从文件内容上看，两者最显著的不同在于LaTeX2.09使用\documentstyle命令定义文档类型以及所包含宏包，如

```
\documentstyle[twoside,epsfig]{article}
```
而LaTeX2e使用\documentclass命令设置文档类型，用\usepackage命令调用宏包。
### 6. 文本文件编码解读
### 7. LaTeX源文件

LaTeX的源文件是*.tex文件，是指latex编译器处理输入文件的源码，latex编译器会对输入文件进行解析，构造解析树，进行渲染，然后输出处理后的文档，完成一次编译过程，由于LaTeX解析器可能对中文文件名处理存在兼容性问题，不建议将LaTeX的源文件的文件名设置为中文。
### 8. 连字符如何在TeX起作用

如果 LaTeX 遇到了很长的英文单词，仅在单词之间的位置断行无法生成宽度匀称的行时，就要考虑从单词中间断开。对于绝大部分单词，LaTeX 能够找到合适的断词位置，在断开的行尾加上连字符 - 。
如果一些单词没能自动断词，我们可以在单词内手动使用 \- 命令指定断词的位置，如：
I think this is: su\-per\-cal\-%
i\-frag\-i\-lis\-tic\-ex\-pi\-%
al\-i\-do\-cious.

### 9. Unicode和TeX
### 10. 常见的TeX文件扩展名与文件用途

常见的用户文件的扩展名与其用户如下：
  * .tex 文件。源文件，需用户编写。
  * .sty 宏包文件。宏包的名称就是去掉扩展名的文件名。
  * .cls 文档类文件。同样地，文档类名称就是文件名
  * .bib BibTeX 参考文献数据库文件。
  * .bst BibTeX 用到的参考文献格式模板。
  * .log 排版引擎生成的日志文件，供排查错误使用。
  * .aux LaTeX 生成的主辅助文件，记录交叉引用、目录、参考文献的引用等。
  * .toc LaTeX 生成的目录记录文件。
  * .lof LaTeX 生成的图片目录记录文件。
  * .lot LaTeX 生成的表格目录记录文件。
  * .bbl BibTeX 生成的参考文献记录文件。
  * .blg BibTeX 生成的日志文件。
  * .idx LaTeX 生成的供 makeindex 处理的索引记录文件。
  * .ind makeindex 处理 .idx 生成的格式化索引记录文件。
  * .ilg makeindex 生成的日志文件。
  * .out hyperref 宏包生成的 PDF 书签记录文件。
### 11. 什么是“决议”(resolutions)
### 12. 什么是（TeX）宏
### 13. 什么是LaTeX环境
### 14. 什么是LaTeX类和工具包
### 15. 什么是PK文件
### 16. 什么是TFM文件
### 17. 什么是编码
### 18. 什么是EC字体
### 19. 什么是虚拟字体
### 20. 什么是“Encapsulated PostScript”(EPS)
### 21. 什么是DVI驱动程序
### 22. 什么是DVI文件

DVI文件（device independent）为[TeX](https://baike.baidu.com/item/TeX)电子排版系统的输出文件。七十年代末，[Donald E. Knuth](https://baike.baidu.com/item/Donald%20E.%20Knuth)（高德纳）在看到其多卷巨著“The Art of ComputerProgramming”第二卷的校样时，对由计算机排版的校样的低质量感到无法忍受。因此决定自己来开发一个高质量的计算机排版系统，这样就有了TeX。TeX 的输出文件称为 DVI 文件，即是“Device Independent”。一旦 TeX 处理了你的文件，你所得到的 DVI文件就可以被送到任何[输出设备](https://baike.baidu.com/item/%E8%BE%93%E5%87%BA%E8%AE%BE%E5%A4%87)如打印机，屏幕等并且总会得到相同的结果，而这与这些输出设备的限制没有任何关系。这说明 DVI 文件中所有的元素，从页面设置到文本中字符的位置都被固定，不能更改。
### 23. 什么是“Berry命名方案”
### 24. 什么是TDS

TDS 全称 TeX Directory Structure，意为 TeX 目录结构，即 TeX 发行版的文件组织结构。大部分 TeX 发行版都将自身的文件组织成相近的路径结构，也就是 TDS。TDS 也称为 TEXMF 树，这是 TeX 与 METAFONT 的合称。很多系统的 TDS 结构都以 `texmf` 或者类似的词作为 TEXMF 树的根目录名，如在 TeX Live 中，安装目录下的 `texmf-dist`、`texmf-var` 等就是两个不同的 TEXMF 树。

下面是 TeX Live 中 `texmf-dist` 下的目录结构（有所删节，同时根据安装情况可能有所出入）：

```
bibtex/                     BibTeX 相关文件    bib/                        公用 bib 数据库
    bst/                        格式文件
doc/                        各类用户文档
    bibtex/                     BibTeX 相关文档
    fonts/                      字体文档
    generic/                    通用于各种格式的文档
        pgf/
            pgfmanual.pdf           PGF/TikZ 用户手册
            ...
        ...
    latex/                      用于 LaTeX 格式的文档
        ctex/
            ctex.pdf                ctex 宏集用户手册
            README.md               ctex 宏集简短介绍
        ...
    texlive/                    TeX Live 发行版自身的文档
    ...
fonts/                          字体相关文件
    opentype/                       OpenType 格式的字体
    source/                         字体源代码
    truetype/                       TrueType 格式的字体
    type1/                          Type1 格式的字体
    .../
scripts/                        可执行脚本
    l3build/                        LaTeX 构建、测试脚本
    latexmk/                        自动编译系统
    texdoc/                         文档查询系统
    ...
source/                         源代码
    bibtex/                         BibTeX 相关宏包代码
    fonts/                          字体源代码
    generic/                        通用于各种格式的宏包代码
    latex/                          用于 LaTeX 格式的宏包代码
        ctex/                           ctex 宏集源代码
            ctex.dtx
            ctex.ins
            ctexpuct.spa
        ...
    ...
tex/                            TeX 宏，可被引擎读入
    generic/                        通用于各种格式
    latex/                          用于 LaTeX 格式
        base/                           LaTeX 的基本宏文件
            article.cls
            book.cls
            report.cls
            latex.ltx
            ...
        beamer/                         beamer 宏包相关文件
        ctex/                           ctex 宏集相关文件
            ctexart.cls
            ctexbeamer.cls
            ctexbook.cls
            ctexrep.cls
            ctex.sty
            ...
        ...
    plain/                          用于 Plain TeX 格式
    xetex/                          用于 XeTeX 引擎
    xelatex/                        用于 XeTeX 引擎下的 LaTeX 格式
        xecjk/                          xeCJK 宏包相关文件
            xeCJK.sty
            ...
    ...
...
```

（来自刘海洋《LaTeX 入门》）

### 25. 从TeX编写（文本）文件
### 26. \special命令
### 27. Overleaf是什么？如何使用？

~~【这个答案严重误导！急需修订！】~~~~首先，经常使用的~~~~ ~~~~minted~~~~ ~~~~宏包不可使用，一般对~~~~ ~~~~lstlisting~~~~ ~~~~环境进行配置，比如MATLAB的配置可以参考~~[网址](http://www.latexstudio.net/archives/7483.html)~~。其次，其上传文件的个数是有限制，并且不支持两层及以上的文件夹，如果要将书籍的章以及其下的节分文件夹储存，则结构不清晰。最后，overleaf v2暂时不稳定，本地有TeXLive最好在本地进行内容的编写。回答时间2018-08-10。~~

以上所述不准确。

Minted 在 Overleaf v1、v2 都是可以用的，例子参照 https://www.overleaf.com/read/qphhfvnsddbs。Matlab 高亮也一样可以用 minted 完成，注意字母大小写：\begin{minted}{matlab}

Overleaf v1 的确有文件数目及项目大小限制，视收费与否而定：[https://www.overleaf.com/help/297](https://www.overleaf.com/help/297)
Overleaf v2 则相对宽松得多：所有项目（包括免费）都无文件大小上限，条件：每个项目限2000文件，以及可编辑纯文本文件不大于 5MB。详见[https://www.sharelatex.com/learn/Uploading_a_project#Limitations_on_Uploads](https://www.sharelatex.com/learn/Uploading_a_project#Limitations_on_Uploads)

Overleaf v1 是支持两层及以上的文件夹的，详情看 [https://www.overleaf.com/help/187](https://www.overleaf.com/help/187)
Overleaf v2 可以直接右键资料夹，再创建子资料夹。

Overleaf v2 目前还是比较稳定的（2018年9月将会全面上线）。当然如果是特定地区、单位限制的原因，则不方便在这里讨论。

【这里先预定个位置，以后可以写个篇幅比较长的功能介绍。若对 Overleaf 有任何问题，建议直接电邮 support@overleaf.com 询问，不必过多自行揣测。若是担心语言问题，Overleaf 技术支援人员有谙中文的。】

### 28. 编译器与编辑器的区别是什么
在 lshort-zh 中，确切解释了，所谓编译器，真正的名称叫排版引擎，是读入源代码并编译生成文档的程序，如 pdfTeX、XeTeX 等。
编辑器，其实是用户书写源代码的工具，例如 windows 下的记事本、ubuntu 下的 gedit 等等。目前很多编辑器都提供了"编译“按钮，本质上是基于命令行调用了编译器。

## 二、安装与配置问题
### 29. 如何安装 LaTeX

很多用户所谓的如何安装 LaTeX，实际上是一个无解的问题，因为 LaTeX 不是一款软件，相关概念不再赘述。用户可以直接安装 LaTeX 发行版，如 proTeXt , TeXLive 和 MacTeX (TeXLive在MacOS 的一个再次发行版)。
### 30. 如何下载 proTeXt 安装包

访问以下链接即可
[http://mirror.ctan.org/systems/protext/protext.exe](http://mirror.ctan.org/systems/protext/protext.exe)
### 31. 如何下载 TeXlive 安装包

访问以下网址获取 texlive 安装包镜像文件：
[http://mirror.ctan.org/systems/texlive/Images/texlive.iso](http://mirror.ctan.org/systems/texlive/Images/texlive.iso)
MacTeX安装包下载地址：
[http://mirror.ctan.org/systems/mac/mactex/MacTeX.pkg](http://mirror.ctan.org/systems/mac/mactex/MacTeX.pkg)
### 32. 如何安装 TeXlive

TeXlive 为用户提供了官方安装手册，其中文版地址是：
[https://tug.org/texlive/doc/texlive-zh-cn/texlive-zh-cn.pdf](https://tug.org/texlive/doc/texlive-zh-cn/texlive-zh-cn.pdf)
建议有余力的用户通读手册，以了解更多内容。
也可以参照以下网址
[https://www.tug.org/texlive/quickinstall.html](https://www.tug.org/texlive/quickinstall.html)
### 33. 如何挂载镜像文件：

目前市面上有很多虚拟光驱软件可供用户选择，例如 UltraISO。
特别一提，在 windows 8、windows 10 操作系统中，默认被双击后，镜像文件将会直接挂载。
在 Linux 操作系统中，可使用命令行挂载镜像文件：
```
mount -o loop ~/Download/TeXlive.iso ~/iso
```
### 34. 挂载镜像文件后该如何做？

windows 用户可以双击 install-tl-windows.bat 文件来进行安装。
linux 用户请在命令行执行 ./install-tl 进入 no gui 安装模式
### 35. 双击 install-tl-windows.bat 出现错误怎么办？

使用命令行。同时按下 win 键和 R 键，打开“运行”窗口，在窗口的“打开”处，输入 cmd 打开命令行窗口（黑窗）。
在黑窗内输入
```
cd /d [~]
```
后按 enter 键（即执行该命令），此处 [~] 代指 install-tl-windows.bat 所在目录，例如 C:/Downloads 等，注意命令中的空格。
进入目录后继续执行
```
install-tl-windows.bat -no-gui
```
开启纯命令行安装模式。默认状态下，点击 I 键 ( HIJK 的 I)，安装便会开始。若用户想改变安装路径或其他设置，只需根据屏幕提示进行更改即可。特别强调，安装路径一定是不带空格的纯英文路径。
### 36. 使用命令行安装TeXLive出现 goodbye 怎么办？

主要是缺少CMD所在的环境变量。
只需要在命令行中执行
```
path=%path%;C:\Windows\system32
```
后再尝试安装。或者因为下载文件损坏，上述方法不管用应重新下载。
### 37. 想在 linux 系统中使用 gui 模式安装该怎么做？

自行安装 perl，详细办法请上网自行搜索。然后执行命令
```
./install-tl -gui wizard  
```
或
```
./install-tl -gui perltk
```
### 38. 如何搭配 TeXLive 的环境变量？

Windows 用户一般不必担忧这个问题。因为 TeXLive 已经自动将环境变量写入，用户不必自己手动修改。
Linux 用户需要手动配置环境变量。例如，将
```
TEXDIR=/usr/local/texlive/2018
if [ -d $TEXDIR ]; then
  export PATH=$TEXDIR/bin/x86_64-linux;$PATH;
  export MANPATH=$TEXDIR/texmf-dist/doc/man;$MANPATH;
  export INFOPATH=$TEXDIR/texmf-dist/doc/info;$INFOPATH;
fi;
```
写入~/.profile。注意本例中的 2018 可以根据需要修改，例如部分用户还在使用 TeXLive 2017，就可将 2018 改为 2017等等。
### 39. 如何判断 TeXLive 安装成功？

在命令行中执行
```
tex -v
```
若命令行窗口中显示
TeXLive 2018
等内容，即说明安装成功。
### 40. 如何删除 TeXLive

windows 用户请找卸载批命令文件，如
C:\texlive\2018\tlpkg\installer\uninst.bat
linux 用户请直接删除文件夹，如执行
```
rm -rf /usr/local/texlive/2018
rm -rf ~/.texlive2018
```
并且手动清理环境变量
### 41. TeXLive 如何升级宏包？

建议使用命令行升级宏包。
首先指定源，执行命令
```
tlmgr option repository ctan
```
以自动寻求源，也可以手动指定源，例如执行命令
```
tlmgr option repository http://ftp.jaist.ac.jp/pub/CTAN/systems/texlive/tlnet
```
即指定了源为 http://ftp.jaist.ac.jp/pub/CTAN/systems/texlive/tlnet。
接下来，执行命令
```
tlmgr update --self
```
升级 tlmgr 本身。
然后，我们就可以升级宏包了。实际上，tlmgr 升级所有宏包的代码非常简单，执行命令
```
tlmgr update --all
```
值得一提的是，这样的做法也会同时删除本地的那些已被我们设定的源所剔除的宏包。如果用户想保留它们的话，可以执行
```
tlmgr update --all --no-auto-remove
```
但是 tlmgr 手册并不建议用户使用这样的方法。此外，为了防止更新后出现某些问题，我们还可以执行如下命令建立一个宏包备份：
```
tlmgr update --all --backup --backupdir E:\latexwork\backup
```
通过这句代码，我们就可以在更新宏包前将需要更新的宏包备份在 E:\latexwork\backup 中。一旦更新出现问题，我们可以执行
```
tlmgr restore --bakeupdir E:\latexwork\backup --all
```
来恢复全部宏包，或者我们也可以恢复某个宏包，如
```
tlmgr restore --bakeupdir E:\latexwork\backup mcmthesis
```
就可以用于恢复mcmthesis。
### 42. MikTeX 如何升级宏包

MikTeX 可以用界面升级宏包，有些用户经常升级失败是因为源不稳定造成的。建议到 [https://miktex.org/pkg/repositories](https://miktex.org/pkg/repositories) 找稳定的源。
### 43. TexLive对源的操作有哪些

查看源列表
```
tlmgr repository list
```
正常情况下，列表中至少有一个源地址，并且该源地址被标记为 main。
添加源
```
tlmgr repository add <path> [tag]
```
path 是源的地址，tag 是源的标签。例如添 http://ftp.jaist.ac.jp/pub/CTAN/systems/texlive/tlnet 并标记为 jp
```
tlmgr repository add http://ftp.jaist.ac.jp/pub/CTAN/systems/texlive/tlnet jp
```
标签可以省略
删除源
```
tlmgr repository remove path|tag
```
例如将刚才添加的 jp 删除
```
tlmgr repository remove jp
```
无视以前的列表，重新制定列表
```
tlmgr repository set path[#tag] [path[#tag] ...]
```
特别强调，TeXLive 要求源列表中至少存在一个被标记为 main 的源，否则一切操作都将失效。
### 44. 如何自动升级 TeXLive 宏包？

[这](http://pd10ibe5c.bkt.clouddn.com/TeXLive%E5%AE%8F%E5%8C%85%E6%AF%8F%E6%9C%88%E8%87%AA%E5%8A%A8%E6%9B%B4%E6%96%B0.zip)[里可以下载每月自动升级TeXLive宏包的脚本](http://pd10ibe5c.bkt.clouddn.com/TeXLive%E5%AE%8F%E5%8C%85%E6%AF%8F%E6%9C%88%E8%87%AA%E5%8A%A8%E6%9B%B4%E6%96%B0.zip)。
[这里是该脚本的说明](http://htharoldht.com/texlive-package-automatically-upgrades-every-month/)。
* 脚本源码
```
@echo off

if exist "C:\Windows\Tasks\AutoTeXLivePackageUpdaterMonthly.bat" goto run

move /y %0 "C:\Windows\Tasks"
schtasks /delete /tn "TeXLivePackage Updater Task" /f
schtasks /create /tn "TeXLivePackage Updater Task" /sc monthly /d /st 15:00:00 /tr "C:\Windows\Tasks\AutoTeXLivePackageUpdaterMonthly.bat"

:run
echo ============================开始============================
echo Writen By 有龙则灵_USTB

echo 是否更新TeXLive Package？
set Choice=
set /p Choice=请输入：y/n?
IF "%Choice%"=="y" (goto ya) else (goto n)

:ya
call tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet
echo ============================更新tlmgr============================
echo Writen By 有龙则灵_USTB
call tlmgr update --self
echo ============================显示待更新的宏包以及可自动安装的项============================
call tlmgr update --list
echo Writen By 有龙则灵_USTB

echo 是否更新TeXLive Package？
set Choice=
set /p Choice=请输入：y/n?
IF "%Choice%"=="y" (goto yb) else (goto n)

:yb
echo ============================更新所有宏包============================
call tlmgr update --all
echo ============================结束============================
echo Writen By 有龙则灵_USTB
pause
:n
```
* 脚本阐释
  * 利用 Windows 自带的 SchTasks 创建定时任务

第一部分用于将该脚本移动到定时任务的根目录，并创建一个计划任务项。
为什么不用 AT 呢？因为 AT 在 Win10 中已经被取缔了。
```
if exist "C:\Windows\Tasks\autoTeXLivePackageUpdaterMonthly.bat" goto run

move /y %0 "C:\Windows\Tasks"
schtasks /delete /tn "TeXLivePackage Updater Task" /f
schtasks /create /tn "TeXLivePackage Updater Task" /sc monthly /d /st 15:00:00 /tr "C:\Windows\Tasks\TeXLivePackageUpdater.bat"
```
更多关于计划任务的操作，可以去搜索，也可以参考[这篇文章](https://www.flighty.cn/html/tutorial/20170406_442.html)。
  * 调用 tlmgr 进行更新

第二部分是调用 tlmgr 进行更新TeXLive宏包。
```
tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet
tlmgr update --self
tlmgr update --list
tlmgr update --all --no-auto-install
```
以上四条命令分别实现的是**选取宏包源**、**更新 tlmgr 自身**、**列出可更新的宏包名**、**更新所有宏包**。
--no-auto-install 实现的是不自动安装。众所周知 TeXLive 是发行几乎所有投稿的宏包，所有每次更新里面都有太多自动安装的宏包。如果你想要这个功能，删掉这个参数即可。
更多关于 tlmgr 的操作，请参考[官方文档](https://www.tug.org/texlive/doc/tlmgr.html)。
  * 批处理编写

代码里面其余部分均是 bat 编程的基本语句，可参考[百度百科](https://baike.baidu.com/item/%E6%89%B9%E5%A4%84%E7%90%86/1448600?fr=aladdin)。
### 45. 不同平台LaTeX编辑器推荐

用户编写的 tex 文件，本质上是文本文件，因此很多编辑器都可以对 tex 文件进行更改。某些编辑器，如 notepad++，vscode，sublime 等，还对 tex 文件进行了语法高亮，甚至可以利用插件做成一个 IDE。
TexMaker 是一款免费、现代、跨平台的 LaTeX 编辑器，它能够在 linux，macosx 和 windows 系统中使用，并且将很多开发 LaTeX 文件的工具集成在了一个应用当中。详情见官网：[http://www.xm1math.net/texmaker/](http://www.xm1math.net/texmaker/)
TeXWorks 是集成在 TeXLive 和 MikTeX 中的编辑器（MacTeX 则集成了类似的 TeXshop），轻量简洁，适合新手学习。
WinEdt 是一款功能强大且功能多样的 Windows专用文本编辑器，具有很强的创建和编译LaTeX文档的能力，可与TeX系统（如MiKTeX或TeX Live）无缝集成。详情见官网：[http://www.winedt.com/](http://www.winedt.com/)
TeXStudio 是一款跨平台的开源TeX/LaTeX IDE(集成开发环境)，对于大部分用户而言，它的功能足以满足需要，下载可访问官网 [http://texstudio.sourceforge.net/ ](http://texstudio.sourceforge.net/)。
Texpad 是运行于 Mac/IOS 在线平台的编辑器，带自动编译，支持多人联合编辑，更多内容可访问 [https://www.texpad.com](https://www.texpad.com) 
Visual Studio Code（vscode），是一款强大的跨平台编辑器。安装LaTeX Workshop 插件后就可以尽享tex编程乐趣，界面比较美观，适合window平台，软件下载可见官网[https://code.visualstudio.com/](https://code.visualstudio.com/)。配置可参考下面网址[http://www.latexstudio.net/archives/11087.html](http://www.latexstudio.net/archives/11087.html)。
### 46. 如何在 Sublime 上配置 LaTeX 编译环境

可以参考LaTeXTools插件的安装教程，具体安装方法~~可见~~~~ ~~[http://www.qhjack.cn/blog/1787.html](http://www.qhjack.cn/blog/1787.html)
链接更新为[http://www.qhjack.cn/blog/1792.html](http://www.qhjack.cn/blog/1792.html)。
如果只是配置最简单的LaTeXTools(如果已经安装好TeXLive，Subline Text 3和Sumatra PDF)，也可以参考[https://blog.csdn.net/qazxswed807/article/details/51234834](https://blog.csdn.net/qazxswed807/article/details/51234834)。
### 47. LaTeX 能转成 word 吗

严格来讲，可以做，例如利用 pandoc。但十分不建议这样做。
## 三、文档编辑
### 48. La(TeX)教程

lshort-zh 是一本比较薄的针对中文用户的 LaTeX 入门教程，该教程已在发行版中，用户可以在命令行中执行
```
texdoc lshort-zh
```
来查阅。
LaTeX wikibook 是 [https://www.latex-project.org/](https://www.latex-project.org/help/books/) 中列出的 TeX and LaTeX Books 之一，用户可访问 [https://en.wikibooks.org/wiki/LaTeX](https://en.wikibooks.org/wiki/LaTeX) 进行查阅。
除此之外，用户还可以购买胡伟、刘海洋等编著书籍，这里不再赘述。
### 49. 关于LaTeX的书籍
* LaTeX 入门，刘海洋， 电子工业出版社；
* LaTeX2ε 完全学习手册(第2版)，胡伟，清华大学出版社；
* LaTeX 入门与提高(第二版) ，陈志杰等，高等教育出版社（注：此书出版逾十年，部分内容已经过时）；
* LaTeX Beginner's Guide, Stefan Kottwit, Packt Publishing.
### 50. LaTeX支持中文有哪些方式，如何选择

历史上，LaTeX 支持中文的方式包括中西文点点通、天元、CCT、CJK 等。目前流行的方式是使用 CTeX 宏集，详情请见 [https://mirrors.tuna.tsinghua.edu.cn/CTAN/language/chinese/ctex/ctex.pdf](https://mirrors.tuna.tsinghua.edu.cn/CTAN/language/chinese/ctex/ctex.pdf)
### 51. 关于教程，用户比较容易获取的有两个：lshort 和 LaTeX wikibook。
### 52. 关于TeX, Plain TeX及相关书籍
### 53. 关于类型的书籍
### 54. 关于其他TeX相关事项的书籍
### 55. 工具包文档
### 56. 可免费提供La(TeX)的书籍
* LaTeX常用数学符号
* LaTeX Note 包太雷
* 一份不太简短的 LaTeX2e 介绍
* Tex Live指南 2018
### 57. 获取在线帮助

一般资料可以去 wikibook 上面查询，网址是 [https://en.wikibooks.org/wiki/LaTeX](https://en.wikibooks.org/wiki/LaTeX)
提问可以先到 LaTeX Stack Exchange 看看，网址是 [https://tex.stackexchange.com/](https://tex.stackexchange.com/)
### 58. 如何提出问题

在问问题的时候，要先自己尝试，先问自己如何解决，清晰有效的组织自己想问的问题，究竟想表达什么？没有人会为你不知所谓的问题浪费时间，就算有人愿意理你，也会因为你的问题不清晰甚至完全无效的问题而伤透脑筋，为了自己，也为了别人，建议大家可以参考下[《提问的艺术》](https://www.jianshu.com/p/f96aa7f7bf59)这篇文字，清晰有效的提出自己的问题。
最后，要给大家强调一个问题，我们愿意在我们的能力范围内为你的问题进行讨论，尽全力帮你解决问题，但并不是我们的义务，问问题前，要强调的是，别人有权利不帮你。
![图片](https://images-cdn.shimo.im/oen00vOZ5jcQd3g8/T9A1X27O9_32FZZ_3Z7_8.png!thumbnail)大图可以参见[网址](https://i.loli.net/2018/08/08/5b6adcda1ab87.png)。
另外，在QQ群提出问题所使用的代码最好代码粘贴的网站，如[Ubuntu Pastebin](https://paste.ubuntu.com/)暂存，避免刷屏，影响效率。
### 59. 如何制作一个迷你范例（MWE）

迷你范例即最小工作示例，英文简称 MWE，以下内容摘自刘海洋的《LaTeX入门》。
最小工作示例就是一个精简到最小长度的、可以说明所需问题的TeX源文件。一方面，最小工作示例应该是一个完整的、可以直接编译的文件，利用示例可以方便地再现遇到的问题，不需要添加额外的代码；另一方面，示例文件应该尽可能地短小，不包含额外的文件，也没有与问题无关的文字代码干扰相对错误的分析。
一个典型的最小工作示例代码不应超过10行：
```
\documentclass{article}
\usepackage{amsmath}
\begin{document}
\[
  \cases{ a & b \cr
          c & d \cr}
\]
```

### 60. 学习如何撰写LaTeX类及工具包

      可以命令行使用texdoc查看clsguide，dtxtut，macros2e；classes，source2e，The TeXBook；expl3，interface3，l3styleguide，source3。以上内容参考自[知乎](https://www.zhihu.com/question/27017364)。以及《LaTeX2e文类和宏包学习手册》（胡伟，清华大学出版社）。
### 61. MetaFont和MetaPost教程
### 62. 在线介绍：LaTeX
### 63. 在线介绍：Plain TeX
### 64. 如何让参考文献满足国标GB7714-2015样式要求

有两种比较简单的方式。
首先是利用 biblatex 的例子，如
```
\documentclass{ctexart}
\usepackage[backend=biber,style=gb7714-2015]{biblatex}
\addbibresource{bibfilename.bib}
\begin{document}
  引用文献\cite{bibkey1,bibkey2}
  \printbibliography
\end{document}
```
接下来是利用 bibtex 的例子，如
```
\documentclass{ctexart}
\usepackage{gbt7714}
\begin{document}
  引用文献\cite{bibkey1,bibkey2}
  \bibliography{bibfilename}
\end{document}
```
### 65. 专家邮件列表
### 66. PicTeX手册
### 67. 基于TeX系统的教程
### 68. 排版教程
### 69. 关于TeX的Wiki书籍

LaTeX wikibook 是 [https://www.latex-project.org/](https://www.latex-project.org/help/books/) 中列出的 TeX and LaTeX Books 之一，用户可访问 [https://en.wikibooks.org/wiki/LaTeX](https://en.wikibooks.org/wiki/LaTeX) 进行查阅。
### 70. 如何找到...符号

在LaTeX中插入符号主要有两种思路。一种方式是加载符号宏包，利用宏包提供的命令插入符号；而对于XeTeX引擎，目前使用的多为Unicode编码的字体，直接加载Unicode字体，插入Unicode符号也是一种很好的办法。下面分别介绍：
* 加载符号宏包　*The Comprehensive LATEX Symbol List* 收录了上万文本或数学符号，在命令行中键入
```
texdoc symbols-a4
```
即可打开该文档。此外，[http://detexify.kirelabs.org/classify.html](http://detexify.kirelabs.org/classify.html) 提供了手写识别前述文档中所有符号的功能，十分便捷。
* 插入Unicode符号　可以从各种Unicode码表或字符映射表中找到所需要的符号，查出其编码，加载支持该码位的字体，直接在编辑器中输入该符号即可。如果符号在源代码编辑器中无法正常显示，还可以使用LaTeX的\symbol命令输入。\symbol命令的具体用法是\symbol{<十进制编码>}、\symbol{"<十六进制编码>}、\symbol{'<八进制编码>}、\symbol{`<字符形式（特殊符号须加转义符 \ ）>}。

如果使用的TeXstudio软件想要查找某个符号，那么还课拓展一下2个便捷的方式：
* 如下图点开1处的符号，再在2处选择符号类型，缩小查找范围，有 运算符、关系、箭头、分隔符、Greek、Cyrillic等，再点击需要的符号加入到数学环境中去这样就插入完成了。

  ![图片](https://images-cdn.shimo.im/LOSHDQ2baCooqfNu/5.png!thumbnail)
* 也可以手动输入，识别率不是特别高，可能需要多输入几次才会出来。设置如下：

向导=>数学助手 手写输入完之后插入即可。
![图片](https://images-cdn.shimo.im/StDWQgBPj9YmY4U1/image.png!thumbnail)

### 71. 如何找到FAQs
### 72. 如何控制章节编号的深度

LaTeX 标准文档类对章节划分了层级：
* 在 article 文档类里 part 为 0，section 为1，依此类推；
* 在 report/book 文档类里 part 为-1，chapter 为0，section 为1，等等。

secnumdepth 计数器控制章节编号的深度，如果章节的层级大于 secnumdepth，那么章节的标题、在目录和页眉页脚的标题都不编号（照常生成目录和页眉页脚），章节计数器也不计数。可以用 \setcounter 命令设置 secnumdepth 为较大的数使得层级比较深的章节也编号，如设置为4 令 \paragraph 也编号；或者设置一个较小的数以取消编号，如设置为-1 令 \chapter 不编号。后者是生成不编号的章节的一个妙招，免去了手动使用 \addcontentsline 和 \markboth 的麻烦。
secnumdepth 计数器在article 文档类里默认为3（subsubsection 一级）；在 report 和 book 文档类里默认为2 （subsection 一级）。
下面给出一个具体的例子：
```
\documentclass{book}
\setcounter{secnumdepth}{4}
\begin{document}
  \part{part}
  \chapter{chapter}
  \section{section}
  \subsection{subsection}
  \subsubsection{subsubsection}
  \paragraph{paragraph}
\end{document}

```
控制目录页排版显示深度可以使用\setcounter{tocdepth}{2}，此命令表示显示到三级标题。关于此问题的具体介绍可以参考[网址](https://blog.csdn.net/RobertChenGuangzhi/article/details/50480856)。
### 73. 如何下载 arXiv 上面的 TeX 源文件

先访问 arXiv 上面的文章，在右边找到 Downloads -> Other formats，点击进入下载页，点击 Download source。将文件下载到本地后，重命名文件，文件后缀名是 .tar.gz。接下来解压缩 .tar.gz 文件，即可获得 tex 源文件。
### 74. windows 系统下用 texstudio 打开中文编写的源文件遇到乱码怎么办

最简单的方法是借助 notepad++ 等编辑器将文件转码为 UTF-8。如果没有 noteapd++，也可以直接使用 texstudio。这里我们默认文件的编码是 GB2312。
首先打开文件，在 texstudio 右下角找到 encoding 位置的内容，有时系统显示为 ISO-8859-1。点击那里，进入 More encodings，在列表中点击 GB2312，然后点击按钮 view with。正常来讲，乱码应该都会消失。
接下来，继续进入 More encodings，在列表中点击 UTF-8，然后点击按钮 change to。
经过这些操作，源文件就重新变成了 UTF-8 编码。
## 四、介绍公式的常见问题。
### 75. \[...\]与$...$有什么区别？

重定义的难度不同、造成的间距也不同。推荐使用 \[...\]。
见 [https://www.zhihu.com/question/27589739/answer/37255728](https://www.zhihu.com/question/27589739/answer/37255728)

### 76. 如何让长公式自动断行？

长公式自动断行要看情况，如果是在行内模式，合理使用空格，一般可以在二元运算符处断行，如果是行间模式，推荐使用align类环境，在需要断行处添加 \\ 手动断行。
### 77. 公式希腊字符如何加粗？

希腊字母没有粗体，可以选择合适的数学字体。
### 78. 极限符号下面有两个趋近该怎么写

直接给出例子：
```
\documentclass{article}
\begin{document}
 \[ \lim_{n\to\infty\atop m\to\infty} \]
\end{document}

```
或者使用\substack，例子如下：
```
\documentclass{article} 
\usepackage{amsmath}
\begin{document}
\[ \lim_{\substack{n\to\infty\\ m\to\infty}} \]
\end{document}

```
效果如下：
![图片](https://images-cdn.shimo.im/FCY4A1SeBIcwBCGT/双重极限.PNG!thumbnail)
### 79. 怎样在 LaTeX 中输入引号

左引号用 `，右引号用 '。双引号也一样，`` ''。
## 五、参考文献篇
### 80. 参考文献中的特殊字符或字母
### 81. BibTeX 不理解的作者列表

BibTeX 只支持三种姓名格式：
* First von Last
* von Last, First
* von Last, Jr, First

多个姓名之间必须使用“and”连接，如
```
author = {Knuth, Donald E. and Lamport, Leslie},
```

### 82. BibTeX 排序和名字前缀
### 83. BibTeX 中的大写字母

英文标题中常使用的大小写方式有：
1. Title case: 句首字母大写，并且除冠词、连词和短介词以外的词首字母大写，这里说的“短”介词一般指不超过 4 个字母的介词。比如“The Quick Brown Fox Jumps over the Lazy Dog”；
2. Sentence case: 句首字母和一些专有名词的首字母大写，同普通的英文句子大小写方式一样，如“The quick brown fox jumps over the lazy dog”。

BibTeX 根据 bst 样式文件可以将题名保留原大小写，或转为 sentence case。所以用户在 bib 数据库中著录标题的正确方式是，统一使用 title case，并将需要专有名词用大括号括起来。
```
title = {Finite Element Methods for {Maxwell's} Equations},
```
注意尽量避免将一个词中个别字母用大括号括起来，如“{M}axwell's”，这可能会导致字母的间距有问题，建议将整个词括起来，如“{Maxwell's}”。

### 84. 如何选择参考文献的风格

参考文献的风格一般是期刊或会议模板指定 bst 的，作者应仔细阅读投稿要求和模板使用说明，根据规定使用合适的 bst。通常有以下方式：
1. 在文档中声明 `\bibliographystyle{ieeetran}

在模板的文档类选项中使用合适的参数，如“\documentclass[authoryear]{ustcthesis}”。 

### 85.  BibTeX 参考文献数据库

BibTeX 的 bib 文件是一个记录已阅文献的数据库，但是通常不建议手动编译 bib 文件，建议：
1. 使用 JabRef 或 Zotero 等文献管理工具导出 bib 文件创
2. 使用 [Google Scholar](https://scholar.google.com/) 或 [Bing 学术](https://cn.bing.com/academic)导出 bib 条目建

### 86. 创建参考文献风格

BibTeX 的风格文件 bst 是使用一种后缀语言写的代码，如果对编程能力比较自信的话，可以阅读 BibTeX 的文档 btxdoc 和 btxhak，btxbst.doc 文件提供了标准 bst 风格的代码注释，另外还可以阅读 ttb 和 The LaTeX Companion 等资料。

如果不习惯 bst 的编程语言，可以使用 custom-bib 工具，在命令行下运行latex makebst，回答一系列问题生成自己的bst。

另外还可以考虑使用 biblatex，它提供更方便的接口用于自定义参考文献格式。

### 87. 参考文献中的数字格式

参考文献表中的数字格式是由 \@biblabel 控制的，可以通过重定义该命令来修改格式。比如将数字修改为左对齐：
```
\makeatletter
\renewcommand\@biblabel[1]{[#1]\hfill}
\makeatother
```

### 88. BibTeX文献条目列表

科技论文通常要求参考文献表中的文献必须在正文中引用，但是在某些特殊情况下仅需要列出 bib 数据库中的文献，可以使用 \nocite{*} 命令列出调用的bib中所有条目，或者使用类似\nocite{ref1,ref2,ref3}命令列出需要显示的条目。

### 89. 制作参考文献的HTML
### 90. BibTeX中的多字母缩写
### 91. 多个参考文献表

natbib宏包与Donald Arseneau和Niel Kempson编写的chapterbib宏包兼容，该宏包允许在一个文档内有多个独立的参考文献列表。通常用法是一本书的各章有独立的参考文献列表，尤其是在各章由不同作者独立编写时。

### 92. 同一位置多文献引用

只需要将多篇文献的bibkey用英文半角逗号分隔写在一个cite指令的选项里即可。如：
```
\cite{knuth84,lamport86}
```

### 93. 非英文参考文献条目

什么叫非英文参考文献条目？是指bibkey么？一般不建议用中文，处理好编码格式，无殊。
中文的参考文献条目，与英文条目并没有什么差别，只是注意编码。目前处理中文推荐用xelatex 编译 utf8 编码的文件。因此中文的 bib 条目也应该用 utf8 编码。
### 94. **BibTeX**** 文献手写很困难，有没有什么工具能够生成？**

多数时候，我们无需自己手写 BibTeX 文献条目。从 [https://scholar.google.com/](https://scholar.google.com/)、[https://academic.microsoft.com/](https://academic.microsoft.com/)、 [https://cn.bing.com/academic?mkt=zh-CN](https://cn.bing.com/academic?mkt=zh-CN) 或者期刊、数据库的网站上都能够导出 BibTeX 文献条目。
老牌的文献管理软件 EndNote 也支持生成 BibTeX 格式的数据库，详情见 官网[https://endnote.com/](https://endnote.com/)。
开源软件 JabRef 甚至支持 BibTeX 文献条目的导入、导出和管理，详情见 官网[http://www.jabref.org/](http://www.jabref.org/)。
Zetero 使用起来也非常方便，详情见官网 [https://www.zotero.org/](https://www.zotero.org/)。
### 95. 如何使用 BibTeX 排版参考文献
* 准备一份 BibTeX 数据库，假设数据库文件名为 books.bib，和 LaTeX 源代码一般位于同一个目录下。
* 在源代码中添加必要的命令，如 \bibliographystyle{abbrv}，\bibliography{books}。假设源代码名为 demo.tex。其中，\bibliographystyle 设定参考文献的格式。\bibliography 告诉系统使用哪个数据库和参考文献列在哪个位置。
* 写好了以上两个文件之后，我们就可以开始编译了。例如在命令行中执行以下命令
```
xelatex demo
bibtex demo
xelatex demo
xelatex demo
```

### 96. 如何将参考文献条目录入到正文中

理工科类论文很少用。

### 97. bib文件的重建

用文本编辑器如Notepad++, Sublime Text或WinEdt或专门文献管理软件JabRef，BibDesk等创建文件，改名为 ref.bib 文件，往里头添加参考文献目录。参考如下：
![图片](https://images-cdn.shimo.im/VKQ8uAycksg1zPlo/image.png!thumbnail)
在.bib文件中，可以采用 TeXStudio 提供的参考文献格式，在自行修改内容
![图片](https://images-cdn.shimo.im/0OgCsRQoufMTDJ75/1.png!thumbnail)
上面的类型有两种选择 BibTeX 和 BibLaTeX ，后者的选择更为广泛。
参考文献一般不自己书写，而是有可以直接导入。
一般直接 Google 学术搜索出来的文献或者引用知网，如下：
![图片](https://images-cdn.shimo.im/L1fAEZmW9tYDVTYT/VRI1FEC62J_C6_QSK_P0_0.png!thumbnail)
点击上图红圈的引号->
![图片](https://images-cdn.shimo.im/N8tFzuXsCM8rOPjF/image.png!thumbnail)
在点击最左侧的 BibTeX ->
![图片](https://images-cdn.shimo.im/81Z6BGei8ycQf1uK/image.png!thumbnail)
将其复制黏贴到你的 ref.bib 文件中即可。
在知网上的文献查询需要下载安装如下软件：
![图片](https://images-cdn.shimo.im/ZsikCVGdjGIKBqSN/image.png!thumbnail)
两个都装好了之后，该软件需要自行注册登陆使用。
然后打开知网，会看到如下：
![图片](https://images-cdn.shimo.im/DVEoaSyHJKwmbSjH/2.png!thumbnail)
右上角红圈圈到的就是为浏览器安装的 Zotero Connector插件，在此需要打开 Zotero 软件，点击之后显示下图，选择需要的文献。![图片](https://images-cdn.shimo.im/w4eu1WOehS05gJ0g/image.png!thumbnail)
然后 Zotero 软件如下显示
![图片](https://images-cdn.shimo.im/VFUjYs5MvKQz522e/image.png!thumbnail)
然后文件->导出文献库->导出格式 BibTeX  确定保存生成的bib文件，可以将这个 bib 文件中的参考文献全部复制黏贴到你的 ref.bib 文件中，也可以单独作为一个新的bib文件，在正文区则需要添加多个bib文件就可以，用命令 \bibliography{test,ref}，多个bib文件用逗号分隔即可。同时为引用的参考文献需要命令 \nocite{*} 来将未引用的文件全部排版出来。
注：百度学术、万方数据库也支持导出 .bib 文件。
1. 如何减少参考文献条目行间距

文献条目间距为\itemsep,默认值4.5pt plus 2pt minus 1pt,可通过指令\addtolength{\itemsep}{距离}调整。

### 98. 按照章节分开参考文献条目

可看看chapterbib宏包。
### 99. 引文的排序及压缩

这个取决于使用的宏包，常用的natbib宏包可以使用sort或者sort&compress选项激活相应的排序或排序并压缩功能。
### 100. 引文列表排序

这个取决于bst，一般模板都有指定的bst。
### 101. BibTeX中过长的字符串
### 102. 按照“unsrt”规则的目录重排序
### 103. BibTeX参考文献中的URL

 调用url或者xurl宏包即可正常使用url，也可以看看href宏包。
### 104. 基于Plain TeX的BibTeX的使用
### 105. 常用的biblatex参考文献样式

biblatex除了可以应用自带的标准样式外，还可以使用其他作者提供的第三方样式，这里介绍一些常用的样式：
* 国外常用
  * APA
  * MLA
* 国内
  * GB7714-2015
样式名|用法|对应的bibtex样式|作者介绍|样式说明|
:----:|:----:|:----:|:----:|:----:|
trad-plain|`\usepackage[style=trad-plain]{biblatex}`|plain|MarcoDaniel and MoritzWemheuer，后者是biblatex维护者之一|将引文按字母顺序排序,比较次序为作者姓氏、出版年份和题名,如果不能顺序,将以在正文中的引用顺序为准。|
trad-unsrt|`\usepackage[style=trad-unsrt]{biblatex}`|unsrt|MarcoDaniel and MoritzWemheuer|按照在正文中引用文献的先后顺序排列文献,其排版格式与trad-plain基本相同|
trad-alpha|`\usepackage[style=trad-alpha]{biblatex}`|alpha|MarcoDaniel and MoritzWemheuer|用文献的作者姓氏前三个字母加出版年份的后两位数作为文献序号,如果出现相同的序号,则会根据排序结果在序号后追加字母以示区别，排序方法和排版格式与trad-plain相同|
trad-abbrv|`\usepackage[style=trad-abbrv]{biblatex}`|abbrv|MarcoDaniel and MoritzWemheuer|将文献中作者名和月份名的拼写改为缩写, 显得文献信息紧凑简洁, 其排序方法和排版格式与trad-plain相同|
ieee|`\usepackage[style=ieee]{biblatex}`|IEEEtran|Joseph Wright，biblatex 维护者之一|国际电气电子工程师协会IEEE期刊文献格式|
apa|`\usepackage[style=apa]{biblatex}`|apalike|Philip Kime，biblatex 作者之一|American Psychological Association 的文献格式|
Chicago|`\usepackage{biblatex-chicago}`|Chicago|David Fussner|for the Chicago Manual of Style|
iso-numeric|`\usepackage[style=iso-numeric]{biblatex}`| |Michal Hoftich|ISO690 international standard numeric system|
iso-iso-authoryear|`\usepackage[style=iso-iso-authoryear]{biblatex}`| |Michal Hoftich|ISO690 international standard nameanddate system,so-called Harvard style|
gb7714-2015|`\usepackage[style=gb7714-2015]{biblatex}`|gbt7714-unsrt.bst by zepinglee|hushidong|中文文献著录标准 GB/T 7714-2015 顺序编码制|
gb7714-2015ay|`\usepackage[style=gb7714-2015ay]{biblatex}`|gbt7714-plain.bst by zepinglee|hushidong|中文文献著录标准 GB/T 7714-2015 著者年份制|
caspervector|`\usepackage[style=caspervector]{biblatex}`| |Casper vector|一种中文文献格式|
nature|`\usepackage[style=nature]{biblatex}`| |Joseph Wright|for Nature|
science|`\usepackage[style=science]{biblatex}`| |Joseph Wright|for Science|
chem-acs|`\usepackage[style=chem-acs]{biblatex}`| |Joseph Wright|covers most American Chemistry Society journals|
chem-angew|`\usepackage[style=chem-angew]{biblatex}`| |Joseph Wright|covers Angewandte Chemie Chemistry–A European Journal.|
chem-biochem|`\usepackage[style=chem-biochem]{biblatex}`| |Joseph Wright|covers Biochemistry and asmallnumber of other American Chemistry Society journals|
chem-rsc|`\usepackage[style=chem-rsc ]{biblatex}`| |Joseph Wright|covers all Royal Society of Chemistry journals|
phys|`\usepackage[style=phys]{biblatex}`| |Joseph Wright|for AIP and APS|
nejm|`\usepackage[style=nejm]{biblatex}`| |MarcoDaniel|for New England Journal of Medicine|
mla|`\usepackage[style=mla]{biblatex}`| |James Clawson|for Modern Language Association|
authortitle-dw|`\usepackage[style=authortitle-dw]{biblatex}`| |Dominik Waßenhoven|for Humanities|
footnote-dw|`\usepackage[style=footnote-dw]{biblatex}`| |Dominik Waßenhoven|for Humanities|


* 
* 
## 六、字体篇
### 106. LaTeX字体是如何处理的

LaTeX 2ε目前的字体机制称为“新字体选择机制”（New Font Selection Scheme，NFSS）。它将文本字体分为五个互不干扰的属性（数学字体初学者不必过早了解）：
* 编码（encoding）。这个属性初学者暂时不必了解。在（pdf）latex和uplatex中，默认的西文编码称为OT1；在xelatex中，默认的编码称为EU2，就是Unicode。
* 字族（family）。一套成风格的字型的统称，如cmr、ptm（times）等。LaTeX 2ε预先定义了三个切换字族的命令：\rmfamily（衬线体）、\sffamily（无衬线体）、\ttfamily（等宽体）。
* 系列（series）。在一般的字体中一般表示字重（weight）。如粗体命令为\bfseries，正常粗细为\mdseries。
* 字形（shape）。在同一字族、同一系列下的风格差异，如斜体\slshape、意大利斜体\itshape、正体\upshape、小型大写\scshape。
* 字号（size）。以上四种变化是字型（typeface）的变化，而这是同一字型下不同大小的变化。LaTeX 2ε提供了成套的字号命令，如\normalsize、\small、\scriptsize等。

中文字体的方面，不同的中文解决方案的处理也有不同，这里就不介绍了。
### 107. 获取位图字体
### 108. PDF格式图片插入过程中的字形缺失
### 109. 为数学排版选择Type 1字体
### 110. Type 1字体配置
### 111. 切换到T1时字体变得模糊
### 112. 由于Ghostscript太旧造成字体模糊
### 113. 如何使用斜体

斜体一般是西文字体用的，在中文中不用斜体。
斜体这个名字比较误导，因为它对应英文的两个名字：倾斜体（slanted，指字形风格大致相同但是倾斜）和意大利体（italic，指字形设计为接近手写的形态，同时也就出现了倾斜）。
两种情况下分别有\slshape和\itshape两个命令，使用例如{\slshape slanted}及{\itshape italic}；也有把斜体内容作为参数的命令（推荐使用这种），如\textsl{slanted}及\textit{italic}。
### 114. 如何使用粗体
### 115. 列表环境 (enumerate/itemize/description) 的条目间距太大了，怎么改小一些？

可以使用 paralist 宏包，它提供了一系列压缩了行间距的列表。对应的环境名称分别是 compactenum/compactitem/compactdesc ，也可以使用 enumitem 宏包修改三个列表环境的格式。
### 116. 列表的条目项内容很短，可以让他们在一行内排版么？

可以使用 paralist 宏包，这个宏包提供了 inparenum/inparitem/inpardesc 环境，可以在行内输出列表内容；也可以带上 inline 选项使用 enumitem 宏包，可以使用带*形式的三个列表环境，即在行内输出列表内容。
### 117. enumerate 宏包修改列表标签格式很方便，但是这个宏包和 enumitem 宏包冲突，有什么解决办法么？

如果只是需要使用这种短标签表示方法，利用 enumitem 宏包同样能够做到，只需要带上 shortlabels 选项加载 enumitem 宏包即可。同时，enumitem 宏包提供了自定义短标签名称和格式的宏命令，你也可以自己定义一些有趣的标签形式。
### 118. 如何使用带圈数字作为 enumerate 列表的标签？

LaTeX 自带一个带圈字符的命令 \textcircled，不过，这个命令的排版效果非常差，几乎很少有人会直接使用。带圈数字可以通过unicode字符实现，也可通过 pifont 宏包中 \ding 命令实现（但是只能用到10以内的数字），甚至可以通过 tikz 自己绘制一个。使用带圈数字做enumerate的标签，可以通过 enumitem 宏包设置。这里给出一个使用 unicode 字符实现带圈数字的方法，并将其应用于 enumerate 的标签。
```
\documentclass{article}
\usepackage{xeCJK,xunicode,calc}
\usepackage[shortlabels]{enumitem}
\newcommand{\Cnum}[1]{%
\ifnum #1<21
  \edef\a{\the\numexpr #1+9311}
\else
  \ifnum #1<36
    \edef\a{\the\numexpr #1+12860}
  \else
    \ifnum #1<51
     \edef\a{\the\numexpr #1+12941}
    \else
      \PackageError{your package}{Number too large}{}
    \fi
  \fi
\fi
{\CJKfontspec{Noto Serif CJK SC}\fontspec{Noto Serif CJK SC}\symbol\a}}
\SetEnumerateShortLabel{o}{\protect\Cnum{\arabic*}}
\begin{document}
\Cnum{12} \Cnum{32} \Cnum{46} 

\begin{enumerate}[o]
  \item The first item.
  \item The second item.
  \item The Third One.
\end{enumerate}
\end{document}
```
### 119. 公式之后解释公式符号的文字，通常是 “符号 —— 解释” 这样的格式，我希望这段文字的格式是按破折号对齐，并且解释文字折行后悬挂缩进，怎样实现这样的格式？

方法很多，可以列表，可以align等环境。
### 120. 如何给目录中的章节都带上引导点来连接页码？

 这个需要在cls里查看目录的设置，可以通过修改或重定义\titlecontents的方式来设置想要的格式。
### 121. 格式
### 122. **打开.tex文件出现乱码**

   这个一般是由于文档保存的编码和编辑器默认编码不一致导致的，可以用记事本或者notepad++之类的转换文档编码，也可以在编辑器里选择相应的编码格式重新打开文档，还需要注意的是编码与编译引擎也需要一致，才能得到正确的结果。
10. **字体相对大小指令**

\small 等命令对应的字体大小与文章 \documentlcass 中指定的字体有关，对应 10, 11, 12pt 三种全局字体大小的情况如下表所示，
      指令                        10pt    11pt    12pt
      \tiny                           5       6       6
      \scriptsize                 7       8       8
      \footnotesize            8       9       10
      \small                        9       10      10.95
      \normalsize              10      10.95   12
      \large                       12      12      14.4
      \Large                      14.4    14.4    17.28
      \LARGE                    17.28   17.28   20.74
      \huge                       20.74   20.74   24.88
      \Huge                      24.88   24.88   24.88

## 七、插图篇
### 123. LaTeX可以插图哪些类型的图片？

我们通常使用LaTeX、PDFTeX、XeTeX编译源文件。各种编译方式下图形格式支持如下
* LaTeX直接支持EPS、PS图形文件，间接支持JPEG、PNG等格式；
* PDFTeX直接支持PNG、PDF、JPEG格式图形文件，间接支持EPS；
* XeLaTeX直接支持BMP、JPEG、PNG、EPS、PDF图形格式

【注意】在使用PDFLaTeX时，如果要插入EPS，可以先把EPS转化为其他格式（比如PDF、JPEG、PNG、EPS），或者在导言区加载epstopdf，此宏包需要在graphicx宏包之后调用。更改图片格式可以使用ImageMagick或者类似[改图宝](http://www.gaitubao.com)等在线改图软件。
### 124. 图片的路径如何自动设置，不用正文一个个设置路径？

 可以使用指令graphicspath来设置图片路径，如：\graphicspath{{./figures/}} 即设定图片路径为当前目录下子文件夹figures。
### 125. 图片浮动如何控制？各自参数如何使用？
### 126. 图文混排用什么方法实现？
### 127. 并列插图如何进行排版

并列插图有3种情况：
* 并排摆放，各有标题。 

可以在figure环境中使用两个minipage环境，每个里面插入一幅插图。
```
\begin{figure}[htbp]
\centering
\begin{minipage}{60pt}
\centering \includegraphics[scale=0.4]{leftfigure.png} \caption{左边的图片} 
\end{minipage}
\hspace{10pt}%用来调整图片中间的间距
\begin{minipage}{60pt}
\centering
\includegraphics[scale=0.4]{rightfigure.png} \caption{右边的图片}
\end{minipage}
\end{figure}
```

* 并排摆放，共享标题 

通过使用两个\includegraphics命令
```
\begin{figure}[htbp]
\centering 
\includegraphics{leftfig.png} 
\includegraphics{rightfig.png} 
\caption{总标题} 
\end{figure}
```
* 并排摆放，共享标题，并且有各自的子标题

如果想要两幅并排的图片共享一个标题，并且各有自己的子标题， 可以使用 Steven D. Cochran 开发的 subfig 宏包。它提供的 \subfloat 命 令，并且总图和子图可以分别有标题和引用。 

```
\begin{figure}[htbp]
\centering
\subfloat[左边图片的标题]{
\label{fig:subfig_a} \includegraphics[scale=0.4]{leftfig.png} 
}
\hspace{10pt}% 用来调整两图中间的间距
\subfloat[右边图片的标题]{
 \label{fig:subfig_b}
 \includegraphics[scale=0.4]{rightfig.png}
} \caption{总标题} \label{fig:subfig} \end{figure}
```

此外，如果是并列的是两个有各自标题的插图，可以使用floatrow系列浮动体宏包，该宏包提供的floatrow环境可以并列图表等浮动体。

### 128. 并列子图如何进行排版

并列子图可以看看subfigure，subfloat等宏包。
### 129. 如果想让图片的题注在图片右侧，应该怎么做

可以利用盒子来实现这个功能。下面给出一个例子
```
\documentclass{article}
\usepackage{graphicx}
\begin{document}
    \begin{figure}
    \centering
    \includegraphics[width=0.45\linewidth]{figure.png}
    \parbox[b]{0.45\linewidth}{\caption{the content of caption}}
  \end{figure}
\end{document}
```
若要让题注在图片左侧，只需将 \parbox 那段代码移到 \includegraphics 之前。
## 八、表格篇
### 130. 如何指定表格的总宽度

可以看看tabularx、tabu等宏包。

### 131. 指定列宽度的表格如何使单元格内容居中

 指定宽度的表格列一般采用 p{<width>} 形式的列格式，这种列格式下，表格内容是两端对齐的，如果想使其成为居中对齐需要借助 array 宏包提供的功能，示例如下：
```
\usepackage{array} % this line in preamble
\begin{tabular}{c|>{\centering\arraybackslash}p{4cm}}
\hline
1  &  3.530  \\
2  &  456.0  \\
3  &  78.945 \\
4  &  3.65   \\
\hline
\end{tabular} 
```
而 >{<format>}p{<width>} 这样的格式在文档的应用过程中是非常不方便的，array 宏包同时提供了 \newcolumntype 宏命令可以将其定义为一个较为简短的格式，如：
```
\newcolumntype{z}[1]{>{\centering\arraybackslash}p{#1}}

```
从而可以在正文中使用
```
\begin{tabular}{c|z{4cm}}
\hline
1  &  3.530  \\
2  &  456.0  \\
3  &  78.945 \\
4  &  3.65   \\
\hline
\end{tabular}
```
类似的，采用 \raggedright 或 \raggedleft 替换\centering 可以使得单元格内容变成左对齐或右对齐。
1. tabularx 中的 X 列格式如何居中对齐

同样采用 array 宏包的 >{<format>} 方法，并利用 \newcolumntype 定义新的列格式，如：
```
\usepackage{array,tabularx}  % this line in preamble
\newcolumntype{Z}{>{\centering\arraybackslash}X} % this line in preamble
\begin{tabularx}{\linewidth}{ZZ}
\hline
1  &  3.530  \\
2  &  456.0  \\
3  &  78.945 \\
4  &  3.65   \\
\hline
\end{tabularx}

```
### 132. tabularx 中的 X 列格式，当单元格内容发生换行时，如何使同一行其他列的单元格垂直居中对齐？

对于指定宽度的表格列格式 p{<width>}，单元格内一旦进行换行，该单元格同一行内其他列的单元格内容均为垂直方向上顶端对齐，我们可以使用 array 宏包，以 m{<width>} 列格式或者 b{<width>} 列格式 替代 p{<width>} 格式即可实现垂直居中对齐或垂直底部对齐。对于 tabularx 中的 X 列格式，也是采用同样的思路实现，只是这里需要对 \tabularxcolumn 宏进行重定义如下：
```
\usepackage{array,tabularx}   % this line in preamble
\renewcommand{\tabularxcolumn}[1]{m{#1}}  % this line in preamble

```
以上则将同行的其他列单元格设置为垂直居中对齐。显然的，垂直底部对齐的设置方法是将重定义宏命令中的 m{#1} 替换为 b{#1} 即可。
1. booktabs的三线表，竖线为什么是不连续的？

宏包的作者为表格线的前后都增加了额外的sep，而且，宏包的作者认为三线表是不应该有竖线的。当然，如果你一定想要使用竖线，不妨以下面两个命令将表格线前后的sep设置为0pt。
```
\usepackage{booktabs} % this line in preamble
\setlength{\belowrulesep}{0pt}
\setlength{\aboverulesep}{0pt}
```
### 133. 表格的一列全是公式，有什么办法能输入简单些？

可以使用 array 宏包，>{ } 与 <{ } 可以为一列数据前后加上特定的宏命令。在一列数据前后均加上$则把这列数据放入数学模式中，举例如下：
```
\usepackage{array} % this line in preamble
\begin{tabular}{>{$}c<{$} c}
\hline
\multicolumn{1}{c}{function} &  value \\
g(x)     &  3.65   \\
f(x)     &  2.58   \\
\sin(x)  &  14.7   \\
\hline
\end{tabular}
```
第一列数据省去了输入数学模式起止符号 $ 的痛苦。对于不需要放入数学模式的单元格，比如表头，需要用 \multicolumn{1}{c}{xxx}的方式来保护一下，重新指定对齐方式。
1. 我的表格单元格内容是一个列表环境 (enumerate/itemize)，它和表格横线之间间距好大啊，怎么能把这些间距去掉？

### 134. 如果想让表格中数字小数点对齐要怎么做

 可以借助 @ 的功能，如
```
\begin{tabular}{r@{.}l}
  \hline
  1 & 0 \\
  23 & 1 \\
  \hline
\end{tabular}
```
或者借助 warpcol 宏包提供的功能，如
```
\documentclass{article}
\usepackage{warpcol}
\begin{document}
\begin{tabular}{P{3.1}P{-2.1}}
  \hline
  \multicolumn{1}{c}{Label 1} & \multicolumn{1}{c}{Label 2} \\
  \hline
  123.4 & -12.3 \\
  12.3 & 12.3 \\
  1.2 & 1.2 \\
  \hline
\end{tabular}
\end{document}
```
还可以借助 array 和 dcolumn 的配合，如
```
\documentclass{article}
\usepackage{array,dcolumn}
\newcolumntype{d}[1]{D{.}{.}{#1}}
\begin{document}
\begin{tabular}{cd{3}}
  \hline
  1 & 3.14 \\
  2 & 27.12 \\
  3 & 78.095 \\
  \hline
\end{tabular}
\end{document}
```
### 135. 表格竖排
```
\documentclass{ctexart}
\usepackage[usestackEOL]{stackengine}

\begin{document}

\setlength\normalbaselineskip{11pt}
\strutlongstacks{T}
\begin{tabular}{|c|c|c|}
\hline
Foo bar & {\Centerstack{ 这 \\ 一 \\ 列 \\ 竖 \\ 排 }} & Foo bar \\
\hline
\end{tabular}

\end{document}
```
## 九、beamer篇
### 136. 隐藏导航栏

Beamer 自带的导航符号看起来很不错，但是实际上使用的并不多，为了让文稿的显示面积增加，减少干扰元素，我们可以隐藏下方的导航栏符号，两个方法如下：

```
\setbeamertemplate{navigation symbols}{}
\beamertemplatenavigationsymbolsempty % both ok
```

如果需要去掉下方 title，Author 等信息的话，可以用

```
\setbeamertemplate{footline} 
```
### 137. 向 Beamer 中添加参考文献

我们可以使用下面的命令添加参考文献，最好放在 `appendix' 后面。

```
\begin{frame}[allowframebreaks]{References}
\def\newblock{}
\bibliographystyle{plain}
\bibliography{mybib}
\end{frame}
```
### 138. 每节显示目录

在我们做一个比较长的报告时，我们可能会想在每一节添加一个目录，让听众清楚内容讲到哪了，我们可以在导言区添加如下的命令。

```
\setbeamerfont{myTOC}{series=\bfseries,size=\Large}
\AtBeginSection[]{\frame{\frametitle{Outline}%
                  \usebeamerfont{myTOC}\tableofcontents[current]}}
```
为了得到节的标题信息，我们会在帧与帧之间添加 `\section[short_title]{long_title}', 其中 	short_title	是短标题，用于 “页眉” 信息（header）显示。如果你不想要显示每帧的页眉信息（header），可以使用下面的命令。

```
\setbeamertemplate{headline}{}
```
### 139. 多栏显示

	有时候我们有图需要并排摆放，一个好方法是使用分栏，尤其是当两个图不同的高度的时候，然后在每一栏插入我们需要的图片。代码如下：

```
\begin{columns}[c] % Columns centered vertically.
\column{5.5cm}     % Adjust column width to taste.
\includegraphics ...
\column{5cm}
\includegraphics ...
\end{columns}
```
### 140. 添加 LOGO

在右下方添加 logo，直接用系统默认的命令就可以。

```
\logo{\includegraphics[width=0.08\textwidth]{logo500}}
```

如果需要在右上方添加 logo，可以用 TikZ 命令（需要用到 tikz 宏包）在 Frametitle 上添加。

```
\addtobeamertemplate{frametitle}{}{%
\begin{tikzpicture}[remember picture,overlay]
\node[anchor=north east,yshift=2pt] at (current page.north east) {\includegraphics[width=0.09\textwidth]{logo500}};
\end{tikzpicture}}
```
## 十、绘图篇

## 十一、开发篇-含LaTeX3

介绍宏开发技巧，宏包和模板类开发的常见问题。
### 141. 在阅读已有的宏包或者文类时，遇到未知的命令应如何处理

可以参照胡伟的《LaTeX2e文类和宏包学习手册》中的第四章-命令集注。
# 十二、常见错误提示﻿
* ! LaTeX Error: File `xxx.sty' not found.    \usepackage时，引用错误宏包名称或者本机未下载相应的宏包。解决方法为检查拼写，或TeXLive使用tlmgr安装宏包。
* ! LaTeX Error: File `xxx.cls' not found.    \documentclass时，引用错误文类名称或者本机未下载相应的文类。解决方法为检查拼写，或TeXLive使用tlmgr安装文类。
* ! Undefined control sequence.    编译遇到不存在的命令（未定义的控制序列）。解决方法为检查拼写，引用相应的宏包，或者定义该命令。
* ! Missing { inserted. 或者 ! Missing } inserted.    缺少分组的某个花括号。解决方法为仔细查找上下文对应的花括号。
* ! Missing $ inserted.    缺少数学环境，通常为把数学环境专用的命令用在普通文本模式。
* ! LaTeX Error:  Can be used only in preamble. 有许多命令只能用于导言区，如果在document 环境中用了这些命令，将显示上面的错误信息。
* ! LaTeX Error:  Counter too large.  计数器数值太大，一般是在需要以字母形式显示的计数器其数值超过了26。
* ! LaTeX Error:  \include cannot be nested. 在一个已经要用 \include 引入的文件中又使用了 \include 命令。
* ! LaTeX Error: Missing \begin{document} 这种情况可能是忘了输入\begin{document}，或者是在导言区中有可打印的文本，还有可能是编译中断时在 aux 等辅助文件中写入错误，对于后者，可以清理辅助文件后重新进行编译。
* ! LaTeX Error: No counter `xxx' defined. 调用某计数器，但该计数器并不存在。
* ! LaTeX Error: No \title given. 在给出 \title 声明之前就使用了 \maketitle 命令。
* ! LaTeX Error: Something's wrong--perhaps a missing \item. 导致这个问题一般是在列表环境中的文本不是由 \item 开始的。
* ! LaTeX Error: There's no line here to end. 在\par 或空行后调用命令\newline 或 \\ 。这里它们没有任何意义，如果需要额外竖直间距，应使用 \vspace 命令。
* ! LaTeX Error: Lonely \item -- perhaps a missing list enviroment. 在列表环境外使用了\item 命令。
# 十三、用法惯例
1. TeX编辑器中的魔法注释

在TeX中有单行注释命令为%，其后的文本主要是对源代码进行一些说明，它们会被TeX，LaTeX等排版引擎所忽略。但有些注释对专门的TeX相关编辑器来说，可能用特别的意义。在不同的TeX编辑器中，这魔法注释(magic comments）可能是不同的。
下面是一些例子：
* 指定TeX编译器
```
TeXStudio，TeXworks
% !TeX program = xelatex
 
TeXShop
%！TEX TS-program = xelatex  
```
同理，将 xelatex 变为 pdflatex，就可以强制调用 pdfLaTeX 编译器。
在代码中需要使用ifxetex宏包进行条件判断。
* 指定文档为 utf-8 编码
```
TeXworks，TeXStudio
% !TeX encoding = utf8
```
Winedt(由于Winedt对编码自动识别能力较弱，使用此注释比较必要，不然要手动设置)
```
% !Mode:: "TeX:UTF-8"
或者
% -*- coding: utf-8 -*-
 
TeXShop
%!TEX encoding = UTF-8 Unicode

```
* 指定主文档
```
TeXStudio
% !TeX root = filename
```
* 指定bib处理程序

用biber处理bib文件，可在文件头添加如下代码
```
TeXStudio
% !TeX TXS-program:bibliography = txs:///biber
```
将biber改为bibtex，就可指定bibtex处理bib文件。
* 为TeX编译器指定参数

有时在使用某些宏包时我们需要额外调用一些编译参数，例如 minted 宏包需要使用 --shell-escape，这时可用如下魔法注释实现该功能
```
TeXStudio
% !TeX TXS-program:compile = txs://xxelatex/[--shell-escape]
 
sublime text - latextools
%!TEX options = --shell-escape
 
texshop
% !TEX parameter = --shell-escape
```

下面是各种编辑器对神奇注释的支持情况

|编辑器|Encoding|Program|Root|Spellcheck|
|:----:|:----:|:----:|:----:|:----:|
|TeXShop|x|x|x|x|
|TeXStudio|x|x|x|x|
|TextMate|?|x|x|?|
|TeXworks|x|x|x|x|
|SublimeText|o|o|?|?|
|VSCode|o|o|?|?|
|Atom|o|x|x|o|
|Vim (vimtex)|o|x|x|o|
|Texpad|o|o|?|?|

**注意：**

- x：支持特性 
- o：不支持特性 
- ?：不确定

## 其它

* LaTeX与数学软件(Mathematica, Maple,Sagemath等)
* LaTeX与公式编辑器
* MathJaX

**官网**：http://www.latexstudio.net
**微信公众号**：latex2015
**QQ 交流群**：91940767
