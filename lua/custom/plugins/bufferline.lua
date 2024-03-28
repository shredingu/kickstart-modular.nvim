return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',

    config = function()
      local bufferline = require 'bufferline'
      bufferline.setup {
        options = {
          mode = 'buffers',
          offsets = {
            { filetype = 'netrw' },
          },
        },
        highlights = {
          indicator_selected = {
            fg = { attribute = 'fg', highlight = 'Function' },
            italic = false,
          },
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
