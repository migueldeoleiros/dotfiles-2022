" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
" set nowrap                              " Display long lines as just one line
filetype indent plugin on
set autoindent
set wildmenu                            " Better completion
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4                           " Insert 4 spaces for a tab
set expandtab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
" set background=dark                     " tell vim what the background color looks like
" set showtabline=2                       " Always show tabs
set laststatus=2                        " Always display statusline 
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set ignorecase                          " Case insensitive search
set smartcase
"set autochdir                           " Your working directory will always be the same as your working directory

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %

"MAPING
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-M> :nohl<CR><C-L>

"split movement keys
" nnoremap <space>j <C-W><C-J>
" nnoremap <space>k <C-W><C-K>
" nnoremap <space>l <C-W><C-L>
" nnoremap <space>h <C-W><C-H>
" nnoremap <space>wv <C-W><C-V>
" nnoremap <space>ws <C-W><C-S>
" nnoremap <space>wc <C-W><C-C>

