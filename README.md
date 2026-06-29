# dotfiles


### 前置工具

配置文件管理，基于[dotfilesmanager](https://github.com/xyz1001/dotfilesmanager)

该工具是简单的通过创建软链接的方式，让文件实体集中放到一个目录下，从而方便管理的工具。

安装
```bash
pip3 install dotfilesmanager
```

##### 工具使用介绍

初始使用：
> 改工具会自动读取`~/dotfiles`目录，如果不存在，会自动创建，所以如果是要同步远程的，需要先clone仓库到HOME目录

将一个文件添加到dotfile管理：
```bash
# 会将原文件move到dotfile下，并且创建软链接
dfm add ~/.vimrc              # 所有平台共享同一份(创建映射时依然只会创建当前平台的，只是目录结构上不会插入平台目录层级)
dfm add ~/.bashrc --system    # 各平台独立保存（内容可能不同）
```

将一个文件移除dotfile管理：
```bash
dfm rm ~/.vimrc
```

按照dotfile创建/重新创建软链接：
```bash
dfm install # 重建所有软链接
dfm install ~/dotfiles/hashabc123/.vimrc  # 只安装指定一个
```

同步一份已有文件到其他平台:
```bash
# 假设一份配置已经在Linux中有了，希望Windows也用这个配置
dfm share ~/dotfiles/hashabc123/.gitconfig ~/AppData/Roaming/.gitconfig
```

### 特殊命令下载

tpm插件管理工具，需要使用git clone安装
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
