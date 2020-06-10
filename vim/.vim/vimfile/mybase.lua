-- 缩进不推出可视模式
local map = vim.api.nvim_set_keymap
map('v', '<', '<gv', {noremap = true, silent = true })
map('v', '>', '>gv', {noremap = true, silent = true })
