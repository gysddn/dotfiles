----------------------------- HELPERS -----------------------------
--plugins = require'plugins'

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

local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require "paq" {
  "savq/paq-nvim";                  -- Let Paq manage itself

  'sainnhe/gruvbox-material';
  'marko-cerovac/material.nvim';

  {'nvim-treesitter/nvim-treesitter',run = ':TSUpdate'};

  'sainnhe/sonokai';
  'savq/melange';

  --lsp
  'neovim/nvim-lspconfig';

  'L3MON4D3/LuaSnip';
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-buffer';
  'hrsh7th/nvim-cmp';


  -- Show git statuf of lines
  'airblade/vim-gitgutter';

  -- Commenting quick
  'tpope/vim-commentary';

  -- surround a block with (, {, [ etc.
  'tpope/vim-surround';

  -- Let's stick with NERDTree 'til telescope comes out
  'preservim/nerdtree';

  {'junegunn/fzf', run = fn['fzf#install']};
  'junegunn/fzf.vim';
}

----------------------------- OPTIONS -----------------------------

cmd('colorscheme melange')
-- cmd('match Error /\\s\\+$/')
-- cmd('match SpecialChar /$/')
--waiting for a good patch
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

local indent = 2
opt('o','termguicolors',true)
opt('o','ignorecase',true)
opt('o','list',true)
opt('o','expandtab',true)
opt('w','number',true)
opt('w','relativenumber',true)
opt('o','undofile',true)
opt('w','wrap',false)

opt('o','updatetime',100)
opt('o','cmdheight',3)
opt('o','scrolloff',10)
opt('o','showtabline',2)

opt('o','colorcolumn','120')
opt('o','mouse','a')
opt('o','iskeyword','@,48-57,192-255') --no underscores(_), you can do more with this
opt('o','wildmode','longest:full')
opt('o','completeopt','menu,menuone,noselect')
opt('o','inccommand','nosplit')
opt('o','listchars','eol:↵,trail:~,tab:>-,nbsp:␣')


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
map('n', '<Space>m', ':Marks<CR>')
map('n', '<Space>b', ':Buffers<CR>')

-- Split navigation
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')

-- Fuzzy Finder
map('n', '<C-p>', ':Files<CR>')
-- map('n', '*', '*``')

-- Search and highlight but don't jump

local cmp = require'cmp'
cmp.setup({
    snippet = {
      expand = function(args)
        -- For `luasnip` user.
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'luasnip' },
    }
  })


vim.g.material_style = "darker"

----------------------------- LSP CONF -----------------------------
require'lspconfig'.rust_analyzer.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require'lspconfig'.clangd.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require'lspconfig'.pyright.setup{}
require'lspconfig'.lemminx.setup{
    cmd = { "/home/chilly/.local/opt/lemminx/lemminx" };
    ...
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  }
}


----------------------------- PLUGIN CONF -----------------------------

--require'myconfig'.treesitter_config()

-- Profiling
-- cmd("profile start ~/vimprofile")
-- cmd("profile file *")
-- cmd("profile func *")
