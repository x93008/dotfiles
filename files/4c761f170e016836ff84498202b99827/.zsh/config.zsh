# 加载接收端的环境变量
export LIBVA_DRIVER_NAME=iHD
export LD_LIBRARY_PATH="."
export EXCEED_HOTSPOT_PASSWORD="147258369"
export EXCEED_AP_IP="172.20.72.57"
export EXCEED_HOTSPOT_COUNTRY_CODE="CN"
export EXCEED_HOTSPOT_SSID="CPQ-5G"
export EXCEED_SHARE_DEBUG="TRUE"
# export ESS_AUTH_TEST="TRUE"
export EXCEED_SHARE_DEV="TRUE"

export ESS_TEST=1

# 加载代理设置
source $HOME/.zsh/proxy.zsh

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
