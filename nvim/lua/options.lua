-- Hint: use `:h <option>` to figure out the meaning if needed

-- Leader key
vim.g.mapleader = ";" -- 分号作为 leader 键
vim.g.maplocalleader = ";" -- 分号作为 local leader 键

-- 禁用 netrw (nvim-tree 推荐)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 启用 24-bit 颜色 (nvim-tree 推荐，用于更好的图标显示)
vim.opt.termguicolors = true

-- 保持终端透明背景（让终端半透明效果生效）
local function set_transparent_background()
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "NonText", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "Folded", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE", ctermbg = "NONE" })
end

-- 立即设置透明背景
set_transparent_background()

-- 当 colorscheme 改变时，重新设置透明背景
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = set_transparent_background,
})

vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a' -- allow the mouse to be used in nvim

-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spaces in tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of Python

-- UI config
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
-- vim.opt.termguicolors = true        -- enable 24-bit RGB color in the TUI
vim.opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered
