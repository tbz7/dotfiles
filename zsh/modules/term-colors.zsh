function .term-colors.apply {
  local x i=0 j=('' / '' / '' '')
  case $TERM in
    linux*)
      for x (bg red green yellow blue magenta cyan fg)
        echo -n "\e]P$((i++))${theme[$x]:1}\e\\";;
    xterm*)
      echo -n "\e]1337;SetColors=selbg=${theme[visual_bg]:1}\e\\"
      echo -n "\e]1337;SetColors=selfg=${theme[visual_fg]:1}\e\\";|
    *)
      for x ({,bright_}{black,red,green,yellow,blue,magenta,cyan,white})
        echo -n "\e]4;$((i++));rgb:${(@j..)${(s..)theme[$x]:1}:^j}\e\\"
      for i x (10 fg 11 bg 17 visual_bg 19 visual_fg)
        echo -n "\e]$i;rgb:${(@j..)${(s..)theme[$x]:1}:^j}\e\\";;
  esac
}

hook precmd term-colors '
  if [[ ${(kv)theme} == $__term_colors_check ]] return
  .term-colors.apply
  __term_colors_check=${(kv)theme}
'
hook preexec term-colors 'if [[ $2 == ssh\ * ]] __term_colors_check=stale'
