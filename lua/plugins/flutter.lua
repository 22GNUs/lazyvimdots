return {
  -- flutter
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup({}) -- use defaults
    end,
  },
}
