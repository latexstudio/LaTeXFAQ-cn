$\LaTeX$ Tikz绘图相关
===
- 常用命令
  * 绘制线段

    `\draw [选项] (坐标1)--(坐标2)--(坐标3)--...--(坐标n);`
  * 绘制圆

    `\draw [选项] (圆心坐标) circle (半径);`
  * 绘制椭圆

    `\draw [选项] (圆心坐标) ellipse (半长轴 and 半短轴);`
  * 标注文本

    `\node [anchor=锚点位置，颜色等] at (标记坐标) {标记内容};`
- `foreach`语句
  * ```TeX
    \foreach \a in {变量范围}
    绘制命令（内含xx=\a cm）;```
  举例：
  ```TeX
  \foreach \a in {-10,-8,...,6,8,10}
  \foreach \b in {-10,-8,...,6,8,10}
  \draw [xshfit=\a cm,yshift=\b cm] (0,0) circle (1);
  ```
此例子为绘制(-10,-10)到(10,10)区域内的多个圆，foreach语句可叠加使用！