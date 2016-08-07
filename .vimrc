execute pathogen#infect()
syntax enable
set nu
filetype plugin indent on
set noswapfile
set updatetime=250
set ruler
set backspace=2
set scrolloff=4
set mouse=a
set virtualedit=all
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


let g:airline#extensions#branch#enabled=1
