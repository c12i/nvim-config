-- Project management
return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern", "lsp" },
        patterns = { ".git", "Makefile", "package.json", "Cargo.toml", "go.mod", ".project" },
        show_hidden = false,
        silent_chdir = true,
        scope_chdir = "global",
      })

      -- Integrate with telescope
      require("telescope").load_extension("projects")

      -- project.nvim only chdir's when it finds a project root (.git, Makefile, etc).
      -- Outside of a recognized project it leaves the (global) cwd untouched, which
      -- can leave it pointed at an unrelated directory. Fall back to scoping the
      -- cwd to the current buffer's own directory in that case.
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          if vim.bo.buftype ~= "" then
            return
          end
          local root = require("project_nvim.project").get_project_root()
          if root == nil then
            local dir = vim.fn.expand("%:p:h")
            if dir ~= "" and vim.fn.isdirectory(dir) == 1 then
              vim.cmd("lcd " .. vim.fn.fnameescape(dir))
            end
          end
        end,
      })
    end,
  },
}
