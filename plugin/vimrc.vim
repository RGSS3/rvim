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

let mapleader="\\"
inoremap <Leader>[[ <%= %><LEFT><LEFT>
set gfn^=Ubuntu\ Mono\ 14,Source_Code_Pro:h14:qCLEARTYPE
set ar ts=4 si ai rnu ru
colors darkblue
