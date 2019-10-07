alias ag='ag --color-line-number=34 --color-match=31 --color-path=32'
function agc {
  ag --color -HC $@ | sed "s/\[K-\(.*\)/[K-"${(%):-%F{$theme[comment_fg]}\\1%f}/
}

ls --color=auto &> /dev/null && alias ls='ls --color=auto'

hook precmd colors '
  local comm=$theme[comment_fg] curs=$theme[cursorline_bg]
  local comm_seq=${${(%):-%F{$comm}}:2:-1} curs_seq=${${(%):-%K{$curs}}:2:-1}
  if (( $+modules[zsh/nearcolor] )) comm=${comm_seq/*;} curs=${curs_seq/*;}

  export FZF_DEFAULT_OPTS=--color=${(j.,.)=:-{hl,hl+}:1 {pointer,prompt}:4
      marker:2 header:-1 {border,bg+}:$curs
      {info,spinner}:$comm}\ ${${(Az)FZF_DEFAULT_OPTS}/--color*}
  export GREP_COLORS="cx=$comm_seq:mt=31:fn=32:ln=34:bn=33:se="
  export LS_COLORS=${(j.:.)=:-di=34 ow="34;$curs_seq" ln=35 {or,mi}"=7;31"
      ex=91 "*"{"~",.{bak,log,swp,tmp,class,o,pyc,DS_Store}}"=$comm_seq"}

  zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}
'

if [[ -f ~/.zsh/plugins/syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  hook postcompinit syntax-highlighting '
    source ~/.zsh/plugins/syntax-highlighting/zsh-syntax-highlighting.zsh
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
    hook precmd syntax "ZSH_HIGHLIGHT_STYLES[comment]=fg=\$theme[comment_fg]"
  '
fi
