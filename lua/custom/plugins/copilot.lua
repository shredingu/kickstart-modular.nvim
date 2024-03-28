return {
  'github/copilot.vim',
  dependencies = { 'catppuccin/nvim' },
  event = 'VimEnter',
  config = function()
    vim.keymap.set('i', '<C-s>', 'copilot#Accept("")', {
      expr = true,
      silent = true,
      replace_keycodes = false,
    })
    vim.keymap.set('i', '<C-j>', 'copilot#Next()', {
      expr = true,
      silent = true,
      replace_keycodes = false,
    })
    vim.keymap.set('i', '<A-rightarrow>', 'copilot#AcceptWord()', {
      expr = true,
      silent = true,
      replace_keycodes = false,
    })
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_workspace_folders = { vim.fn.getcwd() }

    local augroup = vim.api.nvim_create_augroup('CopilotColorScheme', { clear = true })
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = 'solarized',
      group = augroup,
      callback = function()
        vim.api.nvim_set_hl(0, 'CopilotSuggestion', {
          fg = '#555555',
          ctermfg = 8,
          force = true,
        })
      end,
    })
  end,
}
