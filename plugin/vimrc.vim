nnoremap <C-E> :call MyExpand('%:p')<CR>
set rtp^=$VIMRUNTIME/bundle/ctrlp.vim
helptags $VIMRUNTIME/bundle/ctrlp.vim/doc
func! MyExpand(filename)
  norm w
  let l:name = expand(a:filename)
  let l:result = l:name . ".result"
  call system("ruby ".expand("$VIMRUNTIME/mod/expand.rb"). " ".l:name)
  norm ggdG
  exec('-1r '.l:result)
  call system("del ".l:result)
endf

let mapleader="\\"
inoremap <Leader>[[ <%= %><C-[><LEFT><LEFT>i
set gfn=Source_Code_Pro:h14:qCLEARTYPE
set ar ts=4 si ai rnu ru
colors darkblue
