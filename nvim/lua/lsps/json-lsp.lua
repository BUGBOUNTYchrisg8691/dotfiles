require'lspconfig'.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}

--[[
  Commands:
  
  Default Values:
    cmd = { "vscode-json-languageserver", "--stdio" }
    filetypes = { "json" }
    init_options = {
      provideFormatter = true
    }
    root_dir = root_pattern(".git", vim.fn.getcwd())
--]]
