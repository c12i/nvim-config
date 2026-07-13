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
          side = "left",
          signcolumn = "yes",
        },
        actions = {
          open_file = {
            resize_window = true,
          },
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
          enable = false,
        },
        update_focused_file = {
          enable = true,
        },
        git = {
          enable = true,
          ignore = false,
        },
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          -- Default mappings
          api.config.mappings.default_on_attach(bufnr)

          -- Custom hjkl mappings
          vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
          vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
          vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
          vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
        end,
      })
    end,
  },
}
