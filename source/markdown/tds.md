# 什么是 TDS

TDS 全称 TeX Directory Structure，意为 TeX 目录结构，即 TeX 发行版的文件组织结构。大部分 TeX 发行版都将自身的文件组织成相近的路径结构，也就是 TDS。TDS 也称为 TEXMF 树，这是 TeX 与 METAFONT 的合称。很多系统的 TDS 结构都以 `texmf` 或者类似的词作为 TEXMF 树的根目录名，如在 TeX Live 中，安装目录下的 `texmf-dist`、`texmf-var` 等就是两个不同的 TEXMF 树。

下面是 TeX Live 中 `texmf-dist` 下的目录结构（有所删节，同时根据安装情况可能有所出入）：

    bibtex/                     BibTeX 相关文件
        bib/                        公用 bib 数据库
        bst/                        格式文件
    doc/                        各类用户文档
        bibtex/                     BibTeX 相关文档
        fonts/                      字体文档
        generic/                    通用于各种格式的文档
            pgf/
                pgfmanual.pdf           PGF/TikZ 用户手册
                ...
            ...
        latex/                      用于 LaTeX 格式的文档
            ctex/
                ctex.pdf                ctex 宏集用户手册
                README.md               ctex 宏集简短介绍
            ...
        texlive/                    TeX Live 发行版自身的文档
        ...
    fonts/                          字体相关文件
        opentype/                       OpenType 格式的字体
        source/                         字体源代码
        truetype/                       TrueType 格式的字体
        type1/                          Type1 格式的字体
        .../
    scripts/                        可执行脚本
        l3build/                        LaTeX 构建、测试脚本
        latexmk/                        自动编译系统
        texdoc/                         文档查询系统
        ...
    source/                         源代码
        bibtex/                         BibTeX 相关宏包代码
        fonts/                          字体源代码
        generic/                        通用于各种格式的宏包代码
        latex/                          用于 LaTeX 格式的宏包代码
            ctex/                           ctex 宏集源代码
                ctex.dtx
                ctex.ins
                ctexpuct.spa
            ...
        ...
    tex/                            TeX 宏，可被引擎读入
        generic/                        通用于各种格式
        latex/                          用于 LaTeX 格式
            base/                           LaTeX 的基本宏文件
                article.cls
                book.cls
                report.cls
                latex.ltx
                ...
            beamer/                         beamer 宏包相关文件
            ctex/                           ctex 宏集相关文件
                ctexart.cls
                ctexbeamer.cls
                ctexbook.cls
                ctexrep.cls
                ctex.sty
                ...
            ...
        plain/                          用于 Plain TeX 格式
        xetex/                          用于 XeTeX 引擎
        xelatex/                        用于 XeTeX 引擎下的 LaTeX 格式
            xecjk/                          xeCJK 宏包相关文件
                xeCJK.sty
                ...
        ...
    ...
