# scratch.vim

Scratch.vim is a plugin for creating scratch buffers with custom write-handlers.

## Usage

### `scratch#open(bufname, handler)`

Scratch.vim exposes a function `scratch#open(bufname, handler)`, which opens a scratch buffer named
`a:bufname`. Whenever you write that buffer, rather than saving the buffer contents to a file, the
second argument `a:handler` will be called with a list containing the contents of the scratch
buffer.

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

### `:Scratch`

You can also use the `:Scratch` ex command to create scratch buffers on the fly. This command takes
0 - 3 arguments

    :Scratch [bufname [filetype [write-handler]]]

- `bufname`: This is the name used for the scratch buffer. Defaults to `'*** SCRATCH BUFFER ***'`
- `filetype`: This is the filetype used for the scratch buffer. Defaults to `''`
- `write-handler`: This is the function used as a write handler. Defaults to `'scratch#noop'`
