"-------------------------------------------------------------------------------
" Init
"-------------------------------------------------------------------------------
silent! if plug#begin('~/.vim/plugged')
  Plug 'chriskempson/base16-vim', {'do': '~/.zsh/bin/build-base16'}
  Plug 'crusoexia/vim-monokai'
  Plug 'dracula/vim'
  Plug 'joshdick/onedark.vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/goyo.vim'
  Plug 'lifepillar/vim-solarized8'
  Plug 'morhetz/gruvbox'
  Plug 'nanotech/jellybeans.vim'
  Plug 'scrooloose/nerdtree', {'on': 'NERDTreeFind'}
  Plug 'scrooloose/syntastic'
  Plug 'vim-airline/vim-airline'
  Plug 'w0ng/vim-hybrid'
  Plug 'whatyouhide/vim-gotham'
  call plug#end()
endif


"-------------------------------------------------------------------------------
" Settings
"-------------------------------------------------------------------------------
set autoindent smartindent
set autoread
set background=dark
set backspace=2
set colorcolumn=80 number
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set foldlevelstart=99
set formatoptions=tcqj
set hidden
set history=10000
set hlsearch incsearch
set ignorecase smartcase
set laststatus=2 noshowmode
set list listchars=tab:»\ ,trail:·,extends:❯,precedes:❮
set modeline
silent! set mouse=a ttymouse=xterm2
set nobackup noswapfile
set nojoinspaces
set omnifunc=syntaxcomplete#Complete
set scrolloff=2
set showcmd
set wildmenu
set wrap linebreak


"-------------------------------------------------------------------------------
" Keybindings
"-------------------------------------------------------------------------------
let mapleader = ' '

inoremap fd <Esc>
vnoremap fd <Esc>
cnoremap fd <C-c>
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj
nnoremap Q @q
map <C-b> <C-a>

nnoremap / /\v
cnoremap <expr> s/ getcmdline() =~ '\a' ? 's/' : 's/\v'
cnoremap <expr> p/ getcmdline() =~ '\a' ? 'p/' : "!perl -pe 's/'<Left>"

nnoremap <silent> <CR> :noh<CR><CR>

nnoremap <silent> <Leader>l :set invnumber<CR>
nnoremap <silent> <Leader>w :set invwrap<CR>

cnoremap w!! w !sudo tee > /dev/null %

nnoremap <silent> <Leader>g :Goyo<CR>
nnoremap <silent> <Leader>t :NERDTreeFind<CR>
nnoremap <silent> <Leader>v :FZF<CR>


"-------------------------------------------------------------------------------
" Plugin/tool configuration
"-------------------------------------------------------------------------------
let g:airline_focuslost_inactive=1
let g:NERDTreeQuitOnOpen = 1
let g:syntastic_always_populate_loc_list = 1

let s:command = system('ps -p $(ps -p $PPID -o ppid=) -o command=')
if s:command =~ 'git-difftool'
  cnoremap q qa
  set noreadonly
elseif s:command =~ 'vidir'
  setlocal tabstop=4
endif


if filereadable(expand('~/.vimrc.local')) | source ~/.vimrc.local | endif
