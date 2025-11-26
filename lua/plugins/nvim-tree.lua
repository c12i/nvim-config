-- File explorer
return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 35,
        },
        filters = {
          custom = {
            "node_modules",
            ".git",
            "dist",
            "build",
            "target",
          },
        },
        renderer = {
          group_empty = true,
          icons = {
            show = {
              git = true,
              folder = true,
              file = true,
              folder_arrow = true,
            },
          },
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
        update_focused_file = {
          enable = true,
        },
        git = {
          enable = true,
          ignore = false,
        },
      })
    end,
  },
}

