-- Treesitter configuration
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
      "andymass/vim-matchup",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "css",
          "dockerfile",
          "go",
          "graphql",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "nix",
          "prisma",
          "python",
          "rust",
          "scss",
          "sql",
          "svelte",
          "terraform",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "vue",
          "yaml",
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        matchup = { enable = true },
        fold = { enable = true }
      })

      -- Treesitter context
      require("treesitter-context").setup({})
    end,
  },
}
