return {
  'nvim-treesitter/nvim-treesitter-context',
  lazy = true,
  main = 'treesitter-context',
  opts = {
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 2, -- How many lines the window should span. Values <= 0 mean no limit.
    line_numbers = true,
    -- show_all_context = true,
    -- patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    --   -- For all filetypes
    --   -- Note that setting an entry here replaces all other patterns for this entry.
    --   -- By setting the 'default' entry below, you can control which nodes you want to
    --   -- appear in the context window.
    --   default = {
    --     'function',
    --     'method',
    --     'for',
    --     'while',
    --     'if',
    --     'switch',
    --     'case',
    --   },
    --
    --   rust = {
    --     'loop_expression',
    --     'impl_item',
    --   },
    --
    --   typescript = {
    --     'class_declaration',
    --     'abstract_class_declaration',
    --     'else_clause',
    --   },
    -- },
  },
  -- config = function()
  --   require('nvim-treesitter.configs').setup {
  --   }
  -- end,
}