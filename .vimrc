"************************************************************************************
" Ashton Fagg's .vimrc
" Last Update: 6 March 2018
"************************************************************************************

set nocompatible
filetype off

"*************************************************************************************
" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'google/vim-glaive'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-maktaba'
Plugin 'https://github.com/vim-syntastic/syntastic'
Plugin 'bronson/vim-trailing-whitespace'
call vundle#end()

"************************************************************************************
" Formatting and Indent Settings
syntax enable
set background=dark
set hidden
set autoindent
set smartindent
set expandtab
set ts=4 sw=4 sts=4
set textwidth=0

"***********************************************************************************
" For LaTeX
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_us


"***********************************************************************************
" UI Behaviour/Appearance Settings
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
:let mapleader = "\\"

set cmdheight=1
set scrolloff=5
set sidescrolloff=5
set undolevels=1000

set t_Co=256
set autoread
set clipboard=unnamedplus
set ttimeoutlen=10


" Ignore build artifacts
set wildignore+=*/bin/*
set wildignore+=*/build/*

set laststatus=2

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
set nocp
filetype plugin indent on

"***********************************************************************************
" System Specific Settings
set shell=bash

"***********************************************************************************
" Code formatting

set comments^=:///

" Autoformatting settings
call glaive#Install()
Glaive codefmt
    \ plugin[mappings]=',='
    \ clang_format_executable='clang-format'
    \ clang_format_style='file'

augroup autoformat
    autocmd!
    autocmd FileType c, cpp, proto,javascript AutoFormatBuffer clang-format
    autocmd Filetype python AutoFormatBuffer autopep8
augroup END
