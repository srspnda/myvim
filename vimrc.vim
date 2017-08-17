scriptencoding utf-8
set encoding=utf-8

"
" basic options
"
let mapleader=";"
set autoread
set nocompatible
set backspace=2
set colorcolumn=80
set cursorline
set laststatus=2
set list
set listchars=tab:›\ ,eol:¬,trail:⋅
set showmatch
set t_Co=256
set scrolloff=999
set ruler
set splitbelow
set splitright
set title
set visualbell
set showbreak=↪
set nonumber

"
" clipboard options
"

set clipboard+=unnamedplus

"
" search options
"
set hlsearch
set ignorecase
set incsearch
set smartcase

"
" tab completion options
"
set wildmode=list:longest     " Wildcard matches show a list, matching the longest first
set wildignore+=.git,.hg,.svn " Ignore version control repos
set wildignore+=*.6           " Ignore Go compiled files
set wildignore+=*.pyc         " Ignore Python compiled files
set wildignore+=*.rbc         " Ignore Rubinius compiled files
set wildignore+=*.swp         " Ignore vim backups

"
" appearance options
"
syntax enable
colorscheme molokai

"
" backup options
"
execute "set directory=" . g:vim_home_path . "/swap"
execute "set backupdir=" . g:vim_home_path . "/backup"
execute "set undodir=" . g:vim_home_path . "/undo"
set backup
set undofile
set writebackup

noremap <silent><leader>/ :nohlsearch<cr>

"
" key mappings
"
inoremap jj <esc>
inoremap jJ <esc>
inoremap Jj <esc>
inoremap JJ <esc>
inoremap jk <esc>
inoremap jK <esc>
inoremap Jk <esc>
inoremap JK <esc>

" file types
autocmd FileType text setlocal textwidth=78
autocmd FileType ruby setlocal sts=2 ts=2 sw=2 expandtab
autocmd FileType json setlocal sts=2 ts=2 sw=2 expandtab
autocmd FileType go setlocal sts=8 ts=8 sw=8 noexpandtab
autocmd FileType make setlocal sts=8 ts=8 sw=8 noexpandtab
autocmd FileType python setlocal sts=4 ts=4 sw=4 expandtab
autocmd FileType tf setlocal sts=2 ts=2 sw=2 expandtab

" edit vimrc
nmap <silent> <leader>vimrc :e ~/.vimrc<CR>

" shortcut to cmdline
map ; :

" visual wrapping up/down, not entire lines
map j gj
map k gk

" easy split navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" yank to system clipboard
map <leader>y "*y
map <leader>p "*p
"
" autocommands
"
" remove whitespace at EOL
autocmd BufWritePre * :%s/\s\+$//e

" no folding
autocmd BufWinEnter * set foldlevel=999999

" goimports
let g:go_fmt_command = "goimports"
