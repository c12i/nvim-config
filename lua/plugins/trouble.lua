-- Better diagnostics UI
return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Trouble" },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
      { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      { "<leader>xr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP References (Trouble)" },
      { "gR", "<cmd>Trouble lsp_references<cr>", desc = "LSP References (Trouble)" },
      {
        "[x",
        function()
          require("trouble").prev({ skip_groups = true, jump = true })
        end,
        desc = "Prev Trouble Item",
      },
      {
        "]x",
        function()
          require("trouble").next({ skip_groups = true, jump = true })
        end,
        desc = "Next Trouble Item",
      },
    },
    opts = {
      auto_close = false,
      auto_preview = true,
      focus = true,
    },
  },
}
