return {
  {
    "sindrets/diffview.nvim",
    event = { "VeryLazy" },
    keys = {
      { "<leader>gm", "<cmd>DiffviewOpen<cr>", desc = "Diffview Mergetool" },
    },
  },
  {
    "romainl/vim-cool",
    event = { "VeryLazy" },
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },
}
