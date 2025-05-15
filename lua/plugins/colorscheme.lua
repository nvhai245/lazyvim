return {
  {
    "nvhai245/eyes.nvim",
    config = function()
      require("eyes").setup({
        extend = {
          highlights = {
            Normal = { fg = "#D0D0D0" },
            CursorLine = { bg = "#202020" },
            Type = { italic = true },
          },
          palette = {
            hex00 = "#000000",
            hex01 = "#101010",
            hex02 = "#505050",
            hex03 = "#606060",
            hex04 = "#404040", -- commments
            hex05 = "#808080",
            hex06 = "#606060", -- keywords and brackets
            hex07 = "#505050", -- lib
            hex08 = "#F0F0F0", -- string
            hex09 = "#C0C0C0", -- functions
            hex10 = "#D0D0D0",
          },
        },
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "eyes",
    },
  },
}
