local M = {}

-- get home dir ($HOME)
local function get_homedir()
  return os.getenv 'HOME'
end
M.get_homedir = get_homedir

-- binds for keymaps
local function bind(op, outer_opts)
  outer_opts = outer_opts or { noremap = true }
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend('force', outer_opts, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
  end
end
M.nmap = bind('n', { noremap = false })
M.nnoremap = bind 'n'
M.vnoremap = bind 'v'
M.xnoremap = bind 'x'
M.inoremap = bind 'i'

return M
