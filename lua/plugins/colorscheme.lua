return {
  {
    "slugbyte/lackluster.nvim",
    config = function()
      local lackluster = require("lackluster")
      local color = lackluster.color
      lackluster.setup({
        disable_plugin = {
          bufferline = true,
        },
        tweak_background = {
          normal = color.black, -- main background
          -- normal = 'none',    -- transparent
          -- normal = '#a1b2c3',    -- hexcode
          -- normal = color.green,    -- lackluster color
          telescope = color.black, -- telescope
          menu = color.gray2, -- nvim_cmp, wildmenu ... (bad idea to transparent)
          popup = color.black, -- lazy, mason, whichkey ... (bad idea to transparent)
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
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "lackluster-night",
    },
  },
}
