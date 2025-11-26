-- Keymap util
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Vim fuGITive keymaps
lvim.keys.normal_mode["<leader>gt"] = ":Git<CR>"
lvim.keys.normal_mode["<leader>gp"] = ":Git push<CR>"
lvim.keys.normal_mode["<leader>Gf"] = ":Git fetch<CR>"
lvim.keys.normal_mode["<leader>Gr"] = ":Git rebase"
lvim.keys.normal_mode["<leader>Gm"] = ":Git merge"

-- Telescope keymaps
lvim.keys.normal_mode["<leader>fb"] = ":Telescope buffers<CR>"
lvim.keys.normal_mode["<leader>fh"] = ":Telescope help_tags<CR>"

-- Spectre keymaps
map("n", "<c-s>", "<cmd>lua require('spectre').toggle()<CR>", { desc = "Toggle Spectre" })

-- foldclose keymaps
lvim.keys.normal_mode["<leader>z"] = ":foldclose<CR>"
lvim.keys.normal_mode["<leader>zz"] = ":foldopen<CR>"

-- undotree keymaps
lvim.keys.normal_mode["<leader>U"] = ":UndotreeToggle<CR>"

-- Todo keymaps
lvim.keys.normal_mode["<leader>tt"] = ":TodoTelescope<CR>"
lvim.keys.normal_mode["<leader>tl"] = ":TodoLocList<CR>"

-- Glow markdown preview keymaps
lvim.keys.normal_mode["<leader>md"] = ":Glow<CR>"

-- noautocmd save
lvim.keys.normal_mode["<leader>W"] = ":noautocmd w<CR>"

-- Toggle Background
lvim.keys.normal_mode["<leader>tb"] = ":lua vim.o.background = vim.o.background == 'dark' and 'light' or 'dark'<CR>"

-- Toggle relative number
lvim.keys.normal_mode["<leader>tn"] = ":lua vim.o.relativenumber = not vim.o.relativenumber<CR>"

-- Toggle inlay hints
lvim.keys.normal_mode["<leader>th"] = ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>"

-- Minimap
lvim.keys.normal_mode["<leader>mm"] = ":MinimapToggle<CR>"

-- TSToolsOrganizeImports
lvim.keys.normal_mode["<leader>ti"] = ":TSToolsOrganizeImports<CR>"

-- Vsplit toggle
lvim.keys.normal_mode["<leader>sv"] = function()
	local wins = vim.api.nvim_tabpage_list_wins(0)
	if #wins == 1 then
		vim.cmd("vsplit")
	else
		vim.cmd("close")
	end
end

-- Claude code
lvim.keys.normal_mode["<leader>ac"] = ":ClaudeCode<CR>"
