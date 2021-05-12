local install_path = os.getenv("HOME") .. "/.local/share/nvim/site/pack/packer/start/packer.nvim"

-- Bootstrapping packer.nvim
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	local plugin_repo = "https://github.com/wbthomason/packer.nvim"
	local cli = string.format("!git clone %s %s", plugin_repo, install_path)
	vim.cmd(cli)
end

vim.cmd "packadd packer.nvim"
local packer = require "packer"

packer.startup(function(use)
  -- Package Manager manages itself
	use { "wbthomason/packer.nvim", opt = false }

  -- Sane Default settings
  use "tpope/vim-sensible"

  -- Colorscheme
	use "lifepillar/vim-gruvbox8"

  -- IDE-like utilities
	use "jiangmiao/auto-pairs"
  use "tpope/vim-surround"
  use "tpope/vim-commentary"
  use "tpope/vim-repeat"
  use "frazrepo/vim-rainbow"
  use "terryma/vim-multiple-cursors"
  -- File Searching
  use "ctrlpvim/ctrlp.vim"
  use { "junegunn/fzf.vim", requires = { "junegunn/fzf", run = function() vim.fn["fzf#install()"]() end }}
  use "mileszs/ack.vim"
  use "webastien/vim-ctags"

	-- Native NeoVim LSP
	use "neovim/nvim-lspconfig"
	use "hrsh7th/nvim-compe"
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use "hrsh7th/vim-vsnip"
	use "norcalli/snippets.nvim"

	-- Fish Script utilities
	use "dag/vim-fish"

  -- Statusline
  use "itchyny/lightline.vim"

  -- Linters/Fixers
  use "dense-analysis/ale"

  -- Git Integration
  use "tpope/vim-fugitive"
  use "airblade/vim-gitgutter"

  -- File Explorer and addons
  use "preservim/nerdtree"
  -- use "Xuyuanp/nerdtree-git-plugin"
  use "ryanoasis/vim-devicons"
  use "tiagofumo/vim-nerdtree-syntax-highlight"
  use "scrooloose/nerdtree-project-plugin"
  use "PhilRunninger/nerdtree-buffer-ops"
  use "PhilRunninger/nerdtree-visual-selection"

  -- Web Development
  use "mxw/vim-jsx"
  use "MaxMEllon/vim-jsx-pretty"
  use "HerringtonDarkholme/yats.vim"
end)
