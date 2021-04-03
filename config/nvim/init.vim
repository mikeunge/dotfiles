"---vimrc----------------------------------->
"   |_      _ o|  _     _  _  _ 
"   |_)\/  |||||<(-`|_|| )(_)(-`
"------/------------------_/------>    
" updated: 24. Mar. 2021
"
"
" Check if 'plug.vim' exists, else, download from git.
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC 
endif


" Start of Plug (plugged)
call plug#begin("~/.vim/plugged")

	" Markdown Preview (needs nodejs && yarn)
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

    " Smooth scrolling
    Plug 'psliwka/vim-smoothie'

    " Show a line when indented
    Plug 'Yggdroot/indentLine'
    " this adds the indent also to blanklines, needs to be the lua branch til it gets merged with main
    Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' } " "

    " Chadtree & icons
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
    Plug 'ryanoasis/vim-devicons'

    " Undotree
    Plug 'mbbill/undotree'

    " Ctrl+P fzf finder
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
	Plug 'stsewd/fzf-checkout.vim'


    " - UI/UX -
    "
    " Startify (beautyful vim start)
    Plug 'mhinz/vim-startify'

    " Lightline (instead of Airline)
    Plug 'itchyny/lightline.vim'

    " Colorscheme - OneDark
    " -> (modified)
    Plug 'joshdick/onedark.vim'

    " - UI/UX end - 


    " - Code -
    "
    " Loads & Displays function scopes
    Plug 'preservim/tagbar'

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'

    " Auto-Pairs (, [, {
    Plug 'jiangmiao/auto-pairs'

	" Easily comment out lines via gcc (for the current line) or gc (for selected visual-mode)
	Plug 'tpope/vim-commentary'

    " Prettier
	Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

    " Make, build, etc..
    Plug 'tpope/vim-dispatch'

    " Shows git diffs
    Plug 'airblade/vim-gitgutter'

    " Show the gitbranch in lightline
    Plug 'itchyny/vim-gitbranch'

    " Neomake - show code errors
    Plug 'neomake/neomake'

    " -Code end-


    " - Deoplete -
    "
    " basic deoplete => nice and easy code completion
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " -> GoLang
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

    " -> C
    Plug 'zchee/deoplete-clang'

    " -> Python
    Plug 'davidhalter/jedi-vim'
    Plug 'deoplete-plugins/deoplete-jedi'
	Plug 'Vimjas/vim-python-pep8-indent'

    " -> PHP
    Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
    Plug 'kristijanhusak/deoplete-phpactor'

    " - Deoplete end -

call plug#end()
" End of plug


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

" Set a max-width
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

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
set cursorline
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
" easily rename variables in local scope
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

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

" Define colorscheme
colorscheme onedark
" Modify the OneDark theme
let g:onedark_termcolors=256
let g:onedark_hide_endofbuffer=0
let g:onedark_terminal_italics=1
" add the 'hi' modification to the onedark colorscheme so the custom_header's fg is white.
autocmd ColorScheme onedark hi StartifyHeader ctermfg=000


" Plugin Config below
"
" -startify-
let g:startify_custom_header = [
    \ '   ░░░░█▐▄▒▒▒▌▌▒▒▌░▌▒▐▐▐▒▒▐▒▒▌▒▀▄▀▄░',
    \ '   ░░░█▐▒▒▀▀▌░▀▀▀░░▀▀▀░░▀▀▄▌▌▐▒▒▒▌▐░',
    \ '   ░░▐▒▒▀▀▄▐░▀▀▄▄░░░░░░░░░░░▐▒▌▒▒▐░▌',
    \ '   ░░▐▒▌▒▒▒▌░▄▄▄▄█▄░░░░░░░▄▄▄▐▐▄▄▀░░',
    \ '   ░░▌▐▒▒▒▐░░░░░░░░░░░░░▀█▄░░░░▌▌░░░',
    \ '   ▄▀▒▒▌▒▒▐░░░░░░░▄░░▄░░░░░▀▀░░▌▌░░░',
    \ '   ▄▄▀▒▐▒▒▐░░░░░░░▐▀▀▀▄▄▀░░░░░░▌▌░░░',
    \ '   ░░░░█▌▒▒▌░░░░░▐▒▒▒▒▒▌░░░░░░▐▐▒▀▀▄',
    \ '   ░░▄▀▒▒▒▒▐░░░░░▐▒▒▒▒▐░░░░░▄█▄▒▐▒▒▒',
    \ '   ▄▀▒▒▒▒▒▄██▀▄▄░░▀▄▄▀░░▄▄▀█▄░█▀▒▒▒▒',
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
" -startify end-


" -chadtree-
" Map command CHADopen to control+b
nnoremap <silent> <C-b> :CHADopen<CR>b
" -chadtree end-


" -ctrl+p-
" Map split(s)
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" -ctrl+p end-


" -lightline-
" let g:lightline = {
"       \ 'colorscheme': 'onedark',
" 	  \ }
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
set noshowmode
" -lightline end-


" -markdown preview- 
"
" This will automatically start a preview window.
let g:mkdp_auto_start=0
" Automatically close the preview if markdown file gets closed.
let g:mkdp_auto_close=1
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
" -makrdown preview end-


" -prettier-
"
" Autoformat the file on save.
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#tab_width = 4 
let g:prettier#config#use_tabs = 'auto'
" -prettier end-


" -tmux-
"
" Set the tmux window name to the current open file.
if exists('$TMUX')
    " Check if a file has been opened or a new (empty) buffer got created.
    if bufname("%") != ""
        autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window 'vim | " . expand("%:t") . "'")
    else
        autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window 'vim | <empty buffer>'")
    endif
    " After the file get's closed, tmux changes the name to the current directory. 
    autocmd VimLeave * call system("tmux setw automatic-rename")
endif
" -tmux end-


" -deoplete-
"
let g:deoplete#enable_at_startup = 1
" add the gocode binary manual, deoplete-go goes ~~brrr~~
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
set autoread
" path to clang
let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/11.1.0/lib/libclang.dylib'
" -deoplete end-


" -tagbar-
"
" Open tagbar via F6
nmap <F6> :TagbarToggle<CR>
" -tagbar end-


" -gitgutter-
"
let g:gitgutter_git_executable = '/usr/bin/git'
" -gitgutter end-


" -neomake-
"
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)
" -neomake end-


" -undotree-
"
" Open undotree via F5
noremap <F5> :UndotreeToggle<CR>
if has("persistent_undo")
    set undodir=$HOME/.undotree
    set undofile
endif
" -undotree end-


" -indentLine-
"
" Modify the drawn character list.
let g:indentLine_char_list = ['|', '|', '|', '|']
" -indentLine end-

