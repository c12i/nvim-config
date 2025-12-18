-- Luacheck configuration for Neovim config
std = "luajit"
cache = true

-- Global objects defined by Neovim (writable)
globals = {
  "vim",
}

-- Ignore warnings
ignore = {
  "631", -- Line is too long
  "212", -- Unused argument (common in callbacks)
  "122", -- Setting read-only field (vim.opt, vim.g are meant to be set)
}

-- Exclude specific paths
exclude_files = {
  ".git/",
  "plugin/",
  ".luarocks/",
}
