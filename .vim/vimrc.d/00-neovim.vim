if !has("nvim")
  syntax on
  filetype plugin indent on
  silent !mkdir -p ~/.vim/backup
  silent !mkdir -p ~/.vim/swap
  silent !mkdir -p ~/.vim/undo
  set autoindent
  set autoread
  set backspace=indent,eol,start
  set belloff=all
  set backupdir=.,~/.vim/backup
  set complete-=i
  set directory=~/.vim/swap//
  set display=lastline
  set formatoptions=tcqj
  set history=10000
  set hlsearch
  set incsearch
  set langnoremap
  set nolangremap
  set laststatus=2
  set listchars=tab:>\ ,trail:-,nbsp:+
  set nocompatible
  set nrformats=bin,hex
  set ruler
  set sessionoptions-=options
  set showcmd
  set smarttab
  set tabpagemax=50
  set tags=./tags;,tags
  set ttyfast
  set undodir=~/.vim/undo
  set viminfo+=!
  set wildmenu
endif
