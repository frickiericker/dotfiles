set number
set cursorline
set list
set listchars=tab:^\ ,trail:-,extends:>,precedes:<,nbsp:%
set showbreak="+++ "
set colorcolumn=80,100

" Override molokai palette
au ColorScheme molokai hi Normal           ctermbg=none
au ColorScheme molokai hi cStorageClass    ctermfg=170
au ColorScheme molokai hi cStructure       ctermfg=75
au ColorScheme molokai hi cType            ctermfg=161
au ColorScheme molokai hi cppAuto          ctermfg=136
au ColorScheme molokai hi cppConst         ctermfg=136
au ColorScheme molokai hi cppConstexpr     ctermfg=136
au ColorScheme molokai hi cppStandoutDelim ctermfg=82
au ColorScheme molokai hi cppUnimportang   ctermfg=60
au ColorScheme molokai hi cppNamespaceStd  ctermfg=241
colorscheme molokai
