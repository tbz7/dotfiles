#-------------------------------------------------------------------------------
# Init
#-------------------------------------------------------------------------------
source ~/.zsh/lib/init.zsh

autoload -U run-help && unalias -m run-help
autoload -U zargs zmv
zmodload zsh/complist


#-------------------------------------------------------------------------------
# Settings
#-------------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=50000 SAVEHIST=50000
ZLE_SPACE_SUFFIX_CHARS='&|'
setopt appendhistory
setopt extendedglob
setopt globstarshort
setopt histignorealldups
setopt histignorespace
setopt interactivecomments

zstyle ':completion:*' matcher-list 'm:{a-z-_}={A-Z_-}'
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on


#-------------------------------------------------------------------------------
# Keybindings
#-------------------------------------------------------------------------------
bindkey -e
bindkey $terminfo[kdch1] delete-char
bindkey $terminfo[kend] end-of-line
bindkey $terminfo[khome] beginning-of-line
bindkey -M menuselect $terminfo[kcbt] reverse-menu-complete
bindkey '^u' backward-kill-line
bindkey 'fd' vi-cmd-mode
if (( $+commands[fzf] )) bindkey '^t' fzf-files '^r' fzf-history '\ev' fzf-vim


#-------------------------------------------------------------------------------
# Environment
#-------------------------------------------------------------------------------
export COPYFILE_DISABLE=true
export EDITOR='vim'
export FZF_DEFAULT_COMMAND="\
    find * \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
        -o -name '*.app' -prune -print \
        -o -type f -print -o -type d -print -o -type l -print 2> /dev/null"
export FZF_DEFAULT_OPTS='-m --reverse --cycle --height=40%'
export LESS='-iR --follow-name'
export PAGER='less'


#-------------------------------------------------------------------------------
# Aliases
#-------------------------------------------------------------------------------
alias ag='ag -S'
alias grep='grep -E --color=auto'
alias zmv='noglob zmv'

alias cdd='cd ~/Desktop'
alias cdf='() { cd $1:h } '
alias cdot='() { cd $1:A:h } ~/.zshrc'
alias cdotl='() { cd $1:A:h } ~/.zshrc.local'
alias clean='() { find ${1-.} \( -name .DS_Store -o -name "._*" \) -print -delete }'
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
alias kl="() { ps -eo user,pid,time,command | fzf -n4.. --min-height=15 \
    --header-lines=1 --preview 'echo {}' --preview-window down:3:wrap \
    | awk '{print \$2}' | xargs kill \$@ }"
alias mmv='zmv -W'
alias tm='tmux new-session -A -s main'

alias bu='brew update; brew upgrade; brew cleanup -s'
alias vu='vim -c "set ls=0 nonu cc=|au BufAdd * on" +PlugUpgrade +PlugUpdate +q'
alias zu='plug update'
alias up="${commands[brew]+bu;}vu;zu"


if [[ -f ~/.zshrc.local ]] source ~/.zshrc.local
