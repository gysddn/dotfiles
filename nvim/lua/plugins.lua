vim.cmd [[packadd packer.nvim]]

function startup()
  use 'wbthomason/packer.nvim'

  -- Quck peak of registers
  --use 'junegunn/vim-peekaboo'

  -- Themes...
  use 'sainnhe/gruvbox-material'

  use 'sainnhe/edge'

  use {
  'pineapplegiant/spaceduck', branch='main'
  }

  -- Auto completion
  -- use 'neoclide/coc.nvim', {'branch': 'release'}

  --use 'dhruvasagar/vim-table-mode'

  -- Show git statuf of lines
  use 'airblade/vim-gitgutter'

  --use 'wellle/context.vim'

  -- Commenting quick
  use 'tpope/vim-commentary'

  -- Better syntax highlight
  use { 'nvim-treesitter/nvim-treesitter'}
  --use 'sheerun/vim-polyglot' -- damn slow

  -- surround a block with (, {, [ etc.
  use 'tpope/vim-surround'


  --use 'norcalli/typeracer.nvim'
  --use 'nvim-treesitter/nvim-treesitter'

  use 'neovim/nvim-lspconfig'
  --use 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

  --use 'Shougo/defx.nvim', {'do': 'UpdateRemoteuseins'}

  -- Let's stick with NERDTree 'til telescope comes out
  use 'preservim/nerdtree'

end

return require('packer').startup(startup)

