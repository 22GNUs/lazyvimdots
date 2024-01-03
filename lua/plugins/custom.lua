return {
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
