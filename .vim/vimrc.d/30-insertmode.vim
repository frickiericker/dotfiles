set showmatch

set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

au FileType vim        setlocal sw=2
au FileType css        setlocal sw=2
au FileType javascript setlocal sw=2 cindent
au FileType html       setlocal sw=2
au FileType scheme     setlocal sw=2
au FileType go         setlocal noet sw=4 ts=4
au FileType c          setlocal cindent
au FileType cpp        setlocal cindent
au FileType rust       setlocal cindent

set cinoptions+=L0.5s        " half-indent jump labels
set cinoptions+=:0.5s,=0.5s  " half-indent case labels
set cinoptions+=g0.5s,h0.5s  " half-indent member access specifiers
