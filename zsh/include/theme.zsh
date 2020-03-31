function theme {
  export THEME=${@[-1]:-${THEME:-${mapfile[$HOME/.theme]:-gruvbox}}}
  if [[ $1 == -s ]] mapfile[$HOME/.theme]=$THEME
  declare -gA theme=(${=mapfile[$HOME/.zsh/themes/$THEME]})

  local palette x i=0 j=('' / '' / '' '')
  case $TERM in
    linux*)
      for x (bg red green yellow blue magenta cyan fg)
        palette+="\e]P$((i++))${theme[$x]:1}\e\\\\";;
    xterm*)
      palette+="\e]1337;SetColors=selbg=${theme[visual_bg]:1}\e\\\\"
      palette+="\e]1337;SetColors=selfg=${theme[visual_fg]:1}\e\\\\";|
    *)
      for x ({,bright_}{black,red,green,yellow,blue,magenta,cyan,white})
        palette+="\e]4;$((i++));rgb:${(@j..)${(s..)theme[$x]:1}:^j}\e\\\\"
      for i x (10 fg 11 bg 17 visual_bg 19 visual_fg)
        palette+="\e]$i;rgb:${(@j..)${(s..)theme[$x]:1}:^j}\e\\\\";;
  esac

  hook precmd theme "echo -n $palette:q"
}
theme
