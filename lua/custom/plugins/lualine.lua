return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    vim.opt.showmode = false
  end,
  config = function()
    require('lualine').setup {
      options = {
        theme = 'tokyonight',
        -- uncomment for nvim to display intro page this is a mysterious bug
        -- https://github.com/nvim-lualine/lualine.nvim/issues/983
        -- section_separators = '' ,
      },
    }
  end,
}
