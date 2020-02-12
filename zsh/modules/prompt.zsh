setopt promptsubst

local x l='%(3V..)' r='%(3V..)'
local efg='%(V.$theme[cfgi].$theme[efg])' ebg='%(V.$theme[cbgi].$theme[ebg])'
for x ({a,b,c}{f,b}g)
  local $x="%(V.\$theme[${x}i].%(2V.\$theme[${x}2].\$theme[$x]))"

PROMPT="%F{$afg}%K{$abg} %m %F{$abg}%K{$bbg}$r%F{$bfg} %33<…<%~ %k%F{$bbg}$r%f "
RPROMPT="%(?..%F{$ebg}$l%F{$efg}%K{$ebg} ✗ %(4V.%F{$cbg}$l.))"
RPROMPT+="%(4V.%(?.%F{$cbg}$l.)%F{$cfg}%K{$cbg} %4v .)%f%k"
PROMPT2='%F{$theme[comment_fg]}↳  %f'
RPROMPT2='%F{$theme[comment_fg]} %1^%f'


hook alarm prompt '.prompt.vcs'
hook focus_gained prompt 'psvar[1]=; zle reset-prompt'
hook focus_lost prompt 'psvar[1]=1; zle reset-prompt'
hook precmd prompt 'psvar[1,3]=([3]=${(M)NO_CUSTOM_FONT:#true}); .prompt.vcs'
hook zle_keymap prompt 'psvar[2]=${(M)KEYMAP:#vicmd}; zle reset-prompt'
hook zle_line_finish prompt 'psvar[1]=1; zle reset-prompt'


function .prompt.vcs {
  if (( __prompt_vcs_running++ )) return
  async "{ ${(j. || .)${(@o)functions[(I).prompt.vcs-*]}} } 2> /dev/null" \
      'if [[ $psvar[4] != $1 ]]; then
         psvar[4]=$1
         zle reset-prompt
       fi
       __prompt_vcs_running=0'
}
function .prompt.vcs-git {
  local name=$(git symbolic-ref HEAD || git rev-parse --short HEAD)
  [[ -n $name ]] && print -P "%(3V.git:. )${name##*/}${$(
      git diff --name-only HEAD; git ls-files -o --exclude-standard):+ *}"
}
