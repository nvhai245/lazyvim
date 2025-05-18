return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "folke/snacks.nvim" },
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      local snacks = require("snacks")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        snacks.explorer.open({ focus = false, auto_close = true })
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
        snacks.explorer.open({ focus = "list", follow_file = true, ignored = true, hidden = true })
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  },
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
}
