-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation (由 vim-tmux-navigator 插件提供，支持在 vim 和 tmux 之间无缝导航)
-- vim-tmux-navigator 会自动设置 <C-h>, <C-j>, <C-k>, <C-l> 快捷键
-- 如果需要自定义，可以在这里覆盖

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-----------------
-- Line numbers --
-----------------

-- 切换相对行号和绝对行号显示
vim.keymap.set('n', '<C-x>', function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative/absolute line numbers", noremap = true, silent = true })

-----------------
-- Plugins --
-----------------

-- nvim-tree: 使用 leader n 打开/关闭目录树
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', opts)

-- git-blame: 使用 leader s 开关 git blame
vim.keymap.set('n', '<leader>s', ':GitBlameToggle<CR>', opts)

-- nvim-telescope: leader ff查找文件，leader fg 过滤并查找内容，leader fr 恢复上次搜索，leader fp 列出所有缓存的搜索
-- 在搜索结果页面按下ctrl + q,可以像ack插件一样，将结果放到quickfix里面，边改边看
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = 'Telescope live grep' })
vim.keymap.set('v', '<leader>fg', function()
    local saved = vim.fn.getreg('"')
    vim.cmd('noautocmd normal! y')
    local text = vim.fn.getreg('"')
    vim.fn.setreg('"', saved)
    require('telescope.builtin').grep_string({ search = text, initial_mode = 'normal' })
end, { desc = 'Grep selected text' })
vim.keymap.set('n', '<leader>fr', ':Telescope resume<CR>', { desc = 'Telescope resume last search' })
vim.keymap.set('n', '<leader>fp', ':Telescope pickers<CR>', { desc = 'Telescope list cached pickers' })

-- 对内置注释的快捷键重新映射(gcc、gc、leader l都可以用来注释)
vim.keymap.set('n', '<leader>l', 'gcc', { remap = true, desc = 'Toggle line comment' })
vim.keymap.set('v', '<leader>l', 'gc', { remap = true, desc = 'Toggle line comment' })

-- conform.nvim: ctrl n 格式化整个文件
vim.keymap.set({ "n", "v" }, "<C-n>", ":Format<CR>", {
    desc = "[C]ode [F]ormat",
    silent = true,
})

-- plantuml-previewer.vim: plantuml 文件中按 leader o 在浏览器打开实时预览（保存自动刷新）
vim.api.nvim_create_autocmd("FileType", {
    pattern = "plantuml",
    callback = function(args)
        vim.keymap.set("n", "<leader>o", ":PlantumlOpen<CR>", {
            buffer = args.buf,
            desc = "PlantUML 浏览器实时预览",
            silent = true,
        })
    end,
})

-- markdown-preview.nvim: markdown 文件中按 leader o 打开浏览器预览
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(args)
        vim.keymap.set("n", "<leader>o", ":MarkdownPreview<CR>", {
            buffer = args.buf,
            desc = "Markdown 浏览器预览",
            silent = true,
        })
    end,
})

-- mermaid.nvim: mermaid 文件中按 leader o 打开浏览器实时预览
vim.api.nvim_create_autocmd("FileType", {
    pattern = "mermaid",
    callback = function(args)
        vim.keymap.set("n", "<leader>o", ":MermaidPreview<CR>", {
            buffer = args.buf,
            desc = "Mermaid 浏览器实时预览",
            silent = true,
        })
    end,
})
