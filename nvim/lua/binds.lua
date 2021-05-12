local keymapper = vim.api.nvim_set_keymap

local opts_silent_remap = { noremap = false, silent = true }
local opts_loud_remap = { noremap = false, silent = false }
local opts_silent_noremap = { noremap = true, silent = true }
local opts_loud_noremap = { noremap = true, silent = false }

-- Window/Buffer/Tab management
keymapper('n', "<leader>h", ":wincmd h<CR>", opts_silent_remap)
keymapper('n', "<leader>j", ":wincmd j<CR>", opts_silent_remap)
keymapper('n', "<leader>k", ":wincmd k<CR>", opts_silent_remap)
keymapper('n', "<leader>l", ":wincmd l<CR>", opts_silent_remap)
keymapper('n', "<leader>h", ":wincmd h<CR>", opts_silent_remap)
keymapper('n', "<leader>h", ":wincmd h<CR>", opts_silent_remap)
keymapper('n', "<leader>wv", ":vsp<CR>", opts_silent_noremap)
keymapper('n', "<leader>wh", ":sp<CR>", opts_silent_noremap)
keymapper('n', "<M-j>", ":resize +5<CR>", opts_silent_noremap)
keymapper('n', "<M-k>", ":resize -5<CR>", opts_silent_noremap)
keymapper('n', "<M-l>", ":vertical :resize +5<CR>", opts_silent_noremap)
keymapper('n', "<M-h>", ":vertical :resize -5<CR>", opts_silent_noremap)

-- NERDTree 
keymapper('n', "<leader>nf", ":NERDTreeFocus<CR>", opts_silent_noremap)
keymapper('n', "<leader>nt", ":NERDTreeToggle<CR>", opts_silent_noremap)

-- NERDTree Plugins
keymapper('n', "<leader>ns", ":NERDTreeProjectSave<space>", opts_loud_noremap)
keymapper('n', "<leader>nl", ":NERDTreeProjectLoad<space>", opts_loud_noremap)
keymapper('n', "<leader>nd", ":NERDTreeProjectRm<space>", opts_loud_noremap)
