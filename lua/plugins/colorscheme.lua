return {
  {
    "slugbyte/lackluster.nvim",
    config = function()
      require("lackluster").setup({
        disable_plugin = {
          bufferline = true,
        },
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- Change the background of lualine sections
      table.insert(opts.options, { theme = "lackluster" })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "lackluster-night",
    },
  },
}
