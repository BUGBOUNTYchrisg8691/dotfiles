" Title: Neovim Configration
" Last Modified Date:  2021 Jan 18
" Maintained By:  Christopher Girvin
  " Email: <chrisg8691@gmail.com>
  " Github: <github.com/bugbounty.chrisg8691>

if &compatible
	set nocompatible
endif

call plug#begin('~/.config/nvim/plugs')
  " Vim Startify -- Start Menu
  Plug 'mhinz/vim-startify'

	" Sensible Vim Settings
	Plug 'tpope/vim-sensible'

	" Colorscheme
	Plug 'sainnhe/gruvbox-material'

  " Syntax Highlighting
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'yuezk/vim-js'
  Plug 'vim-python/python-syntax'

  " Statusline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Motion
  Plug 'vim-scripts/quick-scope'
  Plug 'justinmk/vim-sneak'

  " Autoclose bracket/quote pairs
	Plug 'jiangmiao/auto-pairs'

  " Sublime-like multi-selection editing
  Plug 'mg979/vim-visual-multi', { 'branch': 'master' }

	" Source Code Searching
	Plug 'mileszs/ack.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Web Searching
  Plug 'rajasegar/vim-search-web'

  " CTag management
	Plug 'ludovicchabant/vim-gutentags'

  " Tagbar
  Plug 'preservim/tagbar'

  " Filetree
  Plug 'preservim/nerdtree' |
          \ Plug 'Xuyuanp/nerdtree-git-plugin' |
          \ Plug 'ryanoasis/vim-devicons' |
          \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
          \ Plug 'scrooloose/nerdtree-project-plugin' |
          \ Plug 'PhilRunninger/nerdtree-visual-selection'

  " Git Integration
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Other TPope plugins
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'

  " Built-in LSP client
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'

  " Completion
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Python
  " Plug 'deoplete-plugins/deoplete-jedi'
  " YouCompleteMe for TS/JS
  " Plug 'ycm-core/YouCompleteMe'
  " Conquer of Completion for everything else(besides lua, maybe?)
  Plug 'neoclide/coc.nvim'
  Plug 'dense-analysis/ale'

  " TypeScript/JavaScript
  Plug 'leafgarland/typescript-vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'prettier/vim-prettier', {
        \ 'do': 'npm install',
        \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'mlaursen/vim-react-snippets'

  " Rust
  Plug 'rust-lang/rust.vim'
  Plug 'cespare/vim-toml'

  " Markdown live preview
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

  " NVim GDB
  Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }

  " CPP syntax highlighting
  Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

filetype plugin indent on
syntax enable

highlight ColorColumn ctermbg=lightgray
set colorcolumn=80
set noshowmode

colorscheme gruvbox-material

set number relativenumber
set hlsearch incsearch ignorecase smartcase
set autowrite
set autoindent
set confirm
set history=20
set spell
set nowrap

set noswapfile nobackup nowritebackup undofile
set undodir=~/.config/nvim/undo

set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set smarttab
set backspace=indent,eol,start
set backspace=2
set autoindent

set showmatch
set cursorline
set autowrite
set wildmenu
set lazyredraw

set splitbelow splitright

set shortmess=a
set mouse=a

" Folding
" set foldenable
" set foldlevelstart=0
" set foldnestmax=10
" set foldmethod=indent

" Starts the cursor from where you last left off in the file
augroup vimSaveCursorPosition
  au!
  au BufReadPost * if line("'\"") | execute("normal `\"") | endif

" Keybindings
let mapleader=" "

" Fix Backspace
" func Backspace()
"   if col('.') == 1
"     if line('.')  != 1
"       return  "\<ESC>Dk$p\<S-J>i"
"     else
"       return ""
"     endif
"   else
"     return "\<Left>\<Del>"
"   endif
" endfunc
" inoremap <BS> <c-r>=Backspace()<CR>

" escape
" nnoremap <leader>x <ESC>

" Unfold
" nnoremap <leader>fo za

" Toggle line wrap
nmap <silent><leader>z :set nowrap!<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

" Window/Buffer Management
nnoremap <silent> <leader>wv :vsp<CR>
nnoremap <silent> <leader>wh :sp<CR>

nnoremap <silent> <M-l> :vertical :resize -5<CR>
nnoremap <silent> <M-r> :vertical :resize +5<CR>
nnoremap <silent> <M-t> :resize +5<CR>
nnoremap <silent> <M-w> :resize -5<CR>

" Switch Buffers
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k

" Open Terminal
nnoremap <silent> <leader>to :sp term://zsh <bar> :resize 10<CR>a

" CPP Debugging
" Compile code
"
" Open CGDB
nnoremap <silent> <leader>gd :vsp term://zsh -c cgdb<CR>a

" Open UndoTree

" Sneak
map <leader>s <Plug>Sneak_s
map <leader>S <Plug>Sneak_S
map <leader>f <Plug>Sneak_f
map <leader>F <Plug>Sneak_F
map <leader>t <Plug>Sneak_t
map <leader>T <Plug>Sneak_T

" Python Syntax Highlighting
let g:python_highlight_all = 1

" Deoplete
" Use deoplete.
" let g:deoplete#enable_at_startup = 0
" Jedi
" let g:python3_host_prog = '/usr/bin/python3'

" Quick Scope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Highlighting Colors
let g:qs_first_occurrence_highlight_color = 155
let g:qs_second_occurrence_highlight_color = 81
" Move across wrapped lines like regular lines
" Go to the first non-blank character of a line
noremap 0 ^
" Just in case you need to go to the very beginning of a line
noremap ^ 0

" Vm-Multiple-Cursors
let g:VM_mouse_mappings = 1
" nmap   <C-LeftMouse>         <Plug>(VM-Mouse-Cursor)
" nmap   <C-RightMouse>        <Plug>(VM-Mouse-Word)
" nmap   <M-C-RightMouse>      <Plug>(VM-Mouse-Column)

" NERDTree
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" TagBar
nmap <F8> :TagbarToggle<CR>

" Ack
cnoreabbrev Ack Ack!
nnoremap <C-a> :Ack!<Space>

" Fallback on Ack
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" FZF Settings
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Hide Statusline
"autocmd! FileType fzf set laststatus=0 noshowmode noruler
"  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Custom Statusline
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Other Statusline
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox_material'

" CtrlP Settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore', 'package.json']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
if executable('rg')
  let g:ctrlp_user_command = 'rg --files %s'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_switch_buffer = 'et'
elseif executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
endif

" Python3 Neovim Virtual Environment
let g:python3_host_prog = '/usr/bin/python3'

" Filetype Settings
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" Fugitive Statusline Integration
set statusline+=%{FugitiveStatusline()}

" GitGutter
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

" NERDTree Settings
" Start NERDTree. If a file is specified, move the cursor to its window.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Sneak Settings
" label-mode
let g:sneak#label = 1

" GitGutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" LSP Settings

" Completion Settings
" fun! GoDeoplete()
"   autocmd VimEnter deoplete#initialize()
"   autocmd VimEnter deoplete#enable()
"   " Jedi
"   let g:python3_host_prog = '/usr/bin/python3'
" endfun

" fun! GoLSP()
"   lua require'lspconfig'.tsserver.setup{}
" endfun

" autocmd FileType python :call GoDeoplete()
" autocmd FileType typescript,javascript :call GoLSP()
"
" lua require'pyright'.setup{}
"
" YouCompleteMe Settings and Helper Functions
" let g:ycm_autoclose_preview_window_after_insertion = 0
" let g:ycm_filetype_whitelist = {
"   \ "javascript": 1,
"   \ "typescript": 1
"   \ }

" let g:ycm_filetype_blacklist = {
"       \ 'tagbar': 1,
"       \ 'notes': 1,
"       \ 'markdown': 1,
"       \ 'netrw': 1,
"       \ 'unite': 1,
"       \ 'text': 1,
"       \ 'vimwiki': 1,
"       \ 'pandoc': 1,
"       \ 'infolog': 1,
"       \ 'leaderf': 1,
"       \ 'mail': 1
"       \ }

" let g:ycm_filetype_specific_completion_to_disable = {
"       \ 'gitcommit': 1
"       \ }

" let completeopt = 'menuone,preview,noinsert'

" fun! GoYCM()
"   nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
"   nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
"   nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
"   nmap <leader>h <plug>(YCMHover)
" endfun

" CoC Settings and Helper Functions
" TextEdit might fail if hidden is not set.
let g:coc_global_extensions = ['coc-json', 'coc-git']
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

fun! GoCoc()
  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <buffer> <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <buffer> <silent><expr> <c-space> coc#refresh()
  else
    inoremap <buffer> <silent><expr> <c-@> coc#refresh()
  endif

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <buffer> <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <buffer> <silent> <leader>[g <Plug>(coc-diagnostic-prev)
  nmap <buffer> <silent> <leader>]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <buffer> <silent> <leader>gd <Plug>(coc-definition)
  nmap <buffer> <silent> <leader>gy <Plug>(coc-type-definition)
  nmap <buffer> <silent> <leader>gi <Plug>(coc-implementation)
  nmap <buffer> <silent> <leader>gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <buffer> <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <buffer> <leader>rr <Plug>(coc-rename)

  " Formatting selected code.
  xmap <buffer> <leader>cf <Plug>(coc-format-selected)
  nmap <buffer> <leader>cf  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <buffer> <leader>a  <Plug>(coc-codeaction-selected)
  nmap <buffer> <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <buffer> <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <buffer> <leader>qf  <Plug>(coc-fix-current)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap <buffer> if <Plug>(coc-funcobj-i)
  omap <buffer> if <Plug>(coc-funcobj-i)
  xmap <buffer> af <Plug>(coc-funcobj-a)
  omap <buffer> af <Plug>(coc-funcobj-a)
  xmap <buffer> ic <Plug>(coc-classobj-i)
  omap <buffer> ic <Plug>(coc-classobj-i)
  xmap <buffer> ac <Plug>(coc-classobj-a)
  omap <buffer> ac <Plug>(coc-classobj-a)

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <buffer> <silent><nowait><expr> <A-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <buffer> <silent><nowait><expr> <A-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <buffer> <silent><nowait><expr> <A-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <buffer> <silent><nowait><expr> <A-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <buffer> <silent><nowait><expr> <A-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <buffer> <silent><nowait><expr> <A-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of language server.
  nmap <buffer> <silent> <C-s> <Plug>(coc-range-select)
  xmap <buffer> <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings for CoCList
  " Show all diagnostics.
  nnoremap <buffer> <silent><nowait> <A-a>  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <buffer> <silent><nowait> <A-e>  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <buffer> <silent><nowait> <A-c>  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <buffer> <silent><nowait> <A-o>  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <buffer> <silent><nowait> <A-s>  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <buffer> <silent><nowait> <A-j>  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <buffer> <silent><nowait> <A-k>  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <buffer> <silent><nowait> <A-p>  :<C-u>CocListResume<CR>

  " Restart CoC
  nnoremap <buffer> <leader>cr :CocRestart
endfun

" Lua LSP Settings
" fun! GoLsp()
"   source $HOME/.config/nvim/lua/mylualspconfig.lua
"   lua require 'mylualspconfig'
"   lua require'lspconfig'.sumneko_lua.setup{}
" endfun

fun! TrimWhiteSpace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhiteSpace()
autocmd FileType * :call GoCoc()
" autocmd FileType typescript,javascript :call GoYCM()
" autocmd FileType lua :call GoLsp()
"
" Ale Settings
let g:ale_linters = {
  \ 'python': ['pylint', 'pyright', 'flake8'],
  \ 'c': ['clang'],
  \ 'cpp': ['clang']
  \ }

let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'javascript': ['eslint', 'prettier'],
  \   'rust': ['rustfmt'],
  \   'python': ['black', 'isort'],
  \   'cpp': ['clang-format'],
  \   'c': ['clang-format']
  \ }
" set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 0
let g:ale_completion_autoimport = 0
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1
" let g:ale_sign_error = '✗'
let g:ale_sign_error = ''
let g:ale_sign_warning = ' '

inoremap <silent><expr><TAB>
    \ pumvisible() ? “\<C-n>” : “\<TAB>”
" nmap <silent> <YOUR PREFERRED KEY HERE> :ALEGoToDefinition<CR>
" nmap <silent> <YOUR PREFERRED KEY HERE> :ALEFindReferences<CR>
" nmap <silent> <YOUR PREFERRED KEY HERE> <Plug>(ale_previous_wrap)
" nmap <silent> <YOUR PREFERRED KEY HERE> <Plug>(ale_next_wrap)

" iamcco Markdown live preview config
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'firefox'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = '5555'

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" Vim Startify config
" session storage path
let g:startify_session_dir = '~/.config/nvim/sessions'
" persist on save or new session
let g:startify_session_persistenc = 1

" Vim Startify Bookmarks
let g:startify_bookmarks = [
  \ '~/.zshrc',
  \ '~/.config/nvim/init.vim',
  \ '~/.config/alacritty/alacritty.yml'
  \ ]

" Custom Vim Startify header
let g:startify_custom_header = [
  \ '          _____                    _____                   _______                   _____                    _____                    _____',
  \ '         /\    \                  /\    \                 /##\    \                 /\    \                  /\    \                  /\    \',
  \ '        /##\____\                /##\    \               /####\    \               /##\____\                /##\    \                /##\____\',
  \ '       /####|   |               /####\    \             /######\    \             /###/    /                \###\    \              /####|   |',
  \ '      /#####|   |              /######\    \           /########\    \           /###/    /                  \###\    \            /#####|   |',
  \ '     /######|   |             /###/\###\    \         /###/~~\###\    \         /###/    /                    \###\    \          /######|   |',
  \ '    /###/|##|   |            /###/__\###\    \       /###/    \###\    \       /###/____/                      \###\    \        /###/|##|   |',
  \ '   /###/ |##|   |           /####\   \###\    \     /###/    / \###\    \      |##|    |                       /####\    \      /###/ |##|   |',
  \ '  /###/  |##|   | _____    /######\   \###\    \   /###/____/   \###\____\     |##|    |     _____    ____    /######\    \    /###/  |##|___|______',
  \ ' /###/   |##|   |/\    \  /###/\###\   \###\    \ |###|    |     |###|    |    |##|    |    /\    \  /\   \  /###/\###\    \  /###/   |########\    \',
  \ '/## /    |##|   /##\____\/###/__\###\   \###\____\|###|____|     |###|    |    |##|    |   /##\____\/##\   \/###/  \###\____\/###/    |#########\____\',
  \ '\##/    /|##|  /###/    /\###\   \###\   \##/    / \###\    \   /###/    /     |##|    |  /###/    /\###\  /###/    \##/    /\##/    / ~~~~~/###/    /',
  \ ' \/____/ |##| /###/    /  \###\   \###\   \/____/   \###\    \ /###/    /      |##|    | /###/    /  \###\/###/    / \/____/  \/____/      /###/    /',
  \ '         |##|/###/    /    \###\   \###\    \        \###\    /###/    /       |##|____|/###/    /    \######/    /                       /###/    /',
  \ '         |######/    /      \###\   \###\____\        \###\__/###/    /        |###########/    /      \####/____/                       /###/    /',
  \ '         |#####/    /        \###\   \##/    /         \########/    /         \##########/____/        \###\    \                      /###/    /',
  \ '         |####/    /          \###\   \/____/           \######/    /           ~~~~~~~~~~               \###\    \                    /###/    /',
  \ '         /###/    /            \###\    \                \####/    /                                      \###\    \                  /###/    /',
  \ '        /###/    /              \###\____\                \##/____/                                        \###\____\                /###/    /',
  \ '        \##/    /                \##/    /                 ~~                                               \##/    /                \##/    /',
  \ '         \/____/                  \/____/                                                                    \/____/                  \/____/',
  \ ]

" start with nerdtree and vim-startify
autocmd VimEnter *
  \ if !argc()
  \ | Startify
  \ | NERDTree
  \ | wincmd w
  \ | endif

" Save recent files
" set viminfo='100,n$HOME/.config/nvim/files/info/nviminfo'

" Vim Startify Colorscheme
" hi StartifyBracket ctermfg=240
" hi StartifyFile    ctermfg=147
" hi StartifyFooter  ctermfg=240
" hi StartifyHeader  ctermfg=114
" hi StartifyNumber  ctermfg=215
" hi StartifyPath    ctermfg=245
" hi StartifySlash   ctermfg=240
" hi StartifySpecial ctermfg=240

" Vim Startify bindings
nnoremap <silent><leader>vs :SLoad<CR>
nnoremap <silent><leader>vl :SSave<CR>
nnoremap <silent><leader>vd :SDelete<CR>
nnoremap <silent><leader>vc :SClose<CR>
nnoremap <silent><leader>vo :Startify<CR>

" nvim gdb
" let g:loaded_nvimgdb = 1

" We're going to define single-letter keymaps, so don't try to define them
" in the terminal window.  The debugger CLI should continue accepting text commands.
function! NvimGdbNoTKeymaps()
  tnoremap <silent> <buffer> <esc> <c-\><c-n>
endfunction

let g:nvimgdb_config_override = {
  \ 'key_next': 'n',
  \ 'key_step': 's',
  \ 'key_finish': 'f',
  \ 'key_continue': 'c',
  \ 'key_until': 'u',
  \ 'key_breakpoint': 'b',
  \ 'set_tkeymaps': "NvimGdbNoTKeymaps",
  \ }

" Mapping	    Command	                            Description
" <Leader>dd	:GdbStart gdb -q ./a.out	          Start debugging session, allows editing the launching command
" <Leader>dl	:GdbStartLLDB lldb ./a.out	        Start debugging session, allows editing the launching command
" <Leader>dp	:GdbStartPDB python -m pdb main.py	Start Python debugging session, allows editing the launching command
" <Leader>db	:GdbStartBashDB bashdb main.sh	    Start BASH debugging session, allows editing the launching command
" <F8>	      :GdbBreakpointToggle	              Toggle breakpoint in the coursor line
" <F4>	      :GdbUntil	                          Continue execution until a given line (until in gdb)
" <F5>	      :GdbContinue	                      Continue execution (continue in gdb)
" <F10>	      :GdbNext	                          Step over the next statement (next in gdb)
" <F11>	      :GdbStep	                          Step into the next statement (step in gdb)
" <F12>	      :GdbFinish	                        Step out the current frame (finish in gdb)
" <c-p>	      :GdbFrameUp	                        Navigate one frame up (up in gdb)
" <c-n>	      :GdbFrameDown	                      Navigate one frame down (down in gdb)

" CPP syntax highlighting
" Optional features
" Highlighting of class scope is disabled by default. To enable set
" let g:cpp_class_scope_highlight = 1

" Highlighting of member variables is disabled by default. To enable set
" let g:cpp_member_variable_highlight = 1

" Highlighting of class names in declarations is disabled by default. To enable set
" let g:cpp_class_decl_highlight = 1

" Highlighting of POSIX functions is disabled by default. To enable set
" let g:cpp_posix_standard = 1

" There are two ways to highlight template functions. Either
" let g:cpp_experimental_simple_template_highlight = 1
"
" which works in most cases, but can be a little slow on large files. Alternatively set
" let g:cpp_experimental_template_highlight = 1
"
" which is a faster implementation but has some corner cases where it doesn't work.
" Note: C++ template syntax is notoriously difficult to parse, so don't expect this feature to be perfect.

" Highlighting of library concepts is enabled by
" let g:cpp_concepts_highlight = 1
"
" This will highlight the keywords concept and requires as well as all named requirements (like DefaultConstructible) in the standard library.

" Highlighting of user defined functions can be disabled by
let g:cpp_no_function_highlight = 1
