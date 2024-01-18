return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_virt_text_output = true
    end,
    keys = {
      {
        mode = { "n" },
        "<leader>mi",
        "<cmd>MoltenInit<CR>",
        silent = true,
        desc = "Initialize the plugin",
      },
      {
        mode = { "n" },
        "<leader>me",
        "<cmd>MoltenEvaluateOperator<CR>",
        silent = true,
        desc = "Run operator selection",
      },
      {
        mode = { "n" },
        "<leader>mrl",
        "<cmd>MoltenEvaluateLine<CR>",
        silent = true,
        desc = "Evaluate line",
      },
      {
        mode = { "n" },
        "<leader>mrr",
        "<cmd>MoltenReevaluateCell<CR>",
        silent = true,
        desc = "Re-evaluate cell",
      },
      {
        mode = { "v" },
        "<leader>mr",
        ":<C-u>MoltenEvaluateVisual<CR>gv",
        silent = true,
        desc = "Evaluate visual selection",
      },
      {
        mode = { "n" },
        "<leader>mrd",
        "<cmd>MoltenDelete<CR>",
        silent = true,
        desc = "Delete cell",
      },
      {
        mode = { "n" },
        "<leader>moh",
        "<cmd>MoltenHideOutput<CR>",
        silent = true,
        desc = "Hide output",
      },
      {
        mode = { "n" },
        "<leader>mos",
        "<cmd>noautocmd MoltenEnterOutput<CR>",
        silent = true,
        desc = "Show/Enter output",
      },
    },
  },
  {
    -- see the image.nvim readme for more information about configuring this plugin
    "3rd/image.nvim",
    init = function()
      package.path = package.path
        .. ";"
        .. vim.fn.expand("$HOME")
        .. "/.luarocks/share/lua/5.1/?/init.lua;"
      package.path = package.path
        .. ";"
        .. vim.fn.expand("$HOME")
        .. "/.luarocks/share/lua/5.1/?.lua;"
    end,
    opts = {
      backend = "kitty", -- whatever backend you would like to use
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>m"] = { name = "Molten", mode = { "n", "v" } },
        ["<leader>mr"] = { name = "Run", mode = "n" },
        ["<leader>mo"] = { name = "Output", mode = "n" },
      },
    },
  },
}
