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
          program = "${workspaceFolder}/zig-out/bin/${fileBasenameNoExtension}",
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }
    end,
  },
}
