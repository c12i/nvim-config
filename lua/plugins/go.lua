return {
  "fatih/vim-go",
  ft = "go",
  build = ":GoUpdateBinaries",
  config = function()
    vim.g.go_fmt_command = "goimports"
    vim.g.go_auto_type_info = 1
    vim.g.go_def_mapping_enabled = 0
  end,
}
