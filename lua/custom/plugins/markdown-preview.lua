return {
  -- Install markdown preview, use npx if available.
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function(plugin)
    if vim.fn.executable 'npx' then
      vim.cmd('!cd ' .. plugin.dir .. ' && cd app && npx --yes yarn install')
    else
      vim.cmd [[Lazy load markdown-preview.nvim]]
      vim.fn['mkdp#util#install']()
    end
  end,
  init = function()
    if vim.fn.executable 'npx' then
      vim.g.mkdp_filetypes = { 'markdown' }
    end
  end,
  config = function()
    vim.g.mkdp_auto_start = 1
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_preview_options = {
      -- mkit = {},
      -- katex = {},
      -- uml = {},
      disable_sync_scroll = 0,
      sync_scroll_type = 'middle',
      -- hide_yaml_meta = 1,
      -- sequence_diagrams = {},
      -- flowchart_diagrams = {},
    }
    -- vim.g.mkdp_combine_preview = 1
  end,
}
