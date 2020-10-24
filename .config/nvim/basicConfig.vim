"SET BASIC CONFIGS

set nocompatible

filetype indent plugin on

set hidden

"copy paste between vim and everything else
set clipboard=unnamedplus

" Show cursor position
set ruler 

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches use <C-L> to temporarily turn off highlighting
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled
set autoindent

" Stop certain movements from always going to the first character of a line.
set nostartofline

" Display the cursor position on the last line of the screen or in the status line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

"raise a dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

"Makes popup manus smaller 
set pumheight=10

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Indentation settings for using 4 spaces instead of tabs.
set shiftwidth=4
set softtabstop=4
set expandtab

"MAPING
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-M> :nohl<CR><C-L>

"split movement keys
nnoremap <space>j <C-W><C-J>
nnoremap <space>k <C-W><C-K>
nnoremap <space>l <C-W><C-L>
nnoremap <space>h <C-W><C-H>
nnoremap <space>wv <C-W><C-V>
nnoremap <space>ws <C-W><C-S>
nnoremap <space>wc <C-W><C-C>

