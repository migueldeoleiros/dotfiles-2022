"VIMRC

"PLUGINS
call plug#begin()

Plug 'joshdick/onedark.vim'

Plug 'itchyny/lightline.vim'
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

Plug 'neoclide/coc.nvim',{'for':['zig','cmake','rust',
     \'java','json', 'haskell', 'ts','sh', 'cs',
     \'yaml', 'c', 'cpp', 'd', 'go',
     \'python', 'dart', 'javascript', 'vim'], 'branch': 'release'}

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf.vim'

call plug#end()

"COLORSCHEME
"transparency with onedark theme
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

syntax on
colorscheme onedark

source ~/.config/nvim/basicConfig.vim "Basic configs
source ~/.config/nvim/cocConfig.vim "COC configuration

