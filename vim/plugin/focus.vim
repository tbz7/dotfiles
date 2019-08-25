exe "nnoremap <silent> \<Esc>[I :silent doau FocusGained<CR>"
exe "nnoremap <silent> \<Esc>[O :silent doau FocusLost<CR>"
exe "inoremap <silent> \<Esc>[I <C-o>:silent doau FocusGained<CR>"
exe "inoremap <silent> \<Esc>[O <C-o>:silent doau FocusLost<CR>"
exe "vnoremap <silent> \<Esc>[I <Esc>:silent doau FocusGained<CR>gv"
exe "vnoremap <silent> \<Esc>[O <Esc>:silent doau FocusLost<CR>gv"
exe "cnoremap <expr>   \<Esc>[I <SID>SetF(1)"
exe "cnoremap <expr>   \<Esc>[O <SID>SetF(2)"
exe "onoremap <silent> \<Esc>[I <Esc>:silent doau FocusGained<CR>"
exe "onoremap <silent> \<Esc>[O <Esc>:silent doau FocusLost<CR>"
augroup FocusEvents
  au! FocusGained * if &autoread | checktime | endif
  silent! au! CmdlineLeave * if s:f == 1 | silent doau FocusGained |
  \   elseif s:f == 2 | silent doau FocusLost | endif | let s:f = 0
augroup END
function! s:SetF(f)
  let s:f = a:f
  return ''
endfunction
let s:f = 0
