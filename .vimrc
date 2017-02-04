syntax enable

set nu

filetype plugin indent on

set noswapfile

set updatetime=250

set ruler

set backspace=2

set scrolloff=4

set mouse=a

map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

call plug#end()

let g:enable_bold_font = 1

set background=dark
colorscheme solarized 
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:airline_theme = "hybrid"
let g:airline#extensions#branch#enabled=1
