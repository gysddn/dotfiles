return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  --- Colorschemes
  use 'sainnhe/gruvbox-material'
  use 'sainnhe/edge'
  use {
  'pineapplegiant/spaceduck', branch='main'
  }
 use {
   'marko-cerovac/material.nvim'
 }
 use 'sainnhe/sonokai'
 use 'savq/melange'

  --- Quck peak at registers
  use 'junegunn/vim-peekaboo'

  --- Better table editing
  use 'dhruvasagar/vim-table-mode'

  -- Show git statuf of lines
  use 'airblade/vim-gitgutter'

  --- Show context of scopes (functions, closures, classes etc.)
  use 'wellle/context.vim'

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

end)