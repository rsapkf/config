" --- vim-plug settings ---
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree' 
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'godlygeek/tabular'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'liuchengxu/vim-which-key'
Plug 'simnalamburt/vim-mundo'
" Git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
" Ctags
" Plug 'ludovicchabant/vim-gutentags'
" Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" LaTeX
Plug 'lervag/vimtex'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" HTML/CSS/JS
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'pangloss/vim-javascript'
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ayu-theme/ayu-vim'

call plug#end()

" --- General settings ---
" Map <Leader> to <Space> (default=`\`) and <LocalLeader> to `\`
let mapleader = " "
let maplocalleader = "\\"
inoremap jk <ESC>

" Set nvim as man page viewer
" let $PAGER=''

" --- Options ---
" Set the character encoding
set encoding=utf-8
" Switch syntax highlighting on
syntax on
" Display a ruler after 80 characters in each line
set colorcolumn=80
" Show the line number in front of each line
set number
" Show the line number relative to current line in front of each line
set relativenumber
" Disable swap files
set noswapfile
" Add the unnamed register to the clipboard
set clipboard^=unnamedplus
" Enable mouse for scrolling and resizing
set mouse=a
" Minimal number of screen lines to keep above and below the cursor
set scrolloff=3
" Copy indent from current line when starting a new line
set autoindent
" Show the current mode
set showmode
" Don't show the current command in the last line of the screen
set showcmd
" Hide buffers in the background instead of closing them
set hidden
" Use visual bell instead of beeping
set visualbell
" Highlight the line under the cursor
set cursorline
" Show the line and column number of cursor position, separated by a comma
set ruler
" Always display the status line
set laststatus=-2
" Automatically save undo history to an undo file
set undofile
" Allow backspacing over indent, line breaks, and the start of insert
set backspace=indent,eol,start
" Highlight invisible characters
set list
set listchars=tab:▸\ ,eol:¬
" Read edited files automatically
set autoread

" Tabs
" Replace tabs with spaces
set expandtab
" Tabs are 4 spaces long
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Search
" Ignore case when searching
set ignorecase
" Automatic case-sensitive search when query contains an uppercase letter
set smartcase
" Incrementally match the search
set incsearch
" Enable search highlighting
set hlsearch
" Set 'g' flag on by default
set gdefault
" Highlight matching braces
set showmatch
" Stop highlighting the matches
nnoremap <Leader><Space> :nohlsearch<CR>
" Enable very magic mode (make every character except a-zA-Z0-9 and '_' have special meaning)
nnoremap / /\v
vnoremap / /\v

" Wrap
" set wrap
" set textwidth=79
" set formatoptions=qrn1

" Windows
" New window from split is below the current one
set splitbelow
" New window is put right of the current one
set splitright

" Use menu for command line completion
set wildmenu
set wildmode=list:longest

" Spellcheck
" Toggle spellcheck
nnoremap <Leader>sp :set spell!<CR>
set spelllang=en_us
" inoremap <C-l> <C-g>u<Esc>[s1z=`]a<c-g>u

" --- Mappings ---
" Disable arrows keys
" nnoremap <Up> <NOP>
" nnoremap <Down> <NOP>
" nnoremap <Left> <NOP>
" nnoremap <Right> <NOP>
" inoremap <Up> <NOP>
" inoremap <Down> <NOP>
" inoremap <Left> <NOP>
" inoremap <Right> <NOP>

" Source config
nnoremap <Leader>sc :source $MYVIMRC<CR>
" Edit config in a vertical split
nnoremap <Leader>ec :vsplit $MYVIMRC<CR>

" Enable movement by screen line instead of line numbers
nnoremap j gj
nnoremap k gk

" Delete without yanking
nnoremap <Leader>d "_d
vnoremap <Leader>d "_d

" Replace currently selected text with default register without yanking it
vnoremap <Leader>p "_dP

" Copy entire document
nnoremap <Leader>a :%y+<CR>

" Use <Tab> to jump to matching bracket
nnoremap <Tab> %
vnoremap <Tab> %

" <Esc> in terminal mode to enter normal mode
" if has('nvim')
  " tnoremap <Esc> <C-\><C-n>
  " tnoremap <C-v><Esc> <Esc>
" endif

" Strip trailing whitespaces in the file
nnoremap <Leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Toggle wrap
nnoremap <Leader>z :set wrap!<CR>

" Splits
" Open a new vertical split and switch over
nnoremap <Leader>w <C-w>v<C-w>l 
" Open a new horizontal split and switch over
nnoremap <Leader>q <C-w>s<C-w>j
" Navigate around splits with <C-[hjkl]>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" if has('nvim')
  " tnoremap <C-h> <c-\><c-n><c-w>h
  " tnoremap <C-j> <c-\><c-n><c-w>j
  " tnoremap <C-k> <c-\><c-n><c-w>k
  " tnoremap <C-l> <c-\><c-n><c-w>l
" endif
" Resize splits
nnoremap <silent> <C-Left> :vertical resize +5<CR>
nnoremap <silent> <C-Right> :vertical resize -5<CR>
nnoremap <silent> <C-Up> :resize +5<CR>
nnoremap <silent> <C-Down> :resize -5<CR>
" Change splits from horizontal to vertical and vice versa
noremap <Leader>th <C-w>t<C-w>H
noremap <Leader>tk <C-w>t<C-w>K

" Open a terminal in a vertical split
nnoremap <Leader>tt :vnew term://zsh<CR>

" Go to tab by number
noremap <Leader>1 1gt
noremap <Leader>2 2gt
noremap <Leader>3 3gt
noremap <Leader>4 4gt
noremap <Leader>5 5gt
noremap <Leader>6 6gt
noremap <Leader>7 7gt
noremap <Leader>8 8gt
noremap <Leader>9 9gt
noremap <Leader>0 :tablast<CR>

" Obscure text instantaneously (ROT13)
noremap <Leader>i ggg?G

" Uppercase current word
inoremap <M-u> <Esc>gUiwi
nnoremap <M-u> gUiw

" Wrap current word in quotes
nnoremap <Leader>" viw<Esc>a"<Esc>bi"<Esc>lel

" Wrap current visually selected text in quotes
vnoremap <Leader>" <Esc>`<i"<Esc>`>la"<Esc>

" Fold (HTML) tag
nnoremap <Leader>ft Vatzf

" Sort CSS properties
nnoremap <Leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Toggle fold with comma
nnoremap , za
vnoremap , za

" ---
" https://github.com/nelstrom/vim-visual-star-search/blob/master/plugin/visual-star-search.vim
" Make * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" Recursively vimgrep for word under cursor or selection if you hit leader-star
if maparg('<leader>*', 'n') == ''
  nmap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
endif
if maparg('<leader>*', 'v') == ''
  vmap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>
endif
" ---

" --- Abbreviations ---
iab @@ hi@example.org
iab ssig -- <CR>John Doe<CR>hi@example.org
iab ccopy Copyright 2019 John Doe, All rights reserved.
iab nf ¯\_(ツ)_/¯

" --- Autocommands ---
" Auto save on losing focus
autocmd FocusLost * :wa

" Turn off line wrapping for HTML files
autocmd BufNewFile,BufRead *.html setlocal nowrap

" --- Operator-pending mappings ---
" Change text in next parenthesis
onoremap in( :<C-u>normal! f(vi(<CR>
" Change text in previous parenthesis
onoremap il( :<C-u>normal! F)vi(<CR>

" --- Configure plugins ---
" vim-plug
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pu :PlugUpdate<CR>

" neoclide/coc.nvim
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <silent> <Leader>h :call CocActionAsync('doHover')<CR>
" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" junegunn/fzf.vim
nnoremap <C-p> :GFiles<CR>
nnoremap <C-g> :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>t :Tags<CR>

" tpope/vim-unimpaired
" Move lines up/down
" nnoremap <M-Up> ddkP
" nnoremap <M-Down> ddp
" vnoremap <M-Up> xkP`[V`]
" vnoremap <M-Down> xp`[V`]
" Improved versions of above using vim-unimpaired
nmap <M-Up> [e
nmap <M-Down> ]e
vmap <M-Up> [egv
vmap <M-Down> ]egv

" vim-airline/vim-airline
let g:airline_theme='dracula'

" scrooloose/nerdtree
nnoremap <Leader>e :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFocus<CR>
" Automatically open NERDTree when nvim starts
" autocmd vimenter * NERDTree
" Exit if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" scrooloose/nerdcommenter
filetype plugin on
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" lervag/vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" iamcco/markdown-preview.nvim
map <Leader>m :MarkdownPreview<CR>

" Yggdroot/indentLine
let g:indentLine_setConceal = 0

" SirVer/ultiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" liuchengxu/vim-which-key
nnoremap <silent> <Leader> :WhichKey '<Space>'<CR>

" nvim-treesitter/nvim-treesitter
lua << EOF
    require'nvim-treesitter.configs'.setup {
    ensure_installed = { "javascript", "c", "lua", "rust", "javascript" },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- List of parsers to ignore installing (for "all")
    -- ignore_install = { "java" },
    highlight = {
      enable = true,
      -- list of language that will be disabled
      -- disable = { "c", "rust" },
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  }
EOF

" simnalamburt/vim-mundo
nnoremap <F5> :MundoToggle<CR>
let g:mundo_width = 60
let g:mundo_preview_height = 40
let g:mundo_right = 1

" Colorschemes
set termguicolors
colorscheme ayu
let ayucolor="dark"   

" Enable italics (must be placed after colorscheme)
" highlight COMMENT cterm=italic
