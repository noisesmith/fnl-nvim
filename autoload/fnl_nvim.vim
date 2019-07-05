" basic proof of concept using fennel via neovim

" Return the result of evaluating expr in fennel
function! fnl_nvim#eval(s)
  return luaeval(
        \ 'require("fennel").eval(_A.s)',
        \ {'s': a:s}
        \ )
endfunction

function! fnl_nvim#compile(s)
  return luaeval(
        \ 'require("fennel").compileString(_A.s)',
        \ {'s': a:s}
        \ )
endfunction

function! fnl_nvim#version()
  return luaeval('require("fennel").version')
endfunction
