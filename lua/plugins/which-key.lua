-- Keybinding hints
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      wk.setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = true,
            suggestions = 20,
          },
        },
        win = {
          border = "rounded",
        },
      })

      -- Register groups
      wk.add({
        { "<leader>f", group = "Find" },
        { "<leader>s", group = "Search" },
        { "<leader>g", group = "Git" },
        { "<leader>G", group = "Git (more)" },
        { "<leader>l", group = "LSP" },
        { "<leader>t", group = "Toggle" },
        { "<leader>b", group = "Buffer" },
        { "<leader>x", group = "Trouble" },
        { "<leader>S", group = "Session" },
        { "<leader>R", group = "Resize" },
      })
    end,
  },
}
