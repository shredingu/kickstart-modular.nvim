vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldlevel = 1
vim.o.foldlevelstart = 1
vim.o.foldopen = 'all'
vim.o.foldclose = 'all'
vim.wo.foldcolumn = 'auto:2'
vim.wo.foldminlines = 2
vim.wo.foldnestmax = 2

vim.api.nvim_create_autocmd('BufRead', {
  callback = function()
    vim.api.nvim_create_autocmd('BufWinEnter', {
      once = true,
      command = 'normal! zx',
    })
  end,
})
