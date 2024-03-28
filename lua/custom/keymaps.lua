local utils = require 'custom.utils'
local nnoremap = utils.nnoremap
local xnoremap = utils.xnoremap
local inoremap = utils.inoremap
local vnoremap = utils.vnoremap
local ff = require 'telescope.builtin'

-- map ctrl-c to ESC
inoremap('<C-c>', '<Esc>')
-- ignore these
nnoremap('x', '"_x') -- x will not interfer on copies
xnoremap('x', '"_x')

-- move selected lines in visual mode, this is awesome!
vnoremap('J', ":m '>+1<CR>gv=gv")
vnoremap('K', ":m '<-2<CR>gv=gv")

-- do not move cursor when using J
nnoremap('J', 'mzJ`z')

-- always center cursor when moving and searching
nnoremap('<C-d>', '<C-d>zz')
nnoremap('<C-u>', '<C-u>zz')
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')

xnoremap('<leader>p', '"_dP')

nnoremap('<leader>y', '"+y')
vnoremap('<leader>y', '"+y')
nnoremap('<leader>Y', '"+Y')
-- no key to Q
nnoremap('Q', '<nop>')

-- quickfix navigation
nnoremap('<C-k>', '<cmd>cnext<CR>zz')
nnoremap('<C-j>', '<cmd>cprev<CR>zz')
nnoremap('<leader>k', '<cmd>lnext<CR>zz')
nnoremap('<leader>j', '<cmd>lprev<CR>zz')

-- find and replace the current word
nnoremap('<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')
nnoremap('<leader>S', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gc<Left><Left><Left>')
-- vnoremap("<leader>s", ":s/\\%V<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>")
vnoremap('<leader>s', ':s/\\%V<C-r>"/<C-r>"/gI<Left><Left><Left>')
vnoremap('<leader>S', ':s/\\%V<C-r>"/<C-r>"/gc<Left><Left><Left>')

-- usefull keymaps
nnoremap('<leader>a', ':keepjumps normal! ggVG<cr>') -- select all!
-- nnoremap("<leader><leader>", "<cmd>Telescope file_browser<cr>") -- open explorer

nnoremap('<leader>ff', function()
  ff.find_files {
    find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
  }
end) -- open explorer
nnoremap('<leader>f?', function()
  ff.oldfiles { only_cwd = true }
end)
nnoremap('<leader>fg', ff.live_grep) -- open explorer
nnoremap('<leader>fb', ff.buffers) -- open explorer
nnoremap('<leader>fh', ff.help_tags) -- open explorer
nnoremap('<leader>fs', ff.treesitter) -- open explorer

-- git telescope
nnoremap('<leader>gb', ff.git_branches) -- open explorer

-- buffers navigation
nnoremap('<leader>n', '<cmd>bn<cr>') -- move to next buffer
nnoremap('<leader>p', '<cmd>bp<cr>') -- move to previous buffer
nnoremap('<leader>Q', '<cmd>bd<cr>') -- remove buffer
nnoremap('<leader>q', '<cmd>bp | sp | bn | bd<cr>') -- remove buffer

-- diffview
nnoremap('<leader>df', '<cmd>DiffviewOpen<cr>') -- open diffview
nnoremap('<leader>dq', '<cmd>DiffviewClose<cr>') -- open diffview

-- ChatGPTEdit
nnoremap('<leader>gp', '<cmd>:ChatGPTEditWithInstructions<cr>')

nnoremap('<leader>he', function()
  local filepath = utils.get_homedir() .. '/.config/nvim/lua/my/plugins/harpoon.lua'
  vim.cmd('vsp ' .. filepath)
end)
nnoremap('<leader>hk', function()
  local filepath = utils.get_homedir() .. '/.config/nvim/lua/my/keymaps.lua'
  vim.cmd('vsp ' .. filepath)
end)
nnoremap('<leader>hy', function()
  local filepath = utils.get_homedir() .. '/.config/nvim/lua/my/settings.lua'
  vim.cmd('vsp ' .. filepath)
end)

-- harpoon
local h_mark = require 'harpoon.mark'
local h_ui = require 'harpoon.ui'
local h_cmdui = require 'harpoon.cmd-ui'
local h_tmux = require 'harpoon.tmux'

nnoremap('<leader>hm', function()
  h_mark.add_file()
end)
nnoremap('<leader>hs', function()
  h_ui.toggle_quick_menu()
end)

nnoremap('<leader>hc', function()
  h_cmdui.toggle_quick_menu()
end)

nnoremap('<F7>', function()
  h_tmux.sendCommand(2, 1)
end)
nnoremap('<F8>', function()
  h_tmux.sendCommand(2, 2)
end)
nnoremap('<F9>', function()
  h_tmux.sendCommand(2, 3)
end)
