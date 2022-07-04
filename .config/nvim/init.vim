" --- vim-plug settings ---
call plug#begin('~/.config/nvim/plugged')

" Essentials
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'

" LaTeX
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Ctags
" Plug 'ludovicchabant/vim-gutentags'
"
" HTML/CSS/JS
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ayu-theme/ayu-vim'
" Plug 'nanotech/jellybeans.vim'
" Plug 'dylanaraps/wal'

" Initialize vim-plug
call plug#end()

" --- General settings ---
" Map <leader> to <space> (default="\")
let mapleader = " "
let maplocalleader = "\\"
inoremap jk <ESC>

" --- Options ---
syntax on
set colorcolumn=80
set encoding=utf-8
set number
set relativenumber
set noswapfile
set clipboard^=unnamedplus
set mouse=a
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set cursorline
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile

" Highlight invisible characters
set list
set listchars=tab:▸\ ,eol:¬

" Search
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Wrap
" set wrap
" set textwidth=79
" set formatoptions=qrn1

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Splits
set splitbelow splitright

" Wildmenu auto-completion
set wildmenu
set wildmode=list:longest

" Set nvim as man pager viewer
" let $PAGER=''

" Spellcheck
" setlocal spell
" set spelllang=en_us
" inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" --- Mappings ---
" Disable arrows keys
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" Disable Escape key
" inoremap <esc> <nop>

" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Edit vimrc in a vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Enable movement by screen line instead of movement by line for j, k
nnoremap j gj
nnoremap k gk

" Toggle wrap
nnoremap <leader>z :set wrap!<CR>

" Toggle spellcheck
nnoremap <leader>s :set spell!<CR>

" Splits
" Open a new vertical split and switch over
nnoremap <leader>w <C-w>v<C-w>l 
" Open a new horizontal split and switch over
nnoremap <leader>q <C-w>s<C-w>j
" Navigate around splits with <C-[hjkl]>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Resize splits
nnoremap <silent> <C-Left> :vertical resize +5<CR>
nnoremap <silent> <C-Right> :vertical resize -5<CR>
nnoremap <silent> <C-Up> :resize +5<CR>
nnoremap <silent> <C-Down> :resize -5<CR>
" Change splits from horizontal to vertical and vice versa
noremap <leader>th <C-w>t<C-w>H
noremap <leader>tk <C-w>t<C-w>K

" Open a terminal in a vertical split
nnoremap <leader>tt :vnew term://zsh<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Obscure text instantaneously (ROT13)
noremap <leader>i ggg?G

" Uppercase current word
inoremap <c-u> <esc>gUiwi
nnoremap <c-u> gUiw

" Wrap current word in quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Wrap current visually selected text in quotes
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>

" --- Abbreviations ---
iabbrev @@    hi@example.org
iabbrev ssig -- <cr>John Doe<cr>hi@example.org
iabbrev ccopy Copyright 2019 John Doe, all rights reserved.

" --- Autocommands ---
" Auto save on losing focus
autocmd FocusLost * :wa

" Turn off line wrapping for HTML files
autocmd BufNewFile,BufRead *.html setlocal nowrap

" Operator-pending mappings
" Change text in next parenthesis
onoremap in( :<c-u>normal! f(vi(<cr>
" Change text in previous parenthesis
onoremap il( :<c-u>normal! F)vi(<cr>

" --- Configure plugins ---
" Colorschemes
set termguicolors
colorscheme dracula

" ayu.vim
" let ayucolor="dark"   

" jellybeans.vim
" let g:jellybeans_use_term_italics = 1

" enable italics (this line must be placed after colorscheme)
" highlight Comment cterm=italic

" vim-plug
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>

" coc.nvim
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>

" fzf.vim
nnoremap ; :Buffers<CR>
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-g> :Rg<Cr>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>t :Tags<CR>

" markdown-preview.nvim
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop

" vim-airline
let g:airline_theme='dracula'

" nerdtree
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
" Automatically open NERDTree when nvim starts
" autocmd vimenter * NERDTree
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" nerdcommenter
filetype plugin on
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" tex-conceal.vim
set conceallevel=1
let g:tex_conceal='abdmg'

" ultiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

