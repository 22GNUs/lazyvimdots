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
  {
    "folke/zen-mode.nvim",
    keys = {
      -- Add a <C-n> remap to open neotree
      {
        "<leader>uz",
        function()
          require("zen-mode").toggle({
            window = {
              width = 0.85, -- width will be 85% of the editor width
            },
          })
        end,
        desc = "Toggle Zen Mode",
      },
    },
  },
}
