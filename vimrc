"-------------------------------------------------------------------------------
" Settings
"-------------------------------------------------------------------------------
source $VIMRUNTIME/defaults.vim

set autoindent smartindent
set autoread
set background=dark
set colorcolumn=80 number
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set foldlevelstart=99
set formatoptions=tcqj
set hidden
set hlsearch
set ignorecase smartcase
set laststatus=2 noshowmode
set list listchars=tab:»\ ,trail:·,extends:❯,precedes:❮
set modeline
set nobackup noswapfile
set nojoinspaces
set omnifunc=syntaxcomplete#Complete
set scrolloff=2
let &termguicolors = $COLORTERM == 'truecolor'
set ttymouse=xterm2
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

nnoremap <silent> <Leader>t :NERDTreeFind <Bar> NERDTreeFocus<CR>
nnoremap <silent> <Leader>v :FZF<CR>


"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------
let g:airline_focuslost_inactive = 1
let g:airline_powerline_fonts = $NO_CUSTOM_FONT != 'true'
let g:airline_skip_empty_sections = 1
let ayucolor = 'dark'
let g:jellybeans_use_term_italics = 1
let g:monokai_term_italic = 1
let g:NERDTreeQuitOnOpen = 1
let g:netrw_home = '~'
let g:nord_italic = 1
let g:onedark_terminal_italics = 1
let g:solarized_diffmode = 'high'
let g:syntastic_always_populate_loc_list = 1

au! BufRead,BufNewFile */zsh/themes/* set syntax=r
au! ColorScheme ayu hi! link NERDTreeDir Type | hi! link NERDTreeFile Normal |
\                   hi! link DiffAdd StatusLineTermNC |
\                   hi! link DiffDelete WildMenu | hi! link DiffText Search
au! ColorScheme dracula hi! link DiffAdd DraculaSearch |
\                       hi! link DiffDelete DraculaRedInverse
au! ColorScheme gruvbox8* hi StatusLineNC ctermbg=247
au! ColorScheme hybrid hi MatchParen guifg=NONE

packloadall

sil! exe 'colorscheme '.get({'': 'gruvbox8', 'gruvbox': 'gruvbox8', 'solarized':
\   'solarized8', 'gotham': 'gotham'.(&termguicolors?'':'256')}, $THEME, $THEME)


if filereadable(expand('~/.vimrc.local')) | source ~/.vimrc.local | endif
