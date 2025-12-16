return {
    -- 文件树插件
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- 可选，用于显示文件图标
    },
    opts = {
        -- 可以在这里添加自定义配置
        on_attach = function(bufnr)
            local api = require "nvim-tree.api"

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            vim.keymap.set('n', 'r', api.fs.rename_sub, opts('Rename'))
            vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
            vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
            vim.keymap.set('n', 's', api.node.open.vertical, opts('HeOpen: Vertical Splitlp'))
            vim.keymap.set('n', 'v', api.node.open.horizontal, opts('Open: Horizontal Split'))
            vim.keymap.set('n', 'i', api.tree.toggle_hidden_filter, opts('Toggle Filter: Dotfiles'))
            vim.keymap.set('n', '.', api.tree.change_root_to_node, opts('CD'))
        end,
    },
}
