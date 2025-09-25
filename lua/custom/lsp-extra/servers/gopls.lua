return {
  settings = {
    gopls = {
      buildFlags = {
        '-tags=mock',
      },
      -- analyses = {
      --   unusedparams = true,
      -- },
      -- staticcheck = true,
      -- gofumpt = true,
    },
  },
}
