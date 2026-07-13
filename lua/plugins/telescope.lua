-- Fuzzy finder
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      -- Find
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
      {
        "<leader>fF",
        function()
          require("telescope.builtin").find_files({
            hidden = true,
            no_ignore = true,
          })
        end,
        desc = "Find all files (incl. hidden/ignored)",
      },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
      { "<leader>fn", "<cmd>enew<cr>", desc = "New File" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },

      -- Search
      { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Resume" },

      -- Git
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")

      -- Split-specific file finding
      vim.keymap.set("n", "<leader>fv", function()
        builtin.find_files({
          attach_mappings = function(_, map)
            map("i", "<CR>", require("telescope.actions").file_vsplit)
            map("n", "<CR>", require("telescope.actions").file_vsplit)
            return true
          end,
        })
      end, { desc = "Find files → vsplit" })

      vim.keymap.set("n", "<leader>fs", function()
        builtin.find_files({
          attach_mappings = function(_, map)
            map("i", "<CR>", require("telescope.actions").file_split)
            map("n", "<CR>", require("telescope.actions").file_split)
            return true
          end,
        })
      end, { desc = "Find files → split" })

      telescope.setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "truncate" },
          file_ignore_patterns = { ".git/", "node_modules", "target", "dist", "build" },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-c>"] = actions.close,
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })

      -- Load extensions
      pcall(telescope.load_extension, "fzf")
    end,
  },
}
