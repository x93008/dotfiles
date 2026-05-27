return {
    -- 文件和内容搜索插件
    'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        defaults = {
            cache_picker = {
                num_pickers = 5,
            },
        },
    },
}
