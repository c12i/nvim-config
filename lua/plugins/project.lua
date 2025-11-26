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
    end,
  },
}
