# 使用open代替xdg-open
command -v xdg-open &> /dev/null && alias open="xdg-open"

# 使用gi CMake产生gitigbore模板
command -v gibo &> /dev/null && alias gi="gibo dump"

alias guml='plantuml -tsvg'
alias mj='make -j8'

alias socks5proxy='export http_proxy=socks5://127.0.0.1:1080;export https_proxy=socks5://127.0.0.1:1080'
export no_proxy=artifactory.gz.cvte.cn
alias httpproxy="export http_proxy=http://$PROXY_HOST:10800; export https_proxy=\$http_proxy"
alias proxyoff='unset http_proxy; unset https_proxy'

alias mount_public='sudo mount -t cifs -o gid=1000,uid=1000,username=lxx,password=123456 //172.20.72.68/public/ /mnt/public'

alias cmakeb='cmake --preset conan-debug --fresh && cmake --build --preset conan-debug --target install'

alias vim='nvim'

# alias加上空格，shell会自动将后面第一个命令进行别名展开，防止vim别名在sudo时候不生效
alias sudo='sudo '

alias vconan2='source /home/x93008/venv_conan2/bin/activate'
