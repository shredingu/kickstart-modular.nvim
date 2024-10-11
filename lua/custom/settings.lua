local utils = require 'custom.utils'

vim.opt.exrc = true
vim.opt.mouse = 'a'
vim.opt.guicursor = ''
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = utils.get_homedir() .. '/.config/undodir'
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = '80'
vim.opt.signcolumn = 'yes'
vim.g.mapleader = ' ' -- leader key is space
vim.opt.fillchars = { diff = '/' }
vim.opt.eol = true
vim.opt.fixeol = true
vim.opt.updatetime = 50

vim.g.loaded_node_provider = 1
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python_provider = 1

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30

-- required for nvim-ts-context-commentstring
vim.g.skip_ts_context_commentstring_module = true
