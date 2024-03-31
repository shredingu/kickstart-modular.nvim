local null_ls = require 'null-ls'

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

local stylua_extra_args = {
  '--indent-type',
  'Spaces',
  '--column-width',
  '80',
}

local shfmt_extra_args = {
  '-i',
  '4',
}

local black_extra_args = {
  '-l',
  '80',
}

null_ls.setup {
  sources = {
    -- formatting.cmake_format,
    -- diagnostics.cmake_lint,
    formatting.clang_format,
    formatting.stylua.with { extra_args = stylua_extra_args },
    formatting.shfmt.with { extra_args = shfmt_extra_args },
    formatting.black.with { extra_args = black_extra_args },
  },
  debug = false,
}

require('mason-null-ls').setup {
  ensure_installed = nil,
  -- automatic_installation = true,
  automatic_installation = { exclude = { 'clang_format' } },
  automatic_setup = false,
}
