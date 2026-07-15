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

# 鸿蒙开发工具
export DEVECO_SDK_HOME=/opt/ohos/cvte_sdk
export OHOS_BASE_SDK_HOME=$DEVECO_SDK_HOME
hdc() { "$OHOS_BASE_SDK_HOME/23/toolchains/hdc" "$@"; }
path=("/opt/ohos/command-line-tools/bin" "$path[@]")
