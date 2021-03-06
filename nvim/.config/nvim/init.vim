" Set neovim environments
let g:python_host_prog = expand('$HOME/.virtualenvs/neovim2/bin/python')
let g:python3_host_prog = expand('$HOME/.virtualenvs/neovim3/bin/python')

" Plugins (with vim-plug)
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'chriskempson/base16-vim'

" Vim enhancements
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'

" Filetree
Plug 'scrooloose/nerdtree'

" Navigation
Plug 'christoomey/vim-tmux-navigator'

" Org mode
Plug 'jceb/vim-orgmode'

" Linting
Plug 'dense-analysis/ale'

" Autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Autocomplete for Python
Plug 'deoplete-plugins/deoplete-jedi'

call plug#end()

" UI
set nu rnu " show hybrid numbering
syntax on
set background=dark
colorscheme base16-material

" Copy and paste
set clipboard=unnamedplus

" Window Splits
set splitbelow
set splitright
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

" Nerdtree
map <C-O> :NERDTreeToggle<CR>

" Filetype specific setting
filetype plugin on

" Latex
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer = 'zathura'

" Autocomplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring=1
