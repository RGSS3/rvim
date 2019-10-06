let g:rvim=expand("<sfile>:p:h:h")
exec 'set rtp^='. g:rvim . '/bundle/ctrlp'
runtime plugin/ctrlp.vim
nnoremap <C-E> :call MyExpand('%:p')<CR>
func! MyExpand(filename)
  norm w
  let l:name = expand(a:filename)
  let l:result = l:name . ".result"
  call system("ruby ".g:rvim. "/expand.rb ".l:name)
  norm ggdG
  exec('-1r '.l:result)
  call system("del ".l:result)
endf

set gfn=consolas:h12
set ar ts=4 sw=4 si ai rnu ru expandtab noswapfile nobackup ff=unix ffs=unix,dos go=e
colors pablo
let g:netrw_browse_split=3
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver20-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,a:ver40-Cursor
let s:h = 0
let s:s = 0.5
let s:v = 0.5
func MyTimer(timer)
  let h = s:h / 60.0
  let i = float2nr(h)
  let f = h - i
  let a = s:v * (1 - s:s)
  let b = s:v * (1 - s:s * f)
  let c = s:v * (1 - s:s * (1 - f)) 
  if s:h < 60
      let rgb = [s:v, c, a]
  elseif s:h < 120
      let rgb = [b, s:v, a]
  elseif s:h < 180
      let rgb = [a, s:v, c]
  elseif s:h < 240
      let rgb = [a, b, s:v]
  elseif s:h < 300
      let rgb = [c, a, s:v]
  else
      let rgb = [s:v, a, b]
  endif
  let rgb = [float2nr(rgb[0] * 255), float2nr(rgb[1] * 255), float2nr(rgb[2] * 255)]
  let str = printf("#%02x%02x%02x", rgb[0], rgb[1], rgb[2]) 
  let s:h = (s:h + 1) % 360
  let cmd = printf("hi Cursor guibg=%s guifg=%s", str, str)
  exec cmd 
  let cmd = printf("hi StatusLine guibg=%s", str)
  exec cmd
endfunc
call timer_start(16, 'MyTimer', {'repeat': -1}) 
