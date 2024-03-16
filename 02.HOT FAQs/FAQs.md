## 常见问题集

> - 本文档用于收集**包括但不限于** LaTeX 交流群中群友的问题
>
> - 由于本人时间有限，目前只会记录本人自己答疑的问题，其他群友答疑的问题暂时不会记录
>
> - 由于群 U 逆天，部分问题并不会给出群友心中完美的解答.
>
> - 由于群友部分问题描述过于模糊/严重违背常理，这类问题不予记录
>
> - Stay simple, stay fool.

#### 向量的箭头如何对齐？<2024/03/16 10:47 LaTeX技术交流1群 (91940767)>

- *对方附了一张编译后的PDF截图用以补充描述* 已知向量 $\vec a,\vec b$ 满足... （图片上很明显向量字母 $\vec a$ 和 $\vec b$ 上方的箭头高度不一）

  - 群友：建议 `\usepackage{bm}` ，然后 `$\bm a$` ，使用加粗方式替代箭头

  - 试试这个，把所有箭头调到字母h的高度（我认为 h 和 b 应该是小写字母里最高的了，t 其次...）
    ```tex
    \documentclass{article}
    \let\nvec\vec
    \def\vec#1{\nvec{\vphantom h\smash{#1}}}
    
    \begin{document}
      $\vec{a} + \vec{b}$
    \end{document}
    ```

- 这个也是自定义命令？

  - 这个是先"备份" `\vec` 这个命令到 `\nvec` 里，然后再重新定义 `\vec` ，让它在以前命令的基础上里面输入的高度为 h 也好， b 也好，这类字母的高度应该是最高的.

  - `vphantom` 就是把字母h包成一个相同高度的空白，但是不让他显示出来，因为空白存在后来新定义 `\vec` 时调用之前备份 `\nvec`，箭头会按照h的高度来显示.

  - 你可以重新定义一些已有的命令也可以新定义其他你想要的命令.

  - 评价 @啸行：我认为这样不好……另外，打印的书籍中，我还是更常见用粗体表示向量的.

---

#### 如何让 `\frac` 重新定义成 `\dfrac` 的效果？<2024/03/16 19:33 LaTeX技术交流1群 (91940767)>

- 重新 `\frac{}` 定义，具有 `\dfrac{}` 的功能.
- 请教一下，如何将这个命令 `\dfrac{}` ，设置为新命令，自动化. 谢谢.

  - 你是要 `\renewcommand{\dfrac}[2]{…#1…#2…}` 吗…

  - 还是你说的自动化是想无论行间、还是行内公式都像 `dfrac` 的效果？那你可以 `\everymath{\displaystyle}` ，但是不推荐这样，会把行内间距都搞乱掉，一会高一会低的.
- 这样子，是不是将这个命令 `\frac{}` 设置具有 `\dfrac{}` 的功能. 谢谢.

  - 你可以把设置的 `displaystyle` 看成 `frac` 有 `dfrac` 的显示效果，但是除非是比如说你的甲方也好、老板也好、出版社也好有这个癖好，否则不要这样搞，很难看的.
- 你要问行内那不这样太小了咋办？行内分数比如二分之一，直接 `$1/2$` 就好了.
  - 补充：他这种情况亦可以 `\let\frac\dfrac` ，用 `\dfrac` 的定义盖掉 `\frac` 的定义；当然 `\renewcommand` 也可以的.

---

#### 调节 `\frac` 的分子、分母和分数线之间的距离 <2024/03/16 20:42 LaTeX技术交流1群 (91940767)>

- `\frac` 的分子分母与分数线之间的垂直间距可以调吗?

	- 群友：为什么要做这些出力不讨好的调整呢？用默认的，轻松.

	- 实在搞不懂...你可以用 `\frac`， `\dfrac` 和繁分数的 `\cfrac`

	- 如果你实在还想自定义，看这 [Adjusting vertical spacing in fractions?](https://tex.stackexchange.com/questions/500157/adjusting-vertical-spacing-in-fractions) ，解答中大部分也都建议用 `cfrac` 等命令，当然也给出了自定义间距方案——瞎折腾干啥呢...
- 我记得有个大佬发过怎么调的，但是我的收藏里找不到了

	- 送你一个搞笑的解答：用TikZ画——[万物均可TikZ](https://tex.stackexchange.com/a/500341/299948).

---

#### 当目录只有一页时候可以正常显示，当目录页码比较多需要多页显示时，目录就开始显示异常 <2024/03/16 21:26 LaTeX 工作室论坛>

##### 问题分析

- 首先更正一下提问者的描述：应该为“当文档中没有 `\subsection` 时目录可以正常显示，当文档中有 `\subsection` 时，目录就开始显示异常”.
- 这个问题是这个样例的作者设计的缺陷，作者原稿：[排版设计大赛一等奖 -初高中数学衔接教程 书籍设计](https://ask.latexstudio.net/addons/ask/go/index?url=https%3A%2F%2Fwww.latexstudio.net%2Findex%2Fdetails%2Findex%2Fmid%2F951.html)
- 导致整个问题的原因，是原稿作者为了在目录左侧空白加入图片（比如原稿中的一个十字相乘的图）
- 这里是怎么实现的呢？原稿作者巧妙利用了目录中添加的 `\subsection` ，利用`tocloft`包强行让 `\subsection` 在目录中添加很大的 `indent`，甚至还添加了很大的 `skip`，来给要添加的图片预留位置，这一点从代码中便可看出来，代码中对这部分写道

```tex
\renewcommand{\cftsubsecindent} {2em}
\renewcommand{\cftbeforesubsecskip}{-1.5cm}
```

- 这下好了，当使用者要添加 `\subsection` 时，目录中的 `\subsection` 就会因为上面两行代码挪位到很奇怪的位置，进而导致乱版.

##### 解决方案

- 首先既然作者设计时没考虑使用者要使用 `\subsection` ，那就干脆不让目录中添加 `\subsection`，将 `tocdepth` 的值从2改为1，即 `\setcounter{tocdepth}{1}`

- 其次可以自行调整代码中的那两个参数，但是很明显，目录左侧的图片也会跟着移动. 所以如果使用者不需要，也可以干脆不在目录中添加图片.

##### 用户追问

- 怎么设置把在目录中添加图片的功能去掉以正常显示所有目录？

##### 追加解答

- 那张图名为 `13.png` ，那就 `control+F` 查找 `13.png` ，删去 `\addcontentsline{toc}{subsection}{\includegraphics[]{13.png}}` 即可解决.

- 这行命令的意思就是在目录的 subsection 添加为一张图片.