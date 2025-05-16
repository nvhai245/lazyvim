-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#eeeeee" })
vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#eeeeee" })

-- autosave
local autocmd = vim.api.nvim_create_autocmd
autocmd({ "CmdlineEnter", "TabLeave", "TermOpen", "FocusLost", "TabNew", "WinNew" }, {
  pattern = "*",
  command = "wall",
})

-- open snacks explorer
autocmd({ "SessionLoadPost" }, {
  pattern = "*",
  command = "lua require('snacks').explorer.open({focus = 'list', follow_file = true, ignored = true, hidden = true})",
})
