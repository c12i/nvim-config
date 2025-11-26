-- Dashboard/Start screen
return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Header
      dashboard.section.header.val = {
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡔⢉⣩⣶⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠎⣴⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⣵⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠊⠀⣯⢽⣿⢶⣤⣍⣙⣉⣽⡇⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣶⣶⣿⣿⣿⣄⣉⠁⢤⠭⢴⣇⣶⣦⣀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠒⠂⠀⢸⣿⣿⣿⣿⣧⡀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣀⣠⣴⣿⣿⣿⣿⣿⣿⣿⠄]],
        [[⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⡏⠀]],
        [[⠀⠀⡤⠴⠒⠈⠁⠀⢻⣿⣿⣿⣿⣿⣿⣿⠀⠈⠙⠋⠀⠀⠀⣿⣿⣿⣿⣿⠃⠀]],
        [[⠀⣸⠁⠀⠀⢤⡀⢀⡎⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⠀⠀]],
        [[⢠⠇⣠⣶⣿⣾⣿⠿⠇⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⠀⠀]],
        [[⢸⣾⣿⣿⣿⣿⡏⣶⣿⣿⣿⣿⣿⣿⣿⢳⣶⣤⣴⣶⣿⠻⣿⣿⣿⣿⣿⣿⣷⣤]],
        [[⠘⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⡿⠃⢰⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢹⡇⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡟]],
        [[⠀⣼⣿⣿⣿⣿⡿⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣇⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡇]],
        [[⣰⣿⣿⣿⣿⣿⠇⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⢻⣿⣿⣿⣿⣿⣿⡿⠀]],
        [[⢻⣿⣿⣿⣿⣿⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⢿⣿⣿⣿⣿⣿⠁⠀]],
        [[⠘⣿⣿⣿⣿⣿⡆⠀⠀⠀⢈⣿⣿⣿⣿⣿⣿⣿⣿⣇⡀⠀⣸⣿⣿⣿⣿⣿⡆⠀]],
        [[⢰⣿⣿⣿⣿⠿⡗⠄⠀⠀⣾⠛⠿⠻⢿⣿⠟⠹⡟⠛⠛⢸⠀⣄⠙⠋⠛⠛⠙⡆]],
        [[⠘⠒⠒⠒⠒⠒⠚⠉⠀⠀⠑⠒⠤⠤⠤⢄⣠⠜⠁⠀⠀⠈⠉⠛⠓⠤⠴⠋⠉⠁]],
      }

      -- Menu
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("p", "  Recent projects", ":Telescope projects <CR>"),
        dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
        dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
        dashboard.button("m", "  Mason", ":Mason<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }

      -- Footer
      local function footer()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        return "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
      end

      dashboard.section.footer.val = footer()
      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "Include"
      dashboard.section.buttons.opts.hl = "Keyword"

      dashboard.opts.opts.noautocmd = true
      alpha.setup(dashboard.opts)

      -- Update footer after lazy loads
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          dashboard.section.footer.val = footer()
          pcall(vim.cmd.AlphaRedraw)
        end,
      })

      -- Show alpha when opening a directory
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          local arg = vim.fn.argv(0)
          if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
            vim.cmd("bdelete")
            require("alpha").start()
          end
        end,
      })
    end,
  },
}
