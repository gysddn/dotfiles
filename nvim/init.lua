----------------------------- HELPERS -----------------------------
plugins = require'plugins'

local cmd = vim.cmd  -- to run vim commands
local fn  = vim.fn   -- to run vim functions
local g   = vim.g    -- global variable table

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
----------------------------- OPTIONS -----------------------------

vim.g.material_style = "oceanic"
cmd('colorscheme melange')

local indent = 2
--- Indentation
vim.opt.tabstop = indent
vim.opt.shiftwidth = indent

vim.opt.termguicolors = true
--- Ignore case in a pattern
vim.opt.ignorecase = true
--- Show the tab, trailing space etc. characters, modified by 'listchars'
vim.opt.list = true
--- Use spaces as tabs
vim.opt.expandtab = true
--- Line numbers and relative position
vim.opt.number = true
vim.opt.relativenumber = false
--- Hold undo tree between sessions
vim.opt.undofile = true
--- Don't wrap lines
vim.opt.wrap = false

--- Update swap file time interval
-- vim.opt.updatetime = 100
vim.opt.cmdheight = 3
--- Scroll offset, how many lines will be above and below cursor position
vim.opt.scrolloff = 10
--- Always show tabline
vim.opt.showtabline = 2

--- Show a column guide at 120th
vim.opt.colorcolumn = '120'
--- Enable mouse in "all" modes
vim.opt.mouse = 'a'
--- Define what keyword is for movement commands, _ is delibarately removed
vim.opt.iskeyword = '@,48-57,192-255,_'
--- Wildmode completion. list all matches, complete first match
vim.opt.wildmode = 'longest:full'
--- Autocompletion menu modes
vim.opt.completeopt = 'menu,menuone,noselect,noinsert'
--- Show the effect of command in current window
vim.opt.inccommand = 'nosplit'
--- char options for 'list'
vim.opt.listchars = 'eol:↵,trail:~,tab:>-,nbsp:␣'


----------------------------- MAPPINGS -----------------------------

--- Editing and sourcing config
map('n', '<leader>ec', '<Cmd>edit $MYVIMRC<CR>')
map('n', '<leader>sc', '<Cmd>luafile $MYVIMRC<CR>')

--- NERDTree mappings
map('n', '<leader>nt', '<Cmd>NERDTreeToggle<CR>')
map('n', '<leader>nf', '<Cmd>NERDTreeFocus<CR>')
map('n', '<leader>nc', '<Cmd>NERDTreeCWD<CR>')
map('n', '<leader>nr', '<Cmd>NERDTreeRefreshRoot<CR>')

--- <Space>+ mappings
map('n', '<Space>q', '<Cmd>q<CR>')
map('n', '<Space>m', ':Marks<CR>')
map('n', '<Space>b', ':Buffers<CR>')

--- Split navigation
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')

--- Tab navigation
map('n', '<A-h>', ':tabprevious<CR>')
map('n', '<A-l>', ':tabnext<CR>')
map('n', '<A-n>', ':tabnew<CR>')
map('n', '<A-q>', ':tabclose<CR>')

--- Fuzzy Finder
map('n', '<C-p>', ':Files<CR>')
map('n', '?', ':Lines<CR>')
--- Search and highlight but don't jump
-- map('n', '*', '*``')

--- LSP mappings
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
-- map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
