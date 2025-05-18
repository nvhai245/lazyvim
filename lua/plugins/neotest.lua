return {
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "lawrence-laz/neotest-zig", -- Installation
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-zig")({
          dap = {
            adapter = "codelldb",
          },
        })
      )
      table.insert(opts, { log_level = vim.log.levels.TRACE })
    end,
  },
}
