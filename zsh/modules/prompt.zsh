psvar=('' '' '' '5;'{233,233,233,110,107,236,110,107,188,235,235,234,110,107,188,234,234,233,233,167,244})
local names=(vcs vicmd ia {a,b,c}{f,b}g{,2,i} efg ebg comment_fg) n=({1..$#psvar}) e=$'\e'
local -A i=(${names:^n})

for x in a b c; do
  local FF$x="%{${e}[38;%($i[ia]V.%$i[${x}fgi]v.%($i[vicmd]V.%$i[${x}fg2]v.%$i[${x}fg]v))m%}"
  local KK$x="%{${e}[48;%($i[ia]V.%$i[${x}bgi]v.%($i[vicmd]V.%$i[${x}bg2]v.%$i[${x}bg]v))m%}"
  local FK$x="%{${e}[38;%($i[ia]V.%$i[${x}bgi]v.%($i[vicmd]V.%$i[${x}bg2]v.%$i[${x}bg]v))m%}"
done
local FFe="%{${e}[38;%($i[ia]V.%$i[cfgi]v.%$i[efg]v)m%}"
local KKe="%{${e}[48;%($i[ia]V.%$i[cbgi]v.%$i[ebg]v)m%}"
local FKe="%{${e}[38;%($i[ia]V.%$i[cbgi]v.%$i[ebg]v)m%}"

if [[ $NO_CUSTOM_FONT != true ]]; then
  PROMPT="$FFa$KKa %m $FKa$KKb$FFb %33<⋯ <%~ %k$FKb%f "
  RPROMPT="%(?..$FKe$FFe$KKe ✗ %($i[vcs]V.$FKc.))%($i[vcs]V.%(?.$FKc.)$FFc$KKc %$i[vcs]v .)%f%k"
  PROMPT2="%{${e}[38;%$i[comment_fg]vm%}↳  %f"
  RPROMPT2="%{${e}[38;%$i[comment_fg]vm%} %1^%f"
else
  PROMPT="%($i[vicmd]V.%2F%m%f:%3F.%4F%m%f:%2F)%33<...<%~%f %(!.#.$) "
  RPROMPT="%(?..%S%1F X %f%s)%($i[vcs]V. %$i[vcs]v .)"
fi


#-------------------------------------------------------------------------------

if [[ $NO_CUSTOM_FONT != true && $COLORTERM == truecolor ]]; then
  hook theme prompt "
    local c k v; local -A i=(${(kv)i})
    zstyle -a ':theme' colors c
    for k v in \$c; do
      if (( \$i[\$k] )) psvar[\$i[\$k]]=\"2;\$((0x\${v:0:2}));\$((0x\${v:2:2}));\$((0x\${v:4}))\"
    done
  "
fi

hook precmd prompt-vicmd "psvar[$i[vicmd]]="
hook zle_keymap prompt-vicmd "psvar[$i[vicmd]]=\${(M)KEYMAP:#vicmd}; zle reset-prompt"

hook precmd prompt-ia "psvar[$i[ia]]="
hook zle_line_finish prompt "psvar[$i[ia]]=1; zle reset-prompt"

hook focus_gained prompt-focus "psvar[$i[ia]]=; zle reset-prompt"
hook focus_lost prompt-focus "psvar[$i[ia]]=1; zle reset-prompt"


#-------------------------------------------------------------------------------

function .prompt.vcs {
  if (($+1)) cd $1
  local name hg_names result
  zstyle -s ':prompt:vcs' hg-names hg_names
  if name=$(git symbolic-ref HEAD || git rev-parse --short HEAD); then
    result=" ${name##*/}${$(git diff --name-only HEAD; git ls-files -o --exclude-standard):+ *}"
  elif name=($(hg id -r . -T "$hg_names {node|short}")); then
    result="☿ $name[1]${$(hg id -T '{dirty}'):+ *}"
  fi 2> /dev/null
  [[ $NO_CUSTOM_FONT == true ]] && echo ${result:2} || echo $result
}

hook precmd prompt-vcs "psvar[$i[vcs]]=\$(.prompt.vcs)"
if zstyle -T ':prompt:vcs' async && plug 'mafredri/zsh-async'; then
  eval "function .prompt.vcs.callback {
    if [[ \$psvar[$i[vcs]] != \$3 ]]; then
      psvar[$i[vcs]]=\$3
      zle && zle reset-prompt
    fi
  }"
  async_start_worker prompt-vcs -u
  async_register_callback prompt-vcs .prompt.vcs.callback
  hook precmd prompt-vcs 'async_job prompt-vcs .prompt.vcs $PWD'

  function .prompt.vcs-schedule.callback {
    async_job prompt-vcs .prompt.vcs $PWD
    async_job prompt-vcs-schedule sleep 10
  }
  async_start_worker prompt-vcs-schedule
  async_register_callback prompt-vcs-schedule .prompt.vcs-schedule.callback
  .prompt.vcs-schedule.callback
fi
