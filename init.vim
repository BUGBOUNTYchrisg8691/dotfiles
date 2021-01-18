" Title: Neovim Configration
" Last Modified Date:  2021 Jan 18
" Maintained By:  Christopher Girvin
  " Email: <chrisg8691@gmail.com>
  " Github: <github.com/bugbounty.chrisg8691>

if &compatible
	set nocompatible
endif

call plug#begin('~/.config/nvim/plugs')
	" Sensible Vim Settings
	Plug 'tpope/vim-sensible'

	" Colorscheme
	Plug 'sainnhe/gruvbox-material'

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

  " Other TPope plugins
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  

  call plug#end()

filetype plugin indent on
syntax enable

highlight ColorColumn ctermbg=lightgray
set colorcolumn=80

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
"let backspace='indent,eol,start'
set backspace=2
set autoindent

set showmatch
set cursorline
set autowrite
set wildmenu
set lazyredraw

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

" escape
nnoremap <leader>x <ESC>

" Unfold
nnoremap <leader>fo za

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

" Sneak
map <leader>s <Plug>Sneak_s
map <leader>S <Plug>Sneak_S
map <leader>f <Plug>Sneak_f
map <leader>F <Plug>Sneak_F
map <leader>t <Plug>Sneak_t
map <leader>T <Plug>Sneak_T

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

" V m-Multiple-Cursors
let g:VM_mouse_mappings = 1
" nmap   <C-LeftMouse>         <Plug>(VM-Mouse-Cursor)
" nmap   <C-RightMouse>        <Plug>(VM-Mouse-Word)  
" nmap   <M-C-RightMouse>      <Plug>(VM-Mouse-Column)

" NERDTree
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

" NERDTree Settings
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

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
