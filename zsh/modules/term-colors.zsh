function .term-colors.apply {
  local c i=0
  case $TERM in
    linux*)
      for c (bg red green yellow blue magenta cyan fg)
        .osc "P$((i++))$theme[$c]";;
    xterm*)
      .osc 1337 "SetColors=selbg=$theme[visual_bg]"
      .osc 1337 "SetColors=selfg=$theme[visual_fg]";|
    *)
      for c ({,bright_}{black,red,green,yellow,blue,magenta,cyan,white})
        .osc-rgb 4 $((i++)) $theme[$c]
      .osc-rgb 4 234 $theme[cursorline_bg]
      .osc-rgb 4 244 $theme[comment_fg]
      .osc-rgb 10 $theme[fg]
      .osc-rgb 11 $theme[bg]
      .osc-rgb 17 $theme[visual_bg]
      .osc-rgb 19 $theme[visual_fg];;
  esac
}

function .osc { echo -n "\e]${(j.;.)@}\e\\" }
function .osc-rgb { .osc ${@:1:-1} "rgb:${@[-1]:0:2}/${@[-1]:2:2}/${@[-1]:4}" }

hook precmd term-colors '
  if [[ ${(kv)theme} == $__term_colors_check ]] return
  .term-colors.apply
  __term_colors_check=${(kv)theme}
'
hook preexec term-colors 'if [[ $2 == ssh\ * ]] __term_colors_check=stale'
