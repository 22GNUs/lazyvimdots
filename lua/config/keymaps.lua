-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- bind <C-c> to <ESC> in insert mode
vim.keymap.set("i", "jk", "<ESC>", { silent = true })
vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { silent = true })
vim.keymap.set("t", "jj", "<C-\\><C-n>", { silent = true })
vim.keymap.set("i", "<C-c>", "<Nop>", { silent = true })

-- buffers
if Util.has("bufferline.nvim") then
  map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
end

if vim.g.vscode then
  map("n", "<S-Tab>", "<cmd>Tabprevious<cr>", { desc = "Prev tab" })
  map("n", "<Tab>", "<cmd>Tabnext<cr>", { desc = "Next tab" })
end
