-- Editor enhancements
return {
  -- Motion
  {
    "ggandor/leap.nvim",
    name = "leap",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward" },
    },
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  -- Surround
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- Undo tree
  {
    "mbbill/undotree",
    keys = {
      { "<leader>U", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
    },
    config = function()
      vim.g.undotree_WindowLayout = 3
    end,
  },

  -- Search and replace
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<C-s>", function() require("spectre").toggle() end, desc = "Toggle Spectre" },
      { "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end, desc = "Search word" },
    },
    config = function()
      require("spectre").setup()
    end,
  },

  -- Todo comments
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<leader>tt", "<cmd>TodoTelescope<CR>", desc = "Todo Telescope" },
      { "<leader>tl", "<cmd>TodoLocList<CR>", desc = "Todo LocList" },
    },
    config = function()
      require("todo-comments").setup({})
    end,
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("ibl").setup({})
    end,
  },

  -- Highlight colors
  {
    "brenoprata10/nvim-highlight-colors",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-highlight-colors").setup({
        render = "virtual",
        enable_named_colors = false,
        enable_tailwind = true,
        virtual_symbol = "■",
        exclude_buftypes = {
          "nofile",
          "prompt",
          "quickfix",
          "terminal",
          "help",
          "fugitive",
          "nowrite",
        },
      })
    end,
  },

  -- Minimap
  {
    "wfxr/minimap.vim",
    build = "cargo install --locked code-minimap",
    keys = {
      { "<leader>mm", "<cmd>MinimapToggle<CR>", desc = "Toggle Minimap" },
    },
    config = function()
      vim.g.minimap_width = 10
      vim.g.minimap_auto_start = 1
      vim.g.minimap_auto_start_win_enter = 1
    end,
  },

  -- Markdown preview
  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    keys = {
      { "<leader>md", "<cmd>Glow<CR>", desc = "Markdown preview" },
    },
    config = true,
  },

  -- AI assistance
  {
    "greggh/claude-code.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<CR>", desc = "Claude Code" },
    },
    config = function()
      require("claude-code").setup()
    end,
  },
}

