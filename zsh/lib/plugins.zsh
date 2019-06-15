__plugins=()

function plug {
  case $1 in
    clear) rm -rf ~/.zsh/plugins ~/.zcompdump;;
    update) .plugins.update;;
    */*) .plugins.load ${@:1};;
    *) print -P "%F{red}Invalid plug command%f";;
  esac
}

function .plugins.update { (
  if ! mkdir -p ~/.zsh/plugins || ! cd ~/.zsh/plugins; then
    print -P "%F{red}Could not create plugins folder%f"
    return 1
  fi
  for plugin in $__plugins; do
    if [[ -d $plugin ]]; then
      cd $plugin
      git pull
    else
      mkdir -p ${plugin/\/*}
      cd ${plugin/\/*}
      git clone --depth 1 "https://github.com/$plugin"
    fi
    cd ~/.zsh/plugins
  done
  rm -f ~/.zcompdump
) }

function .plugins.load {
  __plugins+=$1
  for f (~/.zsh/plugins/$1/*.plugin.zsh(N)) source $f
  [[ -d ~/.zsh/plugins/$1 ]]
}
