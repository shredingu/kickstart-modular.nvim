local M = {}

M.capabilities = function(capabilities)
  local cmp_nvim_lsp = require 'cmp_nvim_lsp'

  local def_cap = require('lspconfig').util.default_config.capabilities
  def_cap.textDocument.completion.completionItem.snippetSupport = true
  def_cap = cmp_nvim_lsp.default_capabilities(def_cap)
  capabilities = vim.tbl_deep_extend('force', def_cap, capabilities)

  return capabilities
end

return M
