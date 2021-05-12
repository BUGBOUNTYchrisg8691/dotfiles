" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/chrisg/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/chrisg/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/chrisg/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/chrisg/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/chrisg/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["ack.vim"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/ack.vim"
  },
  ale = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["ctrlp.vim"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/ctrlp.vim"
  },
  fzf = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  nerdtree = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nerdtree-buffer-ops"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/nerdtree-buffer-ops"
  },
  ["nerdtree-project-plugin"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/nerdtree-project-plugin"
  },
  ["nerdtree-visual-selection"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/nerdtree-visual-selection"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["snippets.nvim"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/snippets.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-ctags"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/vim-ctags"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-fish"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/vim-fish"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-gruvbox8"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/vim-gruvbox8"
  },
  ["vim-jsx"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/vim-jsx"
  },
  ["vim-jsx-pretty"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/vim-jsx-pretty"
  },
  ["vim-multiple-cursors"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/vim-multiple-cursors"
  },
  ["vim-nerdtree-syntax-highlight"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/vim-nerdtree-syntax-highlight"
  },
  ["vim-rainbow"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/vim-rainbow"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/vim-sensible"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["yats.vim"] = {
    loaded = true,
    path = "/home/chrisg/.local/share/nvim/site/pack/packer/start/yats.vim"
  }
}

time("Defining packer_plugins", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
