if exists("g:did_load_scratch_plugin")
  finish
endif
let g:did_load_scratch_plugin = 1

command! -nargs=* Scratch call scratch#command(<f-args>)
