local lsp_extra_group = vim.api.nvim_create_augroup('custom.lsp-extra', { clear = true })

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      -- Do not use lua_ls and bashls for formating
      if client.name == 'lua_ls' then
        return false
      elseif client.name == 'bashls' then
        return false
      elseif client.name == 'clangd' then
        return false
      elseif client.name == 'gopls' then
        return false
      elseif client.name == 'null-ls' then
        return true
      else
        return true
      end
    end,
    bufnr = bufnr,
  }
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_extra_group,
  callback = function(ev)
    local client_id = ev.data.client_id
    local client = vim.lsp.get_client_by_id(client_id)
    if client.supports_method 'textDocument/formatting' then
      vim.api.nvim_clear_autocmds { group = lsp_extra_group, buffer = ev.buf }
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = lsp_extra_group,
        buffer = ev.buf,
        callback = function()
          lsp_formatting(ev.buf)
        end,
      })
    end
  end,
})

local lsp_signature_on_attach = function(client, bufnr)
  _ = client
  require('lsp_signature').on_attach({
    bind = true,
    fix_pos = true,
    floating_window = false,
    floating_window_off_x = 5,
    floating_window_off_y = function() -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
      -- local linenr = vim.api.nvim_win_get_cursor(0)[1] -- buf line number
      local pumheight = vim.o.pumheight
      local winline = vim.fn.winline() -- line number in the window
      local winheight = vim.fn.winheight(0)

      -- window top
      if winline - 1 < pumheight then
        return pumheight
      end

      -- window bottom
      if winheight - winline < pumheight then
        return -pumheight
      end
      return 0
    end,
    toggle_key = '<C-G>',
    hint_prefix = '📢 ',
    -- hint_prefix = "🔔 ",
    handler_opts = {
      border = 'rounded',
    },
  }, bufnr)
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_extra_group,
  callback = function(ev)
    local client_id = ev.data.client_id
    local client = vim.lsp.get_client_by_id(client_id)
    lsp_signature_on_attach(client, ev.buf)
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_extra_group,
  callback = function(ev)
    local client_id = ev.data.client_id
    local client = vim.lsp.get_client_by_id(client_id)
    if client.name == 'yamlls' then
      client.server_capabilities.documentFormattingProvider = true
    end
    -- if client.name == "cmake" then
    --     client.server_capabilities.documentFormattingProvider = true
    -- end
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach-extra', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('gl', require('telescope.builtin').diagnostics, '[G]oto Workspace diagnostics')
    -- map('<leader>lf', '<cmd>lua vim.lsp.buf.format{async = true}<cr>', '[L]sp [F]ormat')
    map('<leader>lf', function()
      lsp_formatting(event.buf)
    end, '[L]sp [F]ormat')

    map('<leader>li', '<cmd>LspInfo<cr>', '[L]sp [I]nfo')
    map('<leader>lj', '<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>', '[L]sp diagnostic next')
    map('<leader>lk', '<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>', '[L]sp diagnostic previous')
    map('<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', '[L]sp [S]ignature')
    map('<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', '[L]sp diagnostic loclist')
  end,
})
