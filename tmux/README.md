# tmux
pacman 可安装

## tpm 
插件管理器

1.      git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
2.      加入以下内容到.tmux.conf 底部
```
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com/user/plugin'
# set -g @plugin 'git@bitbucket.com/user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```
