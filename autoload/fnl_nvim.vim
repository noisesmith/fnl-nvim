lua require("patch_searcher")()

" basic proof of concept using fennel via neovim

" Return the result of evaluating expr in fennel
function! fnl_nvim#eval(s)
  return luaeval(
        \ 'require("fennel").eval(_A.s)',
        \ {'s': a:s}
        \ )
endfunction

" function! fnl_nvim#evalarg(s, m)
"   return luaeval(
"         \ 'require("fennel").eval(_A.s)(_A.m)',
"         \ {'s': a:s, 'm': a:m}
"         \ )
" endfunction

function! fnl_nvim#compile(s)
  return luaeval(
        \ 'table.concat(require("fennel").compileString(_A.s), "\\n")',
        \ {'s': a:s}
        \ )
endfunction

" function fnl_nvim#compile_interactive() range
"   return luaeval(
"         \ 'string.gsub(require("fennel").compileString(_A.s), "\n", "\\n")',
"         \ {'s': a:s}
"         \ )
" endfunction

function! fnl_nvim#dofile(s)
  return luaeval(
        \ 'require("fennel").dofile(_A.s)',
        \ {'s': a:s}
        \ )
endfunction

function! fnl_nvim#version()
  return luaeval('require("fennel").version')
endfunction

command! -nargs=1 Fnl call fnl_nvim#eval(<f-args>)
command! -nargs=1 -complete=file FnlFile echo fnl_nvim#dofile(<f-args>)
command! -nargs=1 FnlCompile echo fnl_nvim#compilestr(<f-args>)
