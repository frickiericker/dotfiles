if has('nvim')
  let s:vim_dir = $HOME . '/.config/nvim'
else
  let s:vim_dir = $HOME . '/.vim'
endif
let s:plugin_dir = s:vim_dir . '/plugins'
let s:vimplug = s:vim_dir . '/autoload/plug.vim'
let s:vimplug_uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if empty(glob(s:vimplug))
  execute '!curl -sfLo ' . s:vimplug . ' --create-dirs ' . s:vimplug_uri
  source $MYVIMRC
endif

" https://github.com/junegunn/vim-plug
call plug#begin(s:plugin_dir)

" Colorschemes
Plug 'tomasr/molokai'

" Editing support
Plug 'vim-scripts/vim-auto-save'
Plug 'easymotion/vim-easymotion'
Plug 'matze/vim-move'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Search and completion
Plug 'Raimondi/delimitMate'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

" VCS
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Semantic analysis
Plug 'majutsushi/tagbar'
Plug 'critiqjo/lldb.nvim'
Plug 'Valloric/YouCompleteMe',
  \ {
  \    'do': 'python2 install.py --clang-completer --racer-completer --tern-completer',
  \    'for': ['c', 'cpp', 'python', 'javascript', 'rust', 'go']
  \ }

" Syntax
Plug 'rust-lang/rust.vim'
Plug 'petRUShka/vim-opencl'
Plug 'tikhomirov/vim-glsl'
Plug 'zah/nim.vim'
Plug 'cespare/vim-toml'
Plug 'jelera/vim-javascript-syntax'

call plug#end()

" Autoinstall missing plugins
autocmd VimEnter *
 \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
 \|   PlugInstall --sync | q
 \| endif
