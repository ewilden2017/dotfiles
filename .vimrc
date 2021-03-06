set nocompatible

let mapleader=','

" Plugins

 if empty(glob('~/.vim/autoload/plug.vim'))
   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
 endif

" Only configure if vim-plug is installed
if !empty(glob('~/.vim/autoload/plug.vim')) || !empty(glob('~/vimfiles/autoload/plug.vim'))
    call plug#begin('~/.vim/plugged')

    Plug 'ctrlpvim/ctrlp.vim'
"    Plug 'itchyny/lightline.vim'
    Plug 'airblade/vim-gitgutter'
"    Plug 'Valloric/YouCompleteMe'
    Plug 'tpope/vim-fugitive'


    Plug 'morhetz/gruvbox'
    Plug 'arcticicestudio/nord-vim'
    Plug 'dracula/vim'

    Plug 'ARM9/arm-syntax-vim'
"    Plug 'ycm-core/YouCompleteMe'

    call plug#end()

    " lightline
"    let g:lightline = {
"        \ 'colorscheme': 'one'
"        \ '}

"    let g:lightline.tabline = {
"        \ 'left':  [ ['tabs'] ],
"        \ 'right': [ ['close'] ]
"        \ }
"    set showtabline=2
"    set guioptions-=e

    " CtrlP
    let g:ctrlp_match_window = 'bottom,order:ttb'
    let g:ctrlp_switch_buffer = 0
    let g:ctrlp_working_path_mode = 0
    if filereadable('/usr/bin/ag')
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    endif

    " ,b launches ctrl-p buffer mode
    nnoremap <silent> <leader>b :CtrlPBuffer<CR>
    " ,. launches ctrl-p in tag mode
    nnoremap <silent> <leader>. :CtrlPTag<CR>

    " Arm highlighting
    au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

    " YCM
    let g:ycm_autoclose_preview_window_after_completion = 1
    set signcolumn=yes

endif


" Colors & Fonts
if has('gui_running')
    set guifont=DejaVu\ Sans\ Mono:h10

    if has#colorscheme('dracula')
        colorscheme dracula
    else
        colorscheme desert
    endif

    set mouse=a
    autocmd GUIEnter * set vb t_vb=
else
    colorscheme dracula
endif

syntax on
set background=dark

" Fix terminal highlighting
if &term =~ '256color'
    set t_ut=
endif

" Whitespace
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set wrap
set lbr
"set formatoptions=tcqrn1
set tw=0

" UI
set number
set ruler
set showcmd

filetype indent plugin on
set wildmenu
set wildignore=*.o,*~,*.pyc
if has('win16') || has('win32')
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set lazyredraw
set showmatch " Matching (,{, etc.
set magic

set scrolloff=5

" Searching
set incsearch
set hlsearch

set ignorecase
set smartcase

map<silent> <leader><CR> :nohlsearch<CR>

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldcolumn=1

nnoremap <space> za
set foldmethod=indent

" Movement
" Move by displayed lines when wrapping
nnoremap<silent> j gj
nnoremap<silent> k gk

" Commands

" Try this for a bit
inoremap jk <esc>

if !has('win16') && !has('win32')
    command! W w !sudo tee % > /dev/null
endif

nnoremap<leader>c :set list!<CR>

" Buffer movement
nnoremap<silent> <leader>l :bn<CR>
nnoremap<silent> <leader>h :bp<CR>


" Spelling
let $LANG='en'
set spelllang=en
set langmenu=en
set encoding=utf-8

nnoremap <leader>ss :setlocal spell!<CR>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s
nnoremap <leader>sa zg
nnoremap <leader>s? z=


" Misc
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set history=500
set autoread

" Don't run lines at beginning of file
set modelines=0

" Allow buffers to be hidden, can change without saving
set hidden

set backspace=indent,eol,start
set laststatus=2

" No beeping
set novisualbell
set noerrorbells
set t_vb=
set tm=500
