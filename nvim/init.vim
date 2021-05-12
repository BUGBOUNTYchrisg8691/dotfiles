lua require "init"

" Lua LSP init
luafile $HOME/.config/nvim/lua/lsps/lua-lsp.lua
luafile $HOME/.config/nvim/lua/lsps/efm-lsp.lua

" Typescript/Javascript LSP init
luafile $HOME/.config/nvim/lua/lsps/ts-lsp.lua

" Python LSP init
luafile $HOME/.config/nvim/lua/lsps/python-lsp.lua

" Bash LSP init
luafile $HOME/.config/nvim/lua/lsps/bash-lsp.lua

" HTML LSP init
luafile $HOME/.config/nvim/lua/lsps/html-lsp.lua

" JSON LSP init
luafile $HOME/.config/nvim/lua/lsps/json-lsp.lua

" Vim LSP init
luafile $HOME/.config/nvim/lua/lsps/vim-lsp.lua

" yaml LSP init
luafile $HOME/.config/nvim/lua/lsps/yaml-lsp.lua

" set shell to zsh instead of fish
if &shell =~# 'fish$'
    set shell=zsh
endif

" Initialize plugin configs
source $HOME/.config/nvim/config/statusline.vim
source $HOME/.config/nvim/config/nerdtree-git-plugin.vim
source $HOME/.config/nvim/config/nerdtree-syntax-hl.vim
source $HOME/.config/nvim/config/nerdtree.vim
source $HOME/.config/nvim/config/ale.vim
source $HOME/.config/nvim/config/fugitive.vim
source $HOME/.config/nvim/config/gitgutter.vim
source $HOME/.config/nvim/config/treesitter.vim
source $HOME/.config/nvim/config/CtrlP.vim
source $HOME/.config/nvim/config/rainbow.vim
source $HOME/.config/nvim/config/multi-cursor.vim
source $HOME/.config/nvim/config/fzf.vim
source $HOME/.config/nvim/config/ctags.vim

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
  endif
