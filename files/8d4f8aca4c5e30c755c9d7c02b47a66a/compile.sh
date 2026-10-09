#!/bin/sh
# gfwlist.json → gfwlist.srs: 每次启动前无条件重编译 (毫秒级, 保证产物永远与源同步)
# 由 sing-box.service 的 ExecStartPre 调用, 也可手动执行
cd "$(dirname "$0")" || exit 1
sing-box rule-set compile gfwlist.json -o gfwlist.srs
