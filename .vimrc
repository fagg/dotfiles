"************************************************************************************
" Ashton Fagg's .vimrc
" Last Update: June 23 2013
"************************************************************************************
filetype plugin on
execute pathogen#infect()
let mapleader=","
"************************************************************************************
" Formatting and Indent Settings
syntax enable
set hidden
set tabstop=2
set shiftwidth=4
set expandtab
set smarttab
set ai
set si
set wrap
set cindent
set smartindent
set autoindent
set copyindent
set preserveindent
set textwidth=120
set pastetoggle=<F2>
"***********************************************************************************
" For LaTeX
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_au
"***********************************************************************************
" UI Behaviour/Appearance Settings
if has('gui_running')
    set background=dark
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"
    colorscheme solarized
else
    colorscheme desert
    set background=dark
    set title
endif

set nocompatible
set ruler
set showmode
set showcmd
set nu
set showmatch
set noerrorbells
set novisualbell
set lazyredraw
set list
set listchars=tab:>·,trail:· " but only show trailing tabs and spaces
set shortmess=atI

"wildmenu and buffer management behaviour
set wildmenu
set wildmode=longest:full,full
set wildignore=*.swp,*.bak,*.o
set wildcharm=<Tab>
nnoremap <leader>b :ls<CR>:b <Space>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprev<CR>

set cmdheight=1
set scrolloff=5
set sidescrolloff=5
set undolevels=1000
nmap <silent><leader>m :set mouse=a<CR>
"***********************************************************************************
" Search Behaviour Settings
set incsearch
set smartcase
set ignorecase
set hlsearch
set showmatch
"***********************************************************************************
" File Type Settings
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set noswapfile
"***********************************************************************************
" System Specific Settings
set shell=bash
"***********************************************************************************
"vim-notes settings
let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.txt'
