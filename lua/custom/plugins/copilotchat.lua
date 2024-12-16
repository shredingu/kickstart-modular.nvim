return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
      {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
        -- dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
        ft = { 'markdown', 'copilot-chat' },
      },
      -- })
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = function()
      local user = vim.env.USER or 'User'
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        auto_insert_mode = true,
        question_header = '  ' .. user .. ' ',
        answer_header = '  Copilot ',
        window = {
          width = 0.4,
        },
        mappings = {
          complete = {
            insert = '<Tab>',
          },
          close = {
            normal = 'q',
            insert = '<C-q>',
          },
          reset = {
            normal = '<C-l>',
            insert = '<C-l>',
          },
          submit_prompt = {
            normal = '<CR>',
            insert = '<C-s>',
          },
          toggle_sticky = {
            detail = 'Makes line under cursor sticky or deletes sticky line.',
            normal = 'gr',
          },
          accept_diff = {
            normal = '<C-y>',
            insert = '<C-y>',
          },
          jump_to_diff = {
            normal = 'gj',
          },
          quickfix_diffs = {
            normal = 'gq',
          },
          yank_diff = {
            normal = 'gy',
            register = '"',
          },
          show_diff = {
            normal = 'gd',
          },
          show_info = {
            normal = 'gi',
          },
          show_context = {
            normal = 'gc',
          },
          show_help = {
            normal = 'gh',
          },
        },
        -- highlight_headers = false,
        -- separator = '---',
        -- error_header = '> [!ERROR] Error',
      }
    end,
    config = function(_, opts)
      local chat = require 'CopilotChat'

      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = 'copilot-chat',
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })

      chat.setup(opts)
    end,
    -- highlight_headers = false,
    -- separator = '---',
    -- error_header = '> [!ERROR] Error',
    -- See Configuration section for options
    -- See Commands section for default commands if you want to lazy load on them
  },
}
