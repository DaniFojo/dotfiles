execute pathogen#infect()
syntax enable
set nu
filetype plugin indent on

set updatetime=250

if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

