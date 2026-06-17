-- Session persistence (auto-restore buffers/layout per project directory)
return {
  {
    "folke/persistence.nvim",
    -- Load eagerly (not on an event) so the auto-restore below runs
    -- deterministically as part of startup, before the user can type anything -
    -- an event-based lazy load races against `nvim` being launched and quit
    -- immediately (e.g. scripted), missing the restore/save window.
    lazy = false,
    keys = {
      {
        "<leader>Ss",
        function()
          require("persistence").load()
        end,
        desc = "Restore session for cwd",
      },
      {
        "<leader>Sl",
        function()
          require("persistence").load({ last = true })
        end,
        desc = "Restore last session",
      },
      {
        "<leader>Sd",
        function()
          require("persistence").stop()
        end,
        desc = "Don't save current session",
      },
    },
    config = function()
      require("persistence").setup()

      -- Auto-restore the session when nvim is opened with no file arguments
      -- (e.g. zellij re-launching a bare `nvim` in a resurrected pane).
      if vim.fn.argc() == 0 then
        require("persistence").load()
      end
    end,
  },
}
