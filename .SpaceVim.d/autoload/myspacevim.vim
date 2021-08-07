function! myspacevim#before() abort
  " neoformat
  " format on save
  autocmd BufWritePre *.js Neoformat

  " Enable alignment globally
  let g:neoformat_basic_format_align = 1

  " Enable tab to spaces conversion globally
  let g:neoformat_basic_format_retab = 1

  " Enable trimmming of trailing whitespace globally
  let g:neoformat_basic_format_trim = 1

  " js formatters
  let g:neoformat_enabled_typescriptreact = ['eslint', 'js-beautify', 'prettier']
endfunction

function! myspacevim#after() abort

endfunction
