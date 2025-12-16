#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  #source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# 加载oh-my-zsh库
source ~/antigen.zsh
antigen use oh-my-zsh


# 加载原版oh-my-zsh中的功能(robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein antigen bundle command-not-found

# 语法高亮功能
antigen bundle zsh-users/zsh-syntax-highlighting

# 代码提示功能
antigen bundle zsh-users/zsh-autosuggestions

# 自动补全功能
#antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

# z跳转
antigen bundle skywind3000/z.lua

# 加载主题
antigen theme robbyrussell


# 保存更改
antigen apply

# vim为默认编辑器
export EDITOR=vim

# 将tmux配色方案改为screen-256color-bce
#alias tmux="TERM=screen-256color-bce tmux"

# 将$HOME/tran作为PATH
# append类型的环境变量全部放到了.zprofile或者.profile里面，这里不再设置,
# profile只有登陆shell会加载一次，防止tmux重复加载zshrc,导致环境变量超出长度极限
# export PATH="$PATH:/home/lxx/bin"

# 设置google浏览器为默认浏览器
#export BROWSER=/usr/bin/google-chrome-stable

# 设置默认最高线程编译
# export MAKEFLAGS=-j$(nproc)

# 使用4线程编译，防止电脑卡死
export MAKEFLAGS=-j4

# 禁用Ctrl+S
stty ixany

# 使用gi 加c++ Cmake 等，自动生成.gitignore
function gi() { curl -sLw "\n" https://www.gitignore.io/api/$@ ;}

# 加载接收端的环境变量
export LIBVA_DRIVER_NAME=iHD
export LD_LIBRARY_PATH="."
export EXCEED_HOTSPOT_PASSWORD="147258369"
export EXCEED_AP_IP="172.20.71.76"
export EXCEED_HOTSPOT_COUNTRY_CODE="CN"
export EXCEED_HOTSPOT_SSID="CPQ-5G"
export EXCEED_SHARE_DEBUG="TRUE"
export ESS_AUTH_TEST="TRUE"
export EXCEED_SHARE_DEV="TRUE"


#alias
alias lrer='python3 ~/kbtool/PythonToolkit/toolkit/QTranslatorHelper/qtranslator_helper.py'
#alias lupr='lupdate MaxhubAirReceiver.pro -no-obsolete -locations none'
alias lupr='lupdate MaxhubAirReceiver.pro -locations none'
alias guml='plantuml -tsvg'
alias open='xdg-open'
alias mj='make -j8'
alias cmake='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON'
alias gs='gst'

alias socks5proxy='export http_proxy=socks5://127.0.0.1:1080;export https_proxy=socks5://127.0.0.1:1080'
# no_proxy 是让我们自己的conan不走代理, 实际上可以配置privoxy设置代理规则,不要全局代理
export no_proxy=artifactory.gz.cvte.cn
alias httpproxy='export http_proxy=http://127.0.0.1:10800; export https_proxy=$http_proxy'
alias proxyoff='unset http_proxy; unset https_proxy'

alias mount_public='sudo mount -t cifs -o gid=1000,uid=1000,username=lxx,password=123456 //172.20.64.70/public/ /mnt/public'

# 需下载 proxychains-ng, 后面跟上单个应用名称，设置单个应用运行时的流量转发代理, 配置文件/etc/proxychains.conf
alias pc='proxychains'

alias vim='nvim'
#alias cmake='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON'

# 使用gcc13, 方便conan使用
alias usec13='export CC=gcc-13;export CXX=g++-13'
alias useqt12='export PATH=/home/lxx/Qt5.12.11/5.12.11/gcc_64/bin:$PATH;export LD_LIBRARY_PATH=/home/lxx/Qt5.12.11/5.12.11/gcc_64/lib:$LD_LIBRARY_PATH;export LIBRARY_PATH=/home/lxx/Qt5.12.11/5.12.11/gcc_64/lib:$LIBRARY_PATH'
#export http_proxy=socks5://127.0.0.1:1080
#export https_proxy=socks5://127.0.0.1:1080

# debuginfo 国内源
export DEBUGINFOD_URLS="https://repo.archlinuxcn.org"

# TMUX 自动开启
#if which tmux >/dev/null 2>&1; then
#   #if not inside a tmux session, and if no session is started, start a new session
#   test -z "$TMUX" && (tmux attach || tmux new-session)
#   fi

 #To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#source ~/powerlevel10k/powerlevel10k.zsh-theme

set -o vi

# nvm 配置, git安装
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# nvm 配置, manjaro安装
# source /usr/share/nvm/init-nvm.sh

# 使用这个代理会导致异常
# export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node

# npm config -g 或者 --global已经被弃用
# npm config set -g registry=https://registry.npmmirror.com
# 下面的镜像最近老有问题,可以使用此选项取消代理,实测也挺快的，--registry=http://r.cnpmjs.org
# npm config set --location=global registry=https://registry.npmmirror.com
# 垃圾代理，一堆问题，换回无代理状态
npm config set --location=global registry=http://r.cnpmjs.org

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

# 用于增加lua require查找路径，lua仅对neovim生效
# lua环境变量无法识别~，这里用HOME环境变量替换
#export LUA_PATH="$HOME/.vim/vimfile/?.lua;;"
#export LUA_PATH_5_3="$HOME/.vim/vimfile/?.lua;;"

# 默认打开代理
export http_proxy=http://127.0.0.1:10800
#export http_proxy=http://127.0.0.1:8118
export https_proxy=$http_proxy

# 使用yay全局安装fnm
eval "$(fnm env --use-on-cd --shell zsh)"

#unalias cd
