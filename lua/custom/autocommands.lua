-- Probably this stuff is not needed
--vim.api.nvim_create_augroup('cdpwd', {clear = true})
--vim.api.nvim_create_autocmd('VimEnter', { group = 'cdpwd', pattern = '*', command = 'cd $PWD'})
vim.cmd [[

 augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end
  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end
  ]]

-- vim.api.nvim_create_augroup("my_formating", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = "my_formating",
--     pattern = "*",
--     command = "lua vim.lsp.buf.format()",
-- })
