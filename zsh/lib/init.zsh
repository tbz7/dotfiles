if (( __zshrc_loaded++ )) return

for f (hooks paths plugins term zle) source ~/.zsh/lib/$f.zsh || return 1

hook precmd finish-zshrc-load '
  unhook precmd finish-zshrc-load
  local initial_precmd_functions=($precmd_functions)

  local modules=(~/.zsh/modules/*.zsh) skip_modules=()
  zstyle -a :modules skip skip_modules
  for m (${${modules:t:r}:|skip_modules}) source ~/.zsh/modules/$m.zsh

  autoload -U compinit && compinit -C
  run-hooks postcompinit

  for f (${precmd_functions:|initial_precmd_functions}) $f
'
