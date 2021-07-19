local vim = vim

M = {}

function M.lsp_config()
  require'nvim_lsp'.gopls.setup{}
  require'nvim_lsp'.sumneko_lua.setup{}
  require'nvim_lsp'.ccls.setup{}
end

function M.treesitter_config()
  require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
end

return M
