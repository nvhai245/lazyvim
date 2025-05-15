return {
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    -- you can set set configuration options here
    config = function()
      vim.g.zenbones_darkness = "stark"
      vim.g.zenbones_transparent_background = true
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local custom_zenbones = require("lualine.themes.zenbones")
      -- Change the background of lualine sections
      custom_zenbones.normal.a.bg = "NONE"
      custom_zenbones.normal.b.bg = "NONE"
      custom_zenbones.normal.c.bg = "NONE"
      table.insert(opts.options, { theme = "zenbones" })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "zenbones",
    },
  },
}
