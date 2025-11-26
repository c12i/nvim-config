-- Root configurations
-- Docs: https://www.lunarvim.org/docs/configuration

-- Theme and colorscheme settings
lvim.colorscheme = "gruvbox"
vim.o.background = "dark" -- "light" or "dark"

-- Other general settings
vim.opt.relativenumber = true
lvim.format_on_save.enabled = true
lvim.builtin.cmp.enabled = true -- Enable auto-completion
lvim.builtin.nvimtree.setup.view.width = 35
lvim.builtin.lualine.sections.lualine_a = { -- Show mode in status line
	{ "mode", color = { gui = "bold" } },
}
-- Foldclose
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr" -- alts: "syntax" or "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- ensure the SSH agent env var is available
vim.env.SSH_AUTH_SOCK = os.getenv("SSH_AUTH_SOCK")
vim.env.SSH_AGENT_PID = os.getenv("SSH_AGENT_PID")

-- Optimizations for larger codebases
lvim.reload_config_on_save = false
lvim.builtin.nvimtree.setup.filters.custom = {
	"node_modules",
	".git",
	"dist",
	"build",
	"target",
}

-- XXX: Setting this breaks light mode
-- lvim.transparent_window = true

-- Simple spellchecking
-- https://neovim.io/doc/user/spell.html
vim.opt.spell = true
vim.opt.spelllang = { "en" }

-- Disable spell check for specific filetypes/buftypes
vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
	pattern = "*",
	callback = function()
		local disabled_spell = {
			-- Filetypes
			["NvimTree"] = true,
			["fugitive"] = true,
			["gitcommit"] = true,
			["TelescopePrompt"] = true,

			-- Buftypes
			["prompt"] = true,
			["nofile"] = true,
			["help"] = true,
			["quickfix"] = true,
			["terminal"] = true,
		}

		if disabled_spell[vim.bo.filetype] or disabled_spell[vim.bo.buftype] then
			vim.opt_local.spell = false
		end
	end,
})

-- Plugin management
require("user.plugins")

-- Keybindings
require("user.keymaps")

-- LSP and formatting
require("user.lsp")

-- Custom Telescope configuration
require("user.telescope").setup()

-- language specific LSP configurations
require("user.lsp-config.bash").setup()
require("user.lsp-config.dockerfile").setup()
require("user.lsp-config.go").setup()
require("user.lsp-config.hbs").setup()
require("user.lsp-config.html").setup()
require("user.lsp-config.json").setup()
require("user.lsp-config.lua").setup()
require("user.lsp-config.markdown").setup()
require("user.lsp-config.nix").setup()
require("user.lsp-config.prisma").setup()
require("user.lsp-config.python").setup()
require("user.lsp-config.rust").setup()
require("user.lsp-config.sql").setup()
require("user.lsp-config.svelte").setup()
require("user.lsp-config.terraform").setup()
require("user.lsp-config.toml").setup()
require("user.lsp-config.typescript").setup()
require("user.lsp-config.vimscript").setup()
require("user.lsp-config.vue").setup()
require("user.lsp-config.yaml").setup()
