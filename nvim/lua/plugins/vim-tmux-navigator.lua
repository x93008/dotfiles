return {
    -- vim-tmux-navigator: 在 vim 窗口和 tmux 面板之间无缝导航
    "christoomey/vim-tmux-navigator",
    lazy = false, -- 立即加载，因为需要覆盖默认的窗口导航快捷键
    priority = 1000, -- 高优先级，确保在其他插件之前加载
    -- 插件会自动设置 <C-h>, <C-j>, <C-k>, <C-l>, <C-\> 快捷键
}
