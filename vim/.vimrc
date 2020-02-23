" Check if 'plug.vim' exists, else, download from git.
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins via 'plug'
call plug#begin('~/.vim/plugged')
" Colorscheme ayu.
Plug 'ayu-theme/ayu-vim'
" Rust-lang linting, syntax, etc..
Plug 'rust-lang/rust.vim'
call plug#end()

syntax on   " enable syntax 
filetype plugin indent on   " plugin support
set number   " 'coding' numbers
let g:rustfmt_autosave = 1   " formats rust code on safe
set termguicolors   " enable termguicolors
let ayucolor="mirage"   " set the correct design for colorscheme
colorscheme ayu   " set the colorscheme
