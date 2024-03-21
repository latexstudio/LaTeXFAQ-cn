## 常见问题集

> - 本文档用于收集**包括但不限于** LaTeX 交流群中群友的问题
>
> - 由于本人时间有限，目前只会记录本人自己答疑的问题，其他群友答疑的问题暂时不会记录
>
> - 由于本人能力有限 + 群 U 逆天，部分问题并不会给出群友心中完美的解答.
>
> - 由于群友部分问题描述过于模糊/严重违背常理，这类问题不予记录.
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



#### 调节 `\frac` 的分子、分母和分数线之间的距离 <2024/03/18 25:06 LaTeX技术交流1群 (91940767)>

- 请问一下，我希望调整ctexbook类的section项的样式，希望其字体按照我希望的本地字体加载，但以下两个命令，一个只能控制西文字体，一个只能控制中文字体，但二者同时加载会发生冲突，请问我该如何才能同时控制中西文字体呢？字体文件 `ChironSungHK-H.ttf` 附上.

```tex
\documentclass{ctexart}
\usepackage{fontspec}
\newfontfamily{\CSHH}{ChironSungHK-H.ttf}                %只能控制西文
%\newCJKfontfamily{\CSHH}{ChironSungHK-H.ttf}            %只能控制中文
\ctexset{section={format=\CSHH\raggedright\zihao{-4}}}

\begin{document}
    \section{ABC一二三}
\end{document}
```


- 解决方案

```tex
\documentclass{ctexart}
\usepackage{fontspec}
\usepackage{lipsum,zhlipsum}

\newfontfamily\CSM{CSMS}[Extension=.ttf]
\setCJKfamilyfont{CSHK}{ChironSungHK-H}[Extension =.ttf]

\ctexset{section={format=\CJKfamily{CSHK}\raggedright\zihao{-4}}}

\begin{document}

\section{第一章}
    \lipsum[6]
    \CSM\lipsum[6]
    \zhlipsum[6]
    \CJKfamily{CSHK}\zhlipsum[6]
\end{document}
```

- 你如果是在项目地址导入字体，那么就加入这个 `.ttf` ，然后名字要和 `.ttf` 文件名对应.

- 如果是直接安装电脑里的，那么你就要把字体名字改为电脑字体管理界面显示的名字.

#### 调节 `\frac` 的分子、分母和分数线之间的距离 <2024/03/20 20:57 LaTeX技术交流1群 (91940767)>

- 请教一下 怎么加了 `\displaystyle` 这个公式的积分号还是比较小呢，请问能不能让积分号更大一点呢，我试过了 `\cfrac` 发现效果还是不行.

  ```tex
  $$
  C=\frac{A\varepsilon_{0}\varepsilon_{\perp}}{\displaystyle \int_{0}^{l}\frac{dz}{1+\gamma\left(1-\frac{\left(z-\frac{l}{2}\right)^{2}}{R^{2}}\right)}}
  $$
  ```

  $$
  C=\frac{A\varepsilon_{0}\varepsilon_{\perp}}{\displaystyle \int_{0}^{l}\frac{dz}{1+\gamma\left(1-\frac{\left(z-\frac{l}{2}\right)^{2}}{R^{2}}\right)}}
  $$

  - 群友：建议积分号右边用 `tfrac` ，或者上下同乘 `R^2`
  - 群友：不要在MD中做这个，它不合适；实在想做就在LaTeX里面做，有无数种的方法.

- 我知道，我只是调个公式 懒得开 `tex`.

  - 群友：你这嵌套太多了.

- 效果更不好了，我不知道是不是这个md渲染的问题，我还是开一个 `tex` 试试

$$
C=\frac{A\varepsilon_{0}\varepsilon_{\perp}}{\displaystyle \int_0^1\tfrac{dz}{1+\gamma\left (1-\frac{\left (z-\frac{1}{2}\right)^{2}}{R^{2}}\right)}}
$$

- 把 `\fracl2` 直接写成 `l/2` 视觉上或许会好些.

  - 群友：上下乘 `R^2` 消掉一层嵌套.
- https://tex.stackexchange.com/questions/39181/big-integral-sign#:~:text=The%20command%20%5Cmathlarger%20of%20the,mathlarger%7B%5Cint%7D%7D%7D%20%2C%20etc. 这大不大？

  - 心满意足，谢谢大神.
- 还是不建议搞太大，否则你不觉得 `dz` 太...
  - 好像也对.
  - 群友：小马拉大车是吧.
- 他不只是大小的问题，还有位置的问题..
- 调几个s好像都不是特别合适.
  - 群友：你可以调不是那么大，然后向下微移积分号.
  - 其实，我建议你这样写：我们物理系的，比如写一些4维积分，都是 `\int d^4x` 这样，被积的放在前面.

$$
C=\cfrac{A\varepsilon_0\varepsilon_\bot}{\displaystyle\int\mathrm{d}\,z\left\{1+\gamma\left[1-\dfrac{(z-l/2)^2}{R^2}\right]\right\}^{-1}}
$$

  - 你这个也是物理系算电动力学里的电容还是什么，建议把变量放前面，这样也更美观了.

- 你觉得这个咋样？`raisebox` ，满足你的奇怪需求，拿走不谢.

   ```tex
   \[C=\cfrac{A\varepsilon_0\varepsilon_\bot}{\displaystyle\bigintss\raisebox{3pt}{$\dfrac{\mathrm{d}\,z}{1+\gamma\left(1-\frac{(z-l/2)^2}{R^2}\right)}$}}\]
   ```
