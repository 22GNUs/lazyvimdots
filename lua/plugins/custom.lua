return {
  -- add neoscroll
  {
    "karb94/neoscroll.nvim",
    enabled = not vim.g.neovide,
    -- load before BufRead, avoid loading impact on performance
    event = "VeryLazy",
    config = function()
      require("neoscroll").setup()
    end,
  },
  {
    "folke/zen-mode.nvim",
    -- not work in neovide for now
    enabled = not vim.g.neovide,
    event = "VeryLazy",
    keys = {
      -- Add a <C-n> remap to open neotree
      {
        "<leader>uz",
        function()
          require("zen-mode").toggle({
            window = {
              width = 0.75,
            },
          })
        end,
        desc = "Toggle Zen Mode",
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    ft = { "html", "css", "sass", "typescriptreact", "javascriptreact" },
    config = function()
      require("colorizer").setup({
        user_default_options = {
          css = true,
          tailwind = true,
        },
      })
    end,
  },
}
