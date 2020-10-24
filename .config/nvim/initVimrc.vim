"This file redirects to .vimrc, in case your config is located there, use it as init.vim

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
