if exists("g:did_autoload_scratch")
  finish
endif
let g:did_autoload_scratch = 1

function! s:auGroupName(bufname)
  return .bufnr(a:bufname)
endfunction

function! s:resetcontent()
  let b:buffer_list = s:buffers()
  normal! ggVGd
  call append(0, b:buffer_list)
  normal! ddgg
  setlocal nomodified
endfunction

function! s:bufopts()
  setlocal nobuflisted
  setlocal noswapfile
  setlocal nohidden
endfunction

function! scratch#invoke(fname, bnum)
  let lines = getbufline(a:bnum, 1, "$")
  let l:Func = function(a:fname)
  call l:Func(lines)
  setlocal nomodified
endfunction

function! scratch#open(bufname, writeFunction)
  execute "new ".a:bufname
  call s:bufopts()
  let l:bufnum = bufnr(a:bufname)
  execute "augroup scratch_au_for_buffer_" . l:bufnum
  execute "  au!"
  execute "  au BufWriteCmd <buffer=".l:bufnum."> call scratch#invoke('".a:writeFunction."', ".l:bufnum.")"
  execute "augroup END"
endfunction
