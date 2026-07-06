PROXY_SERVER_IP=172.20.72.57
MY_HOST_IP=172.20.72.57

# 加载接收端的环境变量
export LIBVA_DRIVER_NAME=iHD
export LD_LIBRARY_PATH="."
export EXCEED_HOTSPOT_PASSWORD="147258369"
export EXCEED_AP_IP="$MY_HOST_IP"
export EXCEED_HOTSPOT_COUNTRY_CODE="CN"
export EXCEED_HOTSPOT_SSID="CPQ-5G"
export EXCEED_SHARE_DEBUG="TRUE"
# export ESS_AUTH_TEST="TRUE"
export EXCEED_SHARE_DEV="TRUE"

export ESS_TEST=1

# 默认打开代理
# 本机即 PROXY_SERVER_IP 时走 127.0.0.1，否则走远程 PROXY_SERVER_IP
if ip -4 addr 2>/dev/null | grep -qwF "$PROXY_SERVER_IP"; then
  PROXY_HOST="127.0.0.1"
else
  PROXY_HOST="$PROXY_SERVER_IP"
fi
export http_proxy="http://${PROXY_HOST}:10800"
export https_proxy=$http_proxy

# debuginfo 国内源
export DEBUGINFOD_URLS="https://repo.archlinuxcn.org"

#alias
source $HOME/.zsh/alias.zsh

# gibo completion zsh > gibo.zsh生成，用于gibo补全
source $HOME/.zsh/gibo.zsh

# 加载平台独有设置
source $HOME/.zsh/$(uname -s)/config.zsh

# 对PATH环境变量的路径做一次去重
typeset -U path
