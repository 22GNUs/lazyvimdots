return {
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "static",
      render = "compact",
      fps = 5,
      level = 1,
      timeout = 2000,
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
      },
    },
  },
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        -- change help to vimdoc
        "vimdoc",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["o"] = "open",
        },
      },
    },
    keys = {
      -- Add a <C-n> remap to open neotree
      { "<C-n>", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      jdtls = {
        handlers = {
          -- see: https://www.reddit.com/r/neovim/comments/1172p03/jdtls_spams_messages_in_lazyvim/
          -- disable progress update
          -- ["language/status"] = function(_, result)
          -- print(result)
          -- end,
          ["$/progress"] = function(_, result, ctx)
            -- disable progress updates.
          end,
        },
      },
      root_dir = function(_)
        -- override the root_dir look up to support multi module project
        return require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" })
      end,
      full_cmd = function(opts)
        local fname = vim.api.nvim_buf_get_name(0)
        local root_dir = opts.root_dir(fname)
        local project_name = opts.project_name(root_dir)
        local cmd = vim.deepcopy(opts.cmd)
        if project_name then
          vim.list_extend(cmd, {
            "-configuration",
            opts.jdtls_config_dir(project_name),
            "-data",
            opts.jdtls_workspace_dir(project_name),
          })
        end

        -- support lombok
        local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
        local jvmArg = "-javaagent:" .. install_path .. "/lombok.jar"
        table.insert(cmd, "--jvm-arg=" .. jvmArg)
        return cmd
      end,
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        java = { "google-java-format" },
      },
      formatters = {
        ["google-java-format"] = {
          prepend_args = { "--aosp" },
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        winblend = vim.g.winblend,
      },
    },
  },
}
