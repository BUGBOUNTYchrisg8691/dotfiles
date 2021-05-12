" Path completion with custom source command
inoremap <expr> <C-f><C-z> fzf#vim#complete#path('fd')
inoremap <expr> <C-f><C-z> fzf#vim#complete#path('rg --files')

" Word completion with custom spec with popup layout option
inoremap <expr> <C-f><C-z>fzw fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
