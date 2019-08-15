psvar=('' '' '' 233 233 233 110 107 236 110 107 188 235 235 234 110 107 188 234 234 233 233 167 244)
local names=(vcs vicmd ia {a,b,c}{f,b}g{,2,i} efg ebg comment_fg) n=({1..$#psvar})
local -A i=(${names:^n})

for x in a b c; do
  local FF$x="%F{%($i[ia]V.%$i[${x}fgi]v.%($i[vicmd]V.%$i[${x}fg2]v.%$i[${x}fg]v))}"
  local KK$x="%K{%($i[ia]V.%$i[${x}bgi]v.%($i[vicmd]V.%$i[${x}bg2]v.%$i[${x}bg]v))}"
  local FK$x="%F{%($i[ia]V.%$i[${x}bgi]v.%($i[vicmd]V.%$i[${x}bg2]v.%$i[${x}bg]v))}"
done
local FFe="%F{%($i[ia]V.%$i[cfgi]v.%$i[efg]v)}"
local KKe="%K{%($i[ia]V.%$i[cbgi]v.%$i[ebg]v)}"
local FKe="%F{%($i[ia]V.%$i[cbgi]v.%$i[ebg]v)}"

if [[ $NO_CUSTOM_FONT != true ]]; then
  PROMPT="$FFa$KKa %m $FKa$KKb$FFb %33<⋯ <%~ %k$FKb%f "
  RPROMPT="%(?..$FKe$FFe$KKe ✗ %($i[vcs]V.$FKc.))%($i[vcs]V.%(?.$FKc.)$FFc$KKc %$i[vcs]v .)%f%k"
  PROMPT2="%F{%$i[comment_fg]v}↳  %f"
  RPROMPT2="%F{%$i[comment_fg]v} %1^%f"
else
  PROMPT="%($i[vicmd]V.%2F%m%f:%3F.%4F%m%f:%2F)%33<...<%~%f %(!.#.$) "
  RPROMPT="%(?..%S%1F X %f%s)%($i[vcs]V. %$i[vcs]v .)"
fi


#-------------------------------------------------------------------------------

hook theme prompt "
  local c k v; local -A i=(${(kv)i})
  zstyle -a ':theme' colors c
  for k v (\$c) (( \$i[\$k] )) && psvar[\$i[\$k]]=\"#\$v\"
"

hook precmd prompt-vicmd "psvar[$i[vicmd]]="
hook zle_keymap prompt-vicmd "psvar[$i[vicmd]]=\${(M)KEYMAP:#vicmd}; zle reset-prompt"

hook precmd prompt-ia "psvar[$i[ia]]="
hook zle_line_finish prompt "psvar[$i[ia]]=1; zle reset-prompt"

hook focus_gained prompt-focus "psvar[$i[ia]]=; zle reset-prompt"
hook focus_lost prompt-focus "psvar[$i[ia]]=1; zle reset-prompt"


#-------------------------------------------------------------------------------

function .prompt.vcs {
  local name hg_names result
  zstyle -s ':prompt:vcs' hg-names hg_names
  if name=$(git symbolic-ref HEAD || git rev-parse --short HEAD); then
    result=" ${name##*/}${$(git diff --name-only HEAD; git ls-files -o --exclude-standard):+ *}"
  elif name=($(hg id -r . -T "$hg_names {node|short}")); then
    result="☿ $name[1]${$(hg id -T '{dirty}'):+ *}"
  fi 2> /dev/null
  [[ $NO_CUSTOM_FONT == true ]] && echo ${result:2} || echo $result
}

function .prompt.vcs-refresh {
  if (( __prompt_vcs_running++ )) return
  async .prompt.vcs \
      "if [[ \$psvar[$1] != \$1 ]]; then
         psvar[$1]=\$1
         zle reset-prompt
       fi
       unset __prompt_vcs_running"
}
hook precmd prompt-vcs ".prompt.vcs-refresh $i[vcs]"
async --keep 'while true; do sleep 10; echo; done' ".prompt.vcs-refresh $i[vcs]"
