return {
  {
    "snacks.nvim",
    opts = {
      -- disable snacks words highlight
      words = { enabled = false },
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
    keys = {
      {
        "<leader>e",
        function()
          Snacks.explorer.open({ focus = "list", follow_file = true, ignored = true, hidden = true })
        end,
        desc = "Explorer Snacks (root dir)",
      },
    },
  },
}
