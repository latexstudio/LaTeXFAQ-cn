# 编译指南

推荐采用 `latexmk` 编译：

```sh
cd source/
latexmk -xelatex latex-faq-cn
```

您也可以使用 `xelatex` 手动编译。

## 思源字体安装

本文档的中文字体使用思源宋体 / 思源黑体系列。由于种种原因，该字体的安装比较复杂，具体见下。

思源字体的打包方式分为 OTC、OTF、Super OTC、Subset OTF 四种，本项目**仅支持前两种**方式。另一方面，思源字体由 Adobe 与 Google 联合发布，二者所用的字体名并不相同。Adobe 使用 Source Han Serif/Sans，而 Google 则使用 Noto Serif/Sans CJK。

### 下载链接

- 思源字体的官方下载地址位于 GitHub：
  - 思源宋体：<https://github.com/adobe-fonts/source-han-serif/tree/release>
  - 思源黑体：<https://github.com/adobe-fonts/source-han-sans/tree/release>

- 由于众所周知的原因，在中国大陆地区访问 GitHub 速度较慢。此时，可以通过 [清华大学开源软件镜像站（tuna）](https://mirrors.tuna.tsinghua.edu.cn) 进行下载：
  - 思源宋体：<https://mirrors.tuna.tsinghua.edu.cn/adobe-fonts/source-han-serif>
  - 思源黑体：<https://mirrors.tuna.tsinghua.edu.cn/adobe-fonts/source-han-sans>

- 本模板所需的**部分**思源字体也可通过百度网盘获取：
  - <https://pan.baidu.com/s/1-4AL24521fT553w7JOpMeA>，密码：yv5y

通过 GitHub 或者 tuna 下载时，OTC 和 OTF 版本分别位于 `OTC/` 和 `OTF/` 目录下。对于 OTF 版本，我们只需要简体中文部分（带有 `SC` 标识）。本文档只需要思源宋体的 Regular 和 Bold 以及思源黑体的 Medium 和 Bold 字重，但若空间允许，请尽量安装所有 7 个字重。

### 其他安装方式

- Ubuntu 系统可以通过安装 `fonts-noto-cjk` 包来使用思源字体：

  ```sh
  sudo apt-get install fonts-noto-cjk fonts-noto-cjk-extra
  ```

- CTAN 上有名为 [`notoCJKsc`](https://ctan.org/pkg/notocjksc) 的字体包，但仅在 MikTeX 中提供
