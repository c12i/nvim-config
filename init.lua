-- Neovim Configuration
-- Migrated from LunarVim

-- Set leader key before lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set terminal title to current directory
vim.opt.title = true
vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')}"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load core configuration
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Load plugins with lazy.nvim
require("lazy").setup("plugins", {
  install = {
    colorscheme = { "gruvbox" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

-- Set colorscheme after plugins are loaded
vim.cmd.colorscheme("gruvbox")
