# dotfiles

将配置文件保存到仓库中

### vim

    包含.vimrc .vim

### zsh

    .zhsrc

### nvm

node版本控制器，如果这里不做软链接，那么manjrao安装的nvm不确定会用哪个目录作为$NVM_DIR的值，
每次更新之后都可能之前配置和下载的node版本需要重新下载

```bash
    rm -r ~/.nvm ~/.config/nvm
    ln -s ~/dotfile/nvm ~/.nvm
    ln -s ~/dotfile/nvm ~/.config/nvm
```

### 环境迁移(旧)

需要先克隆dotfiles家目录, 以vim和zsh为例，其他大致雷同

##### vim

1. 首先下载vim, 并创建`~/.vim`目录
2. 创建以下软链接:

```bash
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/vim/.vim/vimfile ~/.vim/vimfile
```
3. vim打开.vimrc, 命令模式输入:PlugInstall

##### zsh

1. 下载zsh、curl
2. 创建以下软链接：

```bahs
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
```

### 环境迁移(新)

使用dotfilesmanager管理, 该插件会将添加的目录或者文件迁移到dotfile目录，并在原位置创建

```bash
pip3 install dotfilesmanager
dmg --help
```
