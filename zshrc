#-------------------------------------------------------------------------------
# Imports
#-------------------------------------------------------------------------------
zmodload zsh/complist
zmodload zsh/datetime
zmodload zsh/mapfile

autoload -U compinit
autoload -U run-help && unalias -m run-help
autoload -U zargs
autoload -U zmv

source ~/.zsh/include/lib.zsh
source ~/.zsh/include/cd-widgets.zsh
source ~/.zsh/include/prompt.zsh
source ~/.zsh/include/term.zsh
source ~/.zsh/include/theme.zsh

if [[ -f ~/.zshrc.local ]] source ~/.zshrc.local


#-------------------------------------------------------------------------------
# Settings
#-------------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000 SAVEHIST=10000
ZLE_RPROMPT_INDENT=0
ZLE_SPACE_SUFFIX_CHARS='&|'

setopt appendhistory
setopt autopushd
setopt extendedglob
setopt globstarshort
setopt histignorealldups
setopt histignorespace
setopt interactivecomments
setopt promptsubst


#-------------------------------------------------------------------------------
# Keybindings
#-------------------------------------------------------------------------------
bindkey -e
bindkey $terminfo[kdch1] delete-char
bindkey $terminfo[kend] end-of-line
bindkey $terminfo[khome] beginning-of-line
bindkey -M menuselect $terminfo[kcbt] reverse-menu-complete
bindkey '\e[1;3C' cd-forward
bindkey '\e[1;3D' cd-back
bindkey '^u' backward-kill-line
bindkey '^z' fg
bindkey 'fd' vi-cmd-mode

widget fg 'zle push-line; BUFFER=fg; zle accept-line'


#-------------------------------------------------------------------------------
# Environment
#-------------------------------------------------------------------------------
typeset -U path fpath
path=(~/bin ~/.zsh/bin $path)
fpath=(~/.zsh/completion $fpath)

export CLICOLOR=true
export COPYFILE_DISABLE=true
export EDITOR='vim'
export FZF_DEFAULT_COMMAND="find * \( -path '*/\.*' -o -fstype 'dev' \
    -o -fstype 'proc' \) -prune -o -name '*.app' -prune -print \
    -o -type f -print -o -type d -print -o -type l -print 2> /dev/null"
export FZF_DEFAULT_OPTS="-m --reverse --cycle --height=40% \
    --color=hl:1,hl+:1,bg+:0,info:8,border:0,prompt:4,pointer:4 \
    --color=marker:2,spinner:8,header:-1"
export GREP_COLORS='cx=90:mt=31:fn=32:ln=34:bn=33:se='
export LESS='-iR --follow-name'
export LS_COLORS=${(j.:.)=:-'di=34' 'ow=34;40' 'ln=35' {or,mi}'=7;31'
    'ex=91' '*'{'~',.{bak,log,swp,tmp,class,o,pyc,DS_Store}}'=90'}
export MANPAGER="sh -c \"col -bx |\
    vim -R -c 'set ft=man nomod noma nolist nonu cc= ls=1|map q :q<CR>' -\""
export PAGER='less'

if [[ -n $TMUX ]] hook preexec tmux-env 'eval $(tmux switchc -Z\; showenv -s)'


#-------------------------------------------------------------------------------
# Aliases
#-------------------------------------------------------------------------------
alias ag='ag --color-line-number=34 --color-match=31 --color-path=32'
alias grep='grep -E --color=auto'
ls --color=auto &> /dev/null && alias ls='ls --color=auto'
alias vidir='() { EDITOR="vim -S $1" vidir ${@:2} } =(echo setlocal tabstop=4)'
alias zmv='noglob zmv'

alias agc='() { ag --color -HC $@ | perl -pe "s/\[K-(.*)/[K-\e[90m\$1\e[0m/" }'
alias cdd='cd ~/Desktop'
alias cdf='() { cd $1:A:h }'
alias cdot='cdf ~/.zshrc'
alias cdotl='cdf ~/.zshrc.local'
alias clean='(){find ${1-.} \( -name .DS_Store -o -name ._\* \) -print -delete}'
alias g='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gcm='git commit -am `git rev-parse --abbrev-ref HEAD`'
alias gcma='gcm --amend'
alias gd='git difftool'
alias gds='git diff --stat'
alias gl='git log --graph --format="%Cred%h%Creset %s %Cgreen(%cr) %Cblue<%an>"'
alias gm='git difftool -g --dir-diff'
alias gr='git rebase'
alias mmv='zmv -W'
alias tm='tmux new-session -A -s main'
alias v='vim +FZF'

alias bu='brew update; brew upgrade; brew cleanup -s'
alias pu='git -C ~/.zsh/.. submodule update -j 20 --init --remote --depth=1'
alias up="${commands[brew]+bu;}pu"


#-------------------------------------------------------------------------------
# Completion
#-------------------------------------------------------------------------------
zstyle ':completion:*' matcher-list 'm:{a-z-_}={A-Z_-}'
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

compinit -C


#-------------------------------------------------------------------------------
# Plugins
#-------------------------------------------------------------------------------
if [[ -f ~/.zsh/plugins/syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source ~/.zsh/plugins/syntax-highlighting/zsh-syntax-highlighting.zsh
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
  ZSH_HIGHLIGHT_STYLES[comment]='fg=8'
fi

if [[ -n $commands[fzf] && -d ~/.vim/pack/default/start/fzf/shell ]]; then
  source ~/.vim/pack/default/start/fzf/shell/completion.zsh
  source ~/.vim/pack/default/start/fzf/shell/key-bindings.zsh
fi
