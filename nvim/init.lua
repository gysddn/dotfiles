----------------------------- HELPERS -----------------------------
plugins = require'plugins'

local cmd = vim.cmd  -- to run vim commands
local fn  = vim.fn   -- to run vim functions
local g   = vim.g    -- global variable table
-- o -> options, b -> buffer options, w -> window options
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

----------------------------- OPTIONS -----------------------------

cmd('colorscheme spaceduck')
--waiting for a good patch
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

local indent = 2
opt('o','termguicolors',true)
opt('o','ignorecase',true)
opt('o','list',true)
opt('o','expandtab',true)
opt('w','number',true)
opt('o','undofile',true)
opt('w','wrap',false)

opt('o','updatetime',100)
opt('o','cmdheight',3)
opt('w','scrolloff',10)

opt('o','colorcolumn','120')
opt('o','mouse','a')
opt('b','iskeyword','@,48-57,192-255') --no underscores(_), you can do more with this
opt('o','wildmode','longest:full')


----------------------------- MAPPINGS -----------------------------

-- Editing and sourcing config
map('n', '<leader>ec', '<Cmd>tabnew $MYVIMRC<CR>')
map('n', '<leader>sc', '<Cmd>luafile $MYVIMRC<CR>')

-- Clap mappings
map('n', '<leader>cb', '<Cmd>Clap buffers<CR>')
map('n', '<leader>cl', '<Cmd>Clap blines<CR>')
map('n', '<leader>cf', '<Cmd>Clap files<CR>')
map('n', '<leader>cc', '<Cmd>Clap colors<CR>')

-- Clap mappings
map('n', '<space>ff', "<Cmd>lua require('telescope.builtin').find_files()<cr>")

-- NERDTree mappings
map('n', '<leader>nt', '<Cmd>NERDTreeToggle<CR>')
map('n', '<leader>nf', '<Cmd>NERDTreeFocus<CR>')
map('n', '<leader>nc', '<Cmd>NERDTreeCWD<CR>')
map('n', '<leader>nr', '<Cmd>NERDTreeRefreshRoot<CR>')

-- <Space>+ mappings
map('n', '<Space>q', '<Cmd>q<CR>')

-- Split navigation
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')


----------------------------- LSP CONF -----------------------------
require'lspconfig'.rust_analyzer.setup{}

----------------------------- PLUGIN CONF -----------------------------

--require'myconfig'.treesitter_config()

-- Profiling
-- cmd("profile start ~/vimprofile")
-- cmd("profile file *")
-- cmd("profile func *")
