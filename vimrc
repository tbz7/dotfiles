"-------------------------------------------------------------------------------
" Init
"-------------------------------------------------------------------------------
silent! if plug#begin('~/.vim/plugged')
  Plug 'crusoexia/vim-monokai'
  Plug 'dracula/vim'
  Plug 'joshdick/onedark.vim'
  Plug 'junegunn/fzf'
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
set hlsearch incsearch
set ignorecase smartcase
set laststatus=2 noshowmode
set list listchars=tab:»\ ,trail:·,extends:❯,precedes:❮
set modeline
set mouse=a ttymouse=xterm2
set nobackup noswapfile
set nojoinspaces
set omnifunc=syntaxcomplete#Complete
set scrolloff=2
set showcmd
let &termguicolors = $COLORTERM == 'truecolor'
set wildmenu
set wrap linebreak

au! ColorScheme hybrid hi MatchParen guifg=NONE

silent! execute 'colorscheme ' . get({'': 'gruvbox', 'solarized': 'solarized8',
\   'gotham': 'gotham' . (&termguicolors ? '' : '256')}, $THEME, $THEME)


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

nnoremap <silent> <Leader>t :NERDTreeFind<CR>
nnoremap <silent> <Leader>v :FZF<CR>


"-------------------------------------------------------------------------------
" Plugin/tool configuration
"-------------------------------------------------------------------------------
let g:airline_focuslost_inactive = 1
let g:airline_powerline_fonts = $NO_CUSTOM_FONT != 'true'
let g:airline_skip_empty_sections = 1
let g:gruvbox_italic = 1
let g:jellybeans_use_term_italics = 1
let g:monokai_term_italic = 1
let g:NERDTreeQuitOnOpen = 1
let g:onedark_terminal_italics = 1
let g:syntastic_always_populate_loc_list = 1

let s:command = system('ps -p $(ps -p $PPID -o ppid=) -o command=')
if s:command =~ 'git-difftool'
  cnoremap q qa
  set noreadonly
elseif s:command =~ 'vidir'
  setlocal tabstop=4
endif


if filereadable(expand('~/.vimrc.local')) | source ~/.vimrc.local | endif
