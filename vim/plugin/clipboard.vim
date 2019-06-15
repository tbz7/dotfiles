if ($TMUX != '' || $SSH_CONNECTION != '' || !has('clipboard')) && exists('##TextYankPost')
  augroup Clipboard
    au! TextYankPost * call system('clip > /dev/tty', @")
    if $TMUX != ''
      au! FocusGained * let @" = system('tmux show-buffer')
    endif
  augroup END
else
  set clipboard=unnamed,unnamedplus
endif
