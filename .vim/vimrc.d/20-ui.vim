set visualbell
set timeoutlen=60
set cmdheight=2
set statusline=
set statusline+=<%n>        " buffer number
set statusline+=\ %<%f      " file path
set statusline+=\ %h%w%m%r  " [HELP][Preview][+][RO]
set statusline+=%=          " right align
set statusline+=%c,         " cursor position (column)
set statusline+=%l/%L       " cursor position (line)
set statusline+=\ %P        " percent position
