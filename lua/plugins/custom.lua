return {
  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    lazy = true,
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },
  -- ChatGPT
  {
    "jackMort/ChatGPT.nvim",
    lazy = true,
    cmd = { "ChatGPT", "ChatGPTRun", "ChatGPTActAs", "ChatGPTCompleteCode", "ChatGPTEditWithInstructions" },
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = function()
      return {
        {
          "<leader>ce",
          function()
            require("chatgpt").edit_with_instructions()
          end,
          desc = "Edit with chatgpt instructions",
          mode = "v",
        },
      }
    end,
  },
  -- add neoscroll
  {
    "karb94/neoscroll.nvim",
    lazy = true,
    enabled = not vim.g.neovide,
    -- load before BufRead, avoid loading impact on performance
    event = "VeryLazy",
    config = function()
      require("neoscroll").setup()
    end,
  },
}
