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

