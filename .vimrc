"************************************************************************************
" Ashton Fagg's .vimrc
" Last Update: 6 March 2018
"************************************************************************************

set nocompatible
filetype off
set backspace=2
"************************************************************************************
" Formatting and Indent Settings
syntax enable
set background=light
set hidden
set autoindent
set smartindent
set noexpandtab
set ts=8 sw=8 sts=8
set textwidth=0

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
