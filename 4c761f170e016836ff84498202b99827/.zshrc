# zsh 插件
source ~/.zsh/antigen.zsh
antigen use oh-my-zsh

antigen bundle git
# 使用git open打开当前仓库的网页版本
antigen bundle paulirish/git-open

# pip自动补全包名
antigen bundle pip

# 智能提示缺少的命令如何安装
antigen bundle command-not-found

# 解压插件，使用extract命令自动判断文件类似，调用解压命令
antigen bundle extract

# 语法高亮功能，自动将不合法命令变成红色
antigen bundle zsh-users/zsh-syntax-highlighting

# 代码提示功能
antigen bundle zsh-users/zsh-autosuggestions

# 自动补全功能
antigen bundle zsh-users/zsh-completions

# 通过历史，强化提示补全功能
antigen bundle zsh-users/zsh-autosuggestions

# z跳转
antigen bundle skywind3000/z.lua

# 加载主题
antigen theme robbyrussell

# 开启vi命令行模式
antigen bundle vi-mode

# 保存更改
antigen apply

# nvim为默认编辑器
export EDITOR=nvim

# 设置google浏览器为默认浏览器
# export BROWSER=/usr/bin/google-chrome-stable

# 禁用Ctrl+S
stty ixany

# 使用yay全局安装fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# 防止未解密导致source报错
if [[ -f $HOME/.config/secret.env ]]; then
    if file -L -b $HOME/.config/secret.env | grep -q "ASCII\|text"; then
        set -a
        source $HOME/.config/secret.env
        set +a
    fi
fi

source $HOME/.zsh/config.zsh
