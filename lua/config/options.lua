-- Options configuration
-- Migrated from LunarVim config.lua

local opt = vim.opt

-- Theme
vim.o.background = "dark" -- "light" or "dark"

-- Line numbers
opt.relativenumber = true
opt.number = true

-- Folding
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Spellchecking
opt.spell = true
opt.spelllang = { "en" }

-- General settings
opt.termguicolors = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.showmode = false
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Split behavior
opt.splitbelow = true
opt.splitright = true

-- Backup/swap
opt.backup = false
opt.swapfile = false
opt.undofile = true

-- Update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- SSH agent env vars
vim.env.SSH_AUTH_SOCK = os.getenv("SSH_AUTH_SOCK")
vim.env.SSH_AGENT_PID = os.getenv("SSH_AGENT_PID")

