return {
  'kelly-lin/ranger.nvim',
  config = function()
    require('ranger-nvim').setup {
      replace_netrw = true,
      enable_cmds = true,
      ui = {
        border = 'rounded',
        width = 0.8,
        height = 0.8,
      },
    }
    vim.api.nvim_set_keymap('n', '<leader><leader>', '', {
      noremap = true,
      callback = function()
        require('ranger-nvim').open(true)
      end,
    })
  end,
}
