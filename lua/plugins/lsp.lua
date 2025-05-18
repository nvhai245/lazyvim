return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- will be automatically installed with mason and loaded with lspconfig
      html = {},
      cssls = {},
    },
    inlay_hints = { enabled = false },
  },
}
