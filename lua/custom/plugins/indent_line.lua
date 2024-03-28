return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufEnter',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      scope = { enabled = true, show_end = true, injected_languages = true },
      whitespace = { remove_blankline_trail = true },
    },
    init = function()
      vim.opt.list = true
      vim.opt.listchars:append 'eol:↴'
    end,
  },
}
