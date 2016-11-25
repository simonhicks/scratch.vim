# scratch.vim

Scratch.vim is a plugin for creating scratch buffers with custom write-handlers. It exposes a single
function `scratch#open(bufname, handler)`, which opens a scratch buffer named `a:bufname`. Whenever
you write that buffer, rather than saving the buffer contents to a file, the second argument
`a:handler` will be called with a list containing the contents of the scratch buffer.

In other words, if you add this to your .vimrc ...

```{.vim}
function! Echo(lines)
  for line in a:lines
    echom line
  endfor
endfunction

command! -nargs=1 EchoBuf call scratch#open(<q-args>, "Echo")
```

... then `:EchoBuf foo` will open a scratch buffer `foo`. When you run `:w` in that buffer, it will
echo the contents of the buffer to the screen.
