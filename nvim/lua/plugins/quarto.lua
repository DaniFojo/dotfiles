return {

  -- this taps into vim.ui.select and vim.ui.input
  -- and in doing so currently breaks renaming in otter.nvim
  { "stevearc/dressing.nvim", enabled = false },
  {
    "quarto-dev/quarto-nvim",
    opts = {
      lspFeatures = {
        languages = { "python", "julia", "bash", "html", "lua" },
      },
      codeRunner = {
        enabled = true,
        default_method = "molten",
      },
    },
    ft = "quarto",
    keys = {
      {
        "<localleader>qc",
        "<cmd>lua require('quarto.runner').run_cell()<CR>",
        silent = true,
        desc = "Run cell",
      },
      {
        "<localleader>qa",
        "<cmd>lua require('quarto.runner').run_above()<CR>",
        silent = true,
        desc = "Run all cells above",
      },
      {
        "<localleader>qA",
        "<cmd>lua require('quarto.runner').run_all()<CR>",
        silent = true,
        desc = "Run all",
      },
      {
        "<localleader>qb",
        "<cmd>lua require('quarto.runner').run_below()<CR>",
        silent = true,
        desc = "Run all cells below",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<localleader>q"] = { name = "Quarto", mode = "n" },
      },
    },
  },
  {
    "jmbuhr/otter.nvim",
    opts = {
      buffers = {
        set_filetype = true,
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "jmbuhr/otter.nvim" },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(
        vim.list_extend(opts.sources, { { name = "otter" } })
      )
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      vim.list_extend(opts.servers, {
        marksman = {
          -- also needs:
          -- $home/.config/marksman/config.toml :
          -- [core]
          -- markdown.file_extensions = ["md", "markdown", "qmd"]
          filetypes = { "markdown", "quarto" },
          root_dir = require("lspconfig.util").root_pattern(
            ".git",
            ".marksman.toml",
            "_quarto.yml"
          ),
        },
      })
    end,
  },
}
