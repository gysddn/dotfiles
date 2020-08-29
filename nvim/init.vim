
" Plugings
call plug#begin("~/.vim/plugged")

Plug 'sainnhe/gruvbox-material'
Plug 'norcalli/typeracer.nvim'
Plug 'neovim/nvim-lsp'

call plug#end()

" Commands to set things
colorscheme gruvbox-material

" Sets
set termguicolors
set tabstop=2
set shiftwidth=2
set expandtab
set number
set nowrap
set cmdheight=3
set mouse=a
set colorcolumn=80

" Mapping
nnoremap <leader>c <Cmd>tabnew $MYVIMRC<CR>
nnoremap <leader>s <Cmd>source $MYVIMRC<CR>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" LSP Settings

" -- Golang -> gopls
lua << EOF
require'nvim_lsp'.gopls.setup{}
require'nvim_lsp'.sumneko_lua.setup{}
require'nvim_lsp'.ccls.setup{}
EOF
