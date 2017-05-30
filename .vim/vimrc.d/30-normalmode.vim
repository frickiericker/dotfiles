nmap <Up>      :bp<CR>
nmap <Down>    :bn<CR>
nmap <Left>    <C-O>
nmap <Right>   <C-I>
nmap <C-Left>  :pop<CR>
nmap <C-Right> :tag<CR>
nmap <C-j>     <C-d>
nmap <C-k>     <C-u>

" fzf
let g:fzf_command_prefix = 'Fzf'
nmap F :FzfFiles<CR>

" tagbar
nmap <F8> :TagbarToggle<CR>

" vim-easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

nmap ,         <Plug>(easymotion-overwin-f2)
map  <Leader>j <Plug>(easymotion-j)
map  <Leader>k <Plug>(easymotion-k)

" vim-move
let g:move_key_modifier = 'M'

" vim-gitgutter
nmap <F9> :GitGutterStageHunk<CR>
