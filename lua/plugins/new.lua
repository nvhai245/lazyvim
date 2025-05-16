return {
  {
    "julianolf/nvim-dap-lldb",
    ft = { "zig", "c" },
    dependencies = {
      { "mfussenegger/nvim-dap" },
      {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "codelldb" } },
      },
    },
    config = function(_, opts)
      local dap = require("dap")

      -- configure codelldb adapter
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = "codelldb",
          args = { "--port", "${port}" },
        },
      }

      -- setup a debugger config for zig projects
      dap.configurations.zig = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/zig-out/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = { "VeryLazy" },
    keys = {
      { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Diffview Mergetool" },
    },
  },
  {
    "romainl/vim-cool",
    event = { "VeryLazy" },
  },
}
