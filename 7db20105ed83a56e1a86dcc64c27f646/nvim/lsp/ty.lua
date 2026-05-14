-- src: https://github.com/neovim/nvim-lspconfig/blob/master/lsp/ty.lua
---@type vim.lsp.Config
--- rust后端的python补全
return {
  cmd = { 'ty', 'server' },
  filetypes = { 'python' },
  root_markers = { 'ty.toml', 'pyproject.toml', '.git' },
}
