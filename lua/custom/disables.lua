-- disable builtin plugins
local disabled_plugins = {
  --    "2html_plugin",
  --    "getscript",
  --    "getscriptPlugin",
  --    "gzip",
  --    "logipat",
  --    "matchit",
  --    "matchparen",
  --    "netrw",
  --    "netrwFileHandlers",
  --    "netrwPlugin",
  --    "netrwSettings",
  --    "rrhelper",
  --    "spec",
  --    "spellfile_plugin",
  --    "tar",
  --    "tarPlugin",
  --    "vimball",
  --    "vimballPlugin",
  --    "zip",
  --    "zipPlugin"
}

for _, plugin in ipairs(disabled_plugins) do
  vim.g['loaded_' .. plugin] = 1
end
