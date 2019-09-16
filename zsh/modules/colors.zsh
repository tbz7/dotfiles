# ag
alias ag='ag --color-line-number=34 --color-match=31 --color-path=32'
function agc {
  ag --color -HC $@ | perl -pe "s/\[K-(.*)/[K-\e[38;5;244m\$1\e[0m/"
}

# fzf
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --color=bg+:234,info:244,\
spinner:244,hl:1,hl+:1,pointer:4,marker:2,prompt:4,border:234,header:-1"

# grep
export GREP_COLORS='cx=38;5;244:mt=31:fn=32:ln=34:bn=33:se='

# ls
local ls_colors=(
    'di=34'
    'ow=34;48;5;234'
    'ln=35'
    {or,mi}'=7;31'
    'ex=91'
    '*'{'~',.{bak,log,swp,tmp,class,o,pyc,DS_Store}}'=38;5;244')
zstyle ':completion:*:default' list-colors $ls_colors
export LS_COLORS=${(j.:.)ls_colors}
export CLICOLOR=true
ls --color=auto &> /dev/null && alias ls="${aliases[ls]-ls} --color=auto"

# syntax highlighting
if [[ -f ~/.zsh/plugins/syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  hook postcompinit syntax-highlighting '
    source ~/.zsh/plugins/syntax-highlighting/zsh-syntax-highlighting.zsh
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
    ZSH_HIGHLIGHT_STYLES[comment]="fg=244"
  '
fi
