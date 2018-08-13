# 文档协作指南

我们的 FAQ 文档基于 GitHub 部署。文档协作可由以下两种方式进行：

1. Fork 本代码仓库后，在自己的代码库中做出修改，并提出 pull request（拉取请求）
1. 由管理员将您设置为内部协作者（collaborator），然后直接在本仓库中进行操作

## 其他参与者

作为参与者，参与文档协作的具体步骤为：

1. Fork 本代码库，并将您的代码仓库克隆（clone）到本地
1. 建议新建一个单独的分支（如：`patching`），并在其中对文档做出修改
1. 提出 pull request 至本仓库

您还需要注意：

1. 请遵守本项目的 [格式指南](STYLE_GUIDE.md)
1. 请保持提交历史的整洁
1. 请避免加入您的个人敏感信息，如 GitHub 账号、密码等

## 内部协作者

作为内部协作者，您在编辑时需要注意：

1. 修改可直接在 `master` 分支中进行
1. 请勿进行破坏性编辑
1. 一般情况下，请不要修改历史提交。如有必要，请在讨论后进行

在处理参与者的 pull requests 时，需注意：

1. 对修改做出审查（review），待修改通过（approved）后方可合并进入 `master` 分支
1. 视情况采取合并（merge）、变基（rebase）或 cherry-pick 策略
1. 遇到合并冲突时，请在相应的 pull request 之后讨论

## 安装与使用 Git

Git 的下载与安装方法见 <https://git-scm.com>。

Git 的使用说明见 [Pro Git](https://git-scm.com/book/zh/v2)。

对于新手，我们建议同时安装带有图形界面的 Git 客户端，如 [Git Extensions](https://gitextensions.github.io)，以辅助使用。

很多编辑器，如 Visual Studio Code，会自带 [Git 集成](https://code.visualstudio.com/Docs/editor/versioncontrol)，同样对用户较为友好。

GitHub 的使用说明见其 [帮助页面](https://help.github.com/)。
