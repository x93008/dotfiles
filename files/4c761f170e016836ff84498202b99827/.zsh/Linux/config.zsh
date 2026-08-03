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

export CONAN2_BIN=conan2

# 鸿蒙开发工具
export DEVECO_SDK_HOME=/opt/ohos/cvte_sdk
export OHOS_BASE_SDK_HOME=$DEVECO_SDK_HOME
export OHOS_SDK_TOOLCHAINS_DIR=$OHOS_BASE_SDK_HOME/23/toolchains
hdc() { "$OHOS_SDK_TOOLCHAINS_DIR/hdc" "$@"; }
path=("/opt/ohos/command-line-tools/bin" "$path[@]")

export DEMO_P12_FILE=/opt/ohos/sign_utils/dongle_app.p12
export DEMO_CA_G2_FILE=/opt/ohos/sign_utils/dongle_debug_ca_g2.cer
export DEMO_P7B_FILE=/opt/ohos/sign_utils/dongleupdate_demo_profileDebug.p7b
