function .term-colors.apply {
  local c i=0 s; local -A t
  zstyle -a ':theme' colors t

  case $TERM in
    linux*)
      for c (bg red green yellow blue magenta cyan fg)
        echo -n "\e]P$((i++))$t[$c]\e\\";;
    xterm*)
      echo -n "\e]1337;SetColors=selbg=$t[visual_bg]\e\\"
      echo -n "\e]1337;SetColors=selfg=$t[visual_fg]\e\\";|
    *)
      for s c (
          '4;0'   $t[black]
          '4;1'   $t[red]
          '4;2'   $t[green]
          '4;3'   $t[yellow]
          '4;4'   $t[blue]
          '4;5'   $t[magenta]
          '4;6'   $t[cyan]
          '4;7'   $t[white]
          '4;8'   $t[bright_black]
          '4;9'   $t[bright_red]
          '4;10'  $t[bright_green]
          '4;11'  $t[bright_yellow]
          '4;12'  $t[bright_blue]
          '4;13'  $t[bright_magenta]
          '4;14'  $t[bright_cyan]
          '4;15'  $t[bright_white]
          '4;234' $t[cursorline_bg]
          '4;244' $t[comment_fg]
          '10'    $t[fg] # foreground
          '11'    $t[bg] # background
          '17'    $t[visual_bg]  # selection
          '19'    $t[visual_fg]) # selected text
        echo -n "\e]$s;rgb:${c:0:2}/${c:2:2}/${c:4}\e\\";;
  esac
}
hook theme .term-colors.apply

hook preexec term-colors-ssh 'if [[ $2 == ssh\ * ]] __term_colors_stale=true'
hook precmd term-colors-ssh '
  if [[ -n $__term_colors_stale ]] .term-colors.apply; unset __term_colors_stale
'
