-- Yank/clipboard history manager, backed by the clipy daemon
-- (requires `clipy watch` running -- `cargo install clipy`)
return {
  {
    "c12i/nvim-clipy",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      {
        "<leader>sy",
        function()
          require("nvim-clipy.telescope").pick()
        end,
        desc = "Clipboard history",
      },
    },
    config = function()
      require("nvim-clipy").setup()
    end,
  },
}
