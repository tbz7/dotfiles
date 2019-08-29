psvar=('' '' '' '' 235 235 243 247 109 237 247 247 243 239 239 237 247 187 243
       237 239 237 235 160 102)
local n=(vcs vicmd ia font {a,b,c}{f,b}g{,2,i} efg ebg comment_fg)
local i=({1..$#n}); local -A i=(${n:^i})
local x l="%($i[font]V..)" r="%($i[font]V..)"

for x in {a,b,c}{f,b}g; do
  local $x="%($i[ia]V.%$i[${x}i]v.%($i[vicmd]V.%$i[${x}2]v.%$i[$x]v))"
done
for x (efg ebg) local $x="%($i[ia]V.%$i[${x/e/c}i]v.%$i[$x]v)"

PS1="%F{$afg}%K{$abg} %m %F{$abg}%K{$bbg}$r%F{$bfg} %33<⋯ <%~ %k%F{$bbg}$r%f "
RPS1="%(?..%F{$ebg}$l%F{$efg}%K{$ebg} ✗ %($i[vcs]V.%F{$cbg}$l.))"
RPS1+="%($i[vcs]V.%(?.%F{$cbg}$l.)%F{$cfg}%K{$cbg} %$i[vcs]v .)%f%k"
PS2="%F{%$i[comment_fg]v}↳  %f"
RPS2="%F{%$i[comment_fg]v} %1^%f"


hook focus_gained prompt "psvar[$i[ia]]=; zle reset-prompt"
hook focus_lost prompt "psvar[$i[ia]]=1; zle reset-prompt"
hook precmd prompt "
  .prompt.vcs $i[vcs]
  psvar[$i[vicmd]]=
  psvar[$i[ia]]=
  psvar[$i[font]]=\${\${NO_CUSTOM_FONT:-1}:#true}
  $(for x ($n[(r)afg,-1])
      echo "if [[ -n \$theme[$x] ]] psvar[$i[$x]]=#\$theme[$x]")
"
hook zle_keymap prompt "psvar[$i[vicmd]]=\${(M)KEYMAP:#vicmd}; zle reset-prompt"
hook zle_line_finish prompt "psvar[$i[ia]]=1; zle reset-prompt"

async --keep 'while true; do sleep 10; echo; done' ".prompt.vcs $i[vcs]"


function .prompt.vcs {
  if (( __prompt_vcs_running++ )) return
  async '{ .prompt.vcs-git || .prompt.vcs-hg || echo } 2> /dev/null' \
      "if [[ \$NO_CUSTOM_FONT == true ]] 1=\${1:2}
       if [[ \$psvar[$1] != \$1 ]]; then
         psvar[$1]=\$1
         zle reset-prompt
       fi
       unset __prompt_vcs_running"
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
