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
      { "<leader>tU", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
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
      {
        "<C-s>",
        function()
          require("spectre").toggle()
        end,
        desc = "Toggle Spectre",
      },
      {
        "<leader>sw",
        function()
          require("spectre").open_visual({ select_word = true })
        end,
        desc = "Search word",
      },
    },
    config = function()
      require("spectre").setup()
    end,
  },

  -- TODO comments
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
      { "<leader>tm", "<cmd>MinimapToggle<CR>", desc = "Toggle Minimap" },
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

  -- Spellchecking
  {
    "ravibrock/spellwarn.nvim",
    event = "VeryLazy",
    config = true,
  },

  -- Commenting
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        toggler = {
          line = "<leader>/",
          block = "<leader>?",
        },
        opleader = {
          line = "<leader>/",
          block = "<leader>?",
        },
      })
    end,
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-/>", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle terminal", mode = { "n", "t" } },
      { "<C-\\>", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal", mode = { "n", "t" } },
    },
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
        },
      })

      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<C-Space>", [[<C-\><C-n>]], opts)
        -- vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      end

      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,
  },
}
