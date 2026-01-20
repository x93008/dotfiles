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

-- nvim-telescope: leader ff查找文件，leader fg 过滤并查找内容
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = 'Telescope live grep' })

-- conform.nvim: ctrl n 格式化整个文件
vim.keymap.set({ "n", "v" }, "<C-n>", ":Format<CR>", {
    desc = "[C]ode [F]ormat",
    silent = true,
})
