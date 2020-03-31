local x efg='%(V.$theme[cfgi].$theme[efg])' ebg='%(V.$theme[cbgi].$theme[ebg])'
for x ({a,b,c}{f,b}g)
  local $x="%(V.\$theme[${x}i].%(2V.\$theme[${x}2].\$theme[$x]))"

PROMPT="%F{$afg}%K{$abg} %m %F{$abg}%K{$bbg}%F{$bfg} %33<…<%~ %k%F{$bbg}%f "
RPROMPT="%(?..%F{$ebg}%F{$efg}%K{$ebg} ✗ %(3V.%F{$cbg}.))"
RPROMPT+="%(3V.%(?.%F{$cbg}.)%F{$cfg}%K{$cbg} %3v .)%f%k"
PROMPT2='%8F↳  %f'
RPROMPT2='%8F %1^%f'

hook precmd prompt 'psvar[1,2]=("" ""); .prompt.vcs'
hook zle-focus-gained prompt 'psvar[1]=; zle reset-prompt'
hook zle-focus-lost prompt 'psvar[1]=1; zle reset-prompt'
hook zle-keymap-select prompt 'psvar[2]=${(M)KEYMAP:#vicmd}; zle reset-prompt'
hook zle-line-finish prompt 'psvar[1]=1; zle reset-prompt'

trap 'if [[ $funcstack[1] != fzf-* ]] .prompt.vcs' ALRM
TMOUT=10

function .prompt.vcs {
  if (( __prompt_vcs_running++ )) return
  async "{ ${(j. || .)${(@o)functions[(I).prompt.vcs-*]}} } 2> /dev/null" \
      'if [[ $psvar[3] != $1 ]]; then
         psvar[3]=$1
         zle reset-prompt
       fi
       __prompt_vcs_running=0'
}
function .prompt.vcs-git {
  local name=$(git symbolic-ref HEAD || git rev-parse --short HEAD)
  [[ -n $name ]] && print -P " ${name##*/}${$(
      git diff --name-only HEAD; git ls-files -o --exclude-standard):+ *}"
}
