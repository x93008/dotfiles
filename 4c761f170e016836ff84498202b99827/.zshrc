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

# 加载接收端的环境变量
export LIBVA_DRIVER_NAME=iHD
export LD_LIBRARY_PATH="."
export EXCEED_HOTSPOT_PASSWORD="147258369"
export EXCEED_AP_IP="172.20.71.76"
export EXCEED_HOTSPOT_COUNTRY_CODE="CN"
export EXCEED_HOTSPOT_SSID="CPQ-5G"
export EXCEED_SHARE_DEBUG="TRUE"
# export ESS_AUTH_TEST="TRUE"
export EXCEED_SHARE_DEV="TRUE"


command -v xdg-open &> /dev/null && alias open="xdg-open"
# 使用gi CMake产生gitigbore模板
command -v gibo &> /dev/null && alias gi="gibo dump"

#alias
alias guml='plantuml -tsvg'
alias open='xdg-open'
alias mj='make -j8'
alias gs='gst'

alias socks5proxy='export http_proxy=socks5://127.0.0.1:1080;export https_proxy=socks5://127.0.0.1:1080'
# no_proxy 是让我们自己的conan不走代理, 实际上可以配置privoxy设置代理规则,不要全局代理
export no_proxy=artifactory.gz.cvte.cn
alias httpproxy='export http_proxy=http://127.0.0.1:10800; export https_proxy=$http_proxy'
alias proxyoff='unset http_proxy; unset https_proxy'

alias mount_public='sudo mount -t cifs -o gid=1000,uid=1000,username=lxx,password=123456 //172.20.72.68/public/ /mnt/public'

# 需下载 proxychains-ng, 后面跟上单个应用名称，设置单个应用运行时的流量转发代理, 配置文件/etc/proxychains.conf
alias pc='proxychains'

alias cmakeb='cmake --preset conan-debug --fresh && cmake --build --preset conan-debug --target install'

alias vim='nvim'
# alias加上空格，shell会自动将后面第一个命令进行别名展开，防止vim别名在sudo时候不生效
alias sudo='sudo '

alias vconan2='source /home/x93008/venv_conan2/bin/activate'

# debuginfo 国内源
export DEBUGINFOD_URLS="https://repo.archlinuxcn.org"

# 垃圾代理，一堆问题，换回无代理状态
npm config set --location=user registry=http://r.cnpmjs.org

if [ $MODMAP_SET ]; then
elif [ "$XDG_SESSION_TYPE" = "x11" ]; then
  echo $XDG_SESSION_TYPE
  export MODMAP_SET=1
  xmodmap ~/.Xmodmap
else 
  # 取消xmodmap映射
  echo $XDG_SESSION_TYPE
  export MODMAP_SET=1
  setxkbmap
fi

# 默认打开代理
export http_proxy=http://127.0.0.1:10800
export https_proxy=$http_proxy

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

# 对PATH环境变量的路径做一次去重
typeset -U path
