local M = {}

function M.setup(_opts)
  -- _opts is reserved for future configuration options

  -- Setup LSP if lspconfig is available
  local lsp_ok, lsp = pcall(require, 'lumos.lsp')
  if lsp_ok then
    lsp.setup()
  end

  -- Setup Tree-sitter if available
  local ok, ts_configs = pcall(require, 'nvim-treesitter.configs')
  if ok then
    ts_configs.setup({
      ensure_installed = { 'lumos' },
      highlight = { enable = true },
    })
  end
end

return M
