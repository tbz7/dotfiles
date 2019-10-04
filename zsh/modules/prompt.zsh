setopt promptsubst

local x l='%(3V..)' r='%(3V..)'
local efg='%(V.$theme[cfgi].$theme[efg])' ebg='%(V.$theme[cbgi].$theme[ebg])'
for x ({a,b,c}{f,b}g)
  local $x="%(V.\$theme[${x}i].%(2V.\$theme[${x}2].\$theme[$x]))"

PS1="%F{$afg}%K{$abg} %m %F{$abg}%K{$bbg}$r%F{$bfg} %33<⋯ <%~ %k%F{$bbg}$r%f "
RPS1="%(?..%F{$ebg}$l%F{$efg}%K{$ebg} ✗ %(4V.%F{$cbg}$l.))"
RPS1+="%(4V.%(?.%F{$cbg}$l.)%F{$cfg}%K{$cbg} %4v .)%f%k"
PS2='%F{$theme[comment_fg]}↳  %f'
RPS2='%F{$theme[comment_fg]} %1^%f'


hook focus_gained prompt 'psvar[1]=; zle reset-prompt'
hook focus_lost prompt 'psvar[1]=1; zle reset-prompt'
hook precmd prompt 'psvar[1,3]=([3]=${(M)NO_CUSTOM_FONT:#true}); .prompt.vcs'
hook zle_keymap prompt 'psvar[2]=${(M)KEYMAP:#vicmd}; zle reset-prompt'
hook zle_line_finish prompt 'psvar[1]=1; zle reset-prompt'

async --keep 'while true; do sleep 10; echo; done' .prompt.vcs


function .prompt.vcs {
  if (( __prompt_vcs_running++ )) return
  async '{ .prompt.vcs-git || .prompt.vcs-hg } 2> /dev/null' \
      'if [[ $NO_CUSTOM_FONT == true ]] 1=${1:2}
       if [[ $psvar[4] != $1 ]]; then
         psvar[4]=$1
         zle reset-prompt
       fi
       unset __prompt_vcs_running'
}
function .prompt.vcs-git {
  local name=$(git symbolic-ref HEAD || git rev-parse --short HEAD)
  [[ -n $name ]] && echo " ${name##*/}${$(git diff --name-only HEAD; \
      git ls-files -o --exclude-standard):+ *}"
}
function .prompt.vcs-hg {
  local names=($(hg id -r . -T "$HG_NAMES {node|short}"))
  [[ -n $names ]] && echo "☿ $names[1]${$(hg id -T '{dirty}'):+ *}"
}
