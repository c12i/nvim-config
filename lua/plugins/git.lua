-- Git integration
return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiff", "Gblame" },
    keys = {
      { "<leader>gt", "<cmd>Git<CR>", desc = "Git status" },
      { "<leader>gp", "<cmd>Git push<CR>", desc = "Git push" },
      { "<leader>Gf", "<cmd>Git fetch<CR>", desc = "Git fetch" },
      { "<leader>Gr", ":Git rebase", desc = "Git rebase" },
      { "<leader>Gm", ":Git merge", desc = "Git merge" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]h", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, { expr = true, desc = "Next hunk" })

          map("n", "[h", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, { expr = true, desc = "Prev hunk" })

          -- Actions
          map("n", "<leader>ghs", gs.stage_hunk, { desc = "Stage hunk" })
          map("n", "<leader>ghr", gs.reset_hunk, { desc = "Reset hunk" })
          map("n", "<leader>ghp", gs.preview_hunk, { desc = "Preview hunk" })
          map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, { desc = "Blame line" })
        end,
      })
    end,
  },
  {
    "ruifm/gitlinker.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
      { "<leader>gy", function() require("gitlinker").get_buf_range_url("n") end, desc = "Copy git link" },
    },
    config = function()
      require("gitlinker").setup()
    end,
  },
}

