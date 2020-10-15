"---------------------------------------------->
"   |_      _ o|  _     _  _  _ 
"   |_)\/  |||||<(-`|_|| )(_)(-`
"------/------------------_/------>    
"
"
" Check if 'plug.vim' exists, else, download from git.
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC 
endif

" Get Plugged
call plug#begin("~/.vim/plugged")
    " Startify (just beauty)
    Plug 'mhinz/vim-startify'

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'

    " Auto-Pairs (, [, {
    Plug 'jiangmiao/auto-pairs'

	" Markdown Preview (needs nodejs && yarn)
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

    " Nerdtree & icons
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
    Plug 'ryanoasis/vim-devicons'

	" Nice vim manual
    Plug 'vim-utils/vim-man'

    " Auto-Complete
	Plug 'ycm-core/YouCompleteMe'

    " Undotree
    Plug 'mbbill/undotree'

    " Ctrl+P fzf finder
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
	Plug 'stsewd/fzf-checkout.vim'

    " Lightline (instead of Airline)
    Plug 'itchyny/lightline.vim'
    
    " Colorscheme - OneDark
    Plug 'joshdick/onedark.vim'
call plug#end()

" General settings
" 
" TermGUIColors
if (has("termguicolors"))
    set termguicolors
endif

" Enable syntax highlighting
filetype on
filetype plugin indent on
syntax on

" Change history & undo size
set history=1000
set undolevels=1000

" Show line numbers & length
set number
set relativenumber
set autoindent
set expandtab
set tw=120
set nowrap
set fo-=t
"set colorcolumn=120
highlight ColorColumn ctermbg=233

" Configure tabs 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smartindent

" Encoding and search cases
set encoding=UTF-8
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Folding and mouse usage
set foldmethod=indent
set foldlevel=99
set mouse=a
set ruler

" Disable swap and stupid backups
set nobackup
set nowritebackup
set noswapfile

" Remap split-navigation
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Plugin Config below
"
" -Startify-
let g:startify_custom_header = [
 \ '    ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·.  ',
 \ '   •█▌▐█▀▄.▀· ▄█▀▄ ▪█·█▌██ ·██ ▐███▪ ',
 \ '   ▐█▐▐▌▐▀▀▪▄▐█▌.▐▌▐█▐█•▐█·▐█ ▌▐▌▐█· ',
 \ '   ██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌ ',
 \ '   ▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀ ',
 \ '',
 \]

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" Modify the list that startify shows
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['    Recently opened']            },
        \ { 'type': 'dir',       'header': ['   ﱮ Working directory :: '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   ﴞ Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['    Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['    Git :: Modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['    Git :: Untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]


" -CHADTree-
" Map command CHADopen to control+b
nnoremap <silent> <C-b> :CHADopen<CR>b

" -Ctrl+P-
" Map split(s)
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" Define colorscheme
colorscheme onedark
" Modify the OneDark theme
let g:onedark_termcolors=256
let g:onedark_hide_endofbuffer=0
let g:onedark_terminal_italics=1

" -Lightline-
let g:airline_theme='onedark'
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }
" Disable 'INSERT' mode, because airline shows it.
set noshowmode


" -Markdown Preview- 
"
" This will automatically start a preview window.
let g:mkdp_auto_start=1
" Automatically close the preview if markdown file gets closed.
let g:mkdp_auto_close=1





