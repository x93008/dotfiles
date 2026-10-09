#!/bin/sh
# gfwlist.json → gfwlist.srs: 缺失或源文件更新时重编译
# 由 sing-box.service 的 ExecStartPre 调用, 也可手动执行
cd "$(dirname "$0")" || exit 1
if [ ! -f gfwlist.srs ] || [ gfwlist.json -nt gfwlist.srs ]; then
  sing-box rule-set compile gfwlist.json -o gfwlist.srs
fi
