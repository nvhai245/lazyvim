return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- will be automatically installed with mason and loaded with lspconfig
      superhtml = {},
    },
    inlay_hints = { enabled = false },
  },
}
