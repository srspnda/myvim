scriptencoding utf-8
set encoding=utf-8

"
" basic options
"
let mapleader=";"
set autoread
set autoindent
set nocompatible
set backspace=2
set cursorline
set laststatus=2
set list
set listchars=tab:›\ ,eol:¬,trail:⋅
set showmatch
set scrolloff=999
set ruler
set splitbelow
set splitright
set title
set visualbell
set nonumber

"
" clipboard options
"
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

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
" colorscheme
"
syntax enable
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
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

" file types
autocmd FileType text setlocal textwidth=78
autocmd FileType ruby setlocal sts=2 ts=2 sw=2 expandtab
autocmd FileType json setlocal sts=2 ts=2 sw=2 expandtab
autocmd FileType go setlocal sts=8 ts=8 sw=8 noexpandtab
autocmd FileType make setlocal sts=8 ts=8 sw=8 noexpandtab
autocmd FileType python setlocal sts=4 ts=4 sw=4 expandtab
autocmd FileType tf setlocal sts=2 ts=2 sw=2 expandtab
autocmd FileType yaml setlocal sts=2 ts=2 sw=2 expandtab

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

"
" vim-go
"
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" :GoDeclsDir
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
  autocmd!

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
