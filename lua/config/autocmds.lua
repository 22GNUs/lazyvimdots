-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Default "InsertLeave" is not working, delete it and rebinding "ModeChanged"
-- See: https://www.reddit.com/r/neovim/comments/um7p7u/nvim_nvimcmp_luasnip_jumps_to_previous_snippets/
-- See: https://github.com/L3MON4D3/LuaSnip/issues/258
-- vim.api.nvim_del_autocmd "InsertLeave"
vim.api.nvim_create_autocmd("ModeChanged", {
  callback = function()
    if
      ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
      and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})
