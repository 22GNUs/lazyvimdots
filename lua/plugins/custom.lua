return {
  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    lazy = true,
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },
}
