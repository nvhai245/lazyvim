return {
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "lawrence-laz/neotest-zig", -- Installation
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
    end,
  },
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
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
        ██╗  ██╗ █████╗ ██╗    ███╗   ██╗ ██████╗ ██╗   ██╗██╗   ██╗███████╗███╗   ██╗          Z
        ██║  ██║██╔══██╗██║    ████╗  ██║██╔════╝ ██║   ██║╚██╗ ██╔╝██╔════╝████╗  ██║      Z    
        ███████║███████║██║    ██╔██╗ ██║██║  ███╗██║   ██║ ╚████╔╝ █████╗  ██╔██╗ ██║   z       
        ██╔══██║██╔══██║██║    ██║╚██╗██║██║   ██║██║   ██║  ╚██╔╝  ██╔══╝  ██║╚██╗██║ z         
        ██║  ██║██║  ██║██║    ██║ ╚████║╚██████╔╝╚██████╔╝   ██║   ███████╗██║ ╚████║           
        ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝    ╚═╝  ╚═══╝ ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝╚═╝  ╚═══╝           
]],
        },
      },
      lazygit = {
        -- your lazygit configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        theme = {
          selectedLineBgColor = { bg = "CursorColumn" }, -- set to `default` to have no background colour
        },
      },
    },
  },
}
