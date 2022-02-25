return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  --- Colorschemes
  use 'sainnhe/gruvbox-material'
  use 'sainnhe/edge'
  use {
  'pineapplegiant/spaceduck', branch='main'
  }
 use {
   'marko-cerovac/material.nvim',
   config = function()
     require('material').setup({
      contrast = false,
    })
   end
 }
 use {
   'sainnhe/sonokai',
 }
 use 'savq/melange'

  --- Quck peak at registers
  use {
    'junegunn/vim-peekaboo',
    disable=true
  }

  --- Readline shortcuts
  use 'tpope/vim-rsi'

  --- Better table editing
  use 'dhruvasagar/vim-table-mode'

  -- Show git statuf of lines
  use 'airblade/vim-gitgutter'

  --- Show context of scopes (functions, closures, classes etc.)
  -- use 'wellle/context.vim'

  --- Commenting quick
  use 'tpope/vim-commentary'

  --- Better syntax highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() 
      require'nvim-treesitter.configs'.setup {
        highlight = {
          enable = true,
        }
      }
    end
  }

  --- surround a block with (, {, [ etc.
  use {
    'tpope/vim-surround',
    -- config = function() print("sdlkgj") end
  }

 --- LSP
 use {
   'neovim/nvim-lspconfig',
   config = function() 
     -- require'lspconfig'.rust_analyzer.setup{
     --   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
     -- }
     require'lspconfig'.clangd.setup{
       capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
     }
     require'lspconfig'.cmake.setup{
       capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
     }
     -- require'lspconfig'.pyright.setup{}
     -- require'lspconfig'.lemminx.setup{
     --     cmd = { "/home/chilly/.local/opt/lemminx/lemminx" };
     --     ...
     -- }
   end
 }

  -- Simple file explorer
  use 'preservim/nerdtree'

  --- Snippet provider, completion etc. with LSP integration
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      local cmp = require'cmp'
      cmp.setup({
          snippet = {
            expand = function(args)
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
    end
  }

  --- Fuzzy finder/picker
  use {
    'junegunn/fzf',
    requires = 'junegunn/fzf.vim',
    run = vim.fn['fzf#install'],
  }

  --- LLVM syntax support
  use 'rhysd/vim-llvm'

  --- Icon pack
  use 'kyazdani42/nvim-web-devicons'

  --- Status line for nvim
  use {
    'nvim-lualine/lualine.nvim',
    config = function() require('lualine').setup() end
  }

  --- New tabline for nvim
  use {
    'alvarosevilla95/luatab.nvim',
    config = function() require('luatab').setup() end
  }

  --- Fancy UI stuff
  use 'stevearc/dressing.nvim'

  --- Quick navigaiton in a line
  use 'unblevable/quick-scope'

  --- Session Manager
  use {
    'Shatur/neovim-session-manager',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local Path = require('plenary.path')
      require('session_manager').setup({
        sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
        path_replacer = '__', -- The character to which the path separator will be replaced for session files.
        colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
        autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
        autosave_last_session = true, -- Automatically save last session on exit.
        autosave_ignore_not_normal = true, -- Plugin will not save a session when no writable and listed buffers are opened.
        autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
      })
    end,
    disable = true,
  }
end)
