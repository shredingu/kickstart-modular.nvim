local null_ls = require 'null-ls'

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local stylua_extra_args = {
  -- '--indent-type',
  -- 'Spaces',
  -- '--column-width',
  -- '80',
}

local shfmt_extra_args = {
  '-i',
  '4',
}

local black_extra_args = {
  '-l',
  '80',
}

local golines_args = {
  '-m',
  '100',
}

null_ls.setup {
  sources = {
    -- formatting.cmake_format,
    -- diagnostics.cmake_lint,
    diagnostics.staticcheck.with {
      -- Turn all staticcheck diagnostics into warnings
      diagnostics_postprocess = function(diagnostic)
        diagnostic.severity = vim.diagnostic.severity.HINT
      end,
    },
    diagnostics.markdownlint,
    formatting.clang_format,
    formatting.markdownlint,
    formatting.stylua.with { extra_args = stylua_extra_args },
    formatting.shfmt.with { extra_args = shfmt_extra_args },
    formatting.black.with { extra_args = black_extra_args },
    formatting.golines.with { extra_args = golines_args },
  },
  debug = false,
}

require('mason-null-ls').setup {
  ensure_installed = nil,
  -- automatic_installation = true,
  automatic_installation = { exclude = { 'clang_format' } },
  automatic_setup = false,
}
