-- Keymaps configuration
-- Migrated from LunarVim lua/user/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize windows with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<leader>c", ":bdelete<CR>", { desc = "Close buffer" })

-- Move lines up/down
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Clear search highlight
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear highlight" })

-- Save file
map("n", "<leader>w", ":w<CR>", { desc = "Save" })
map("n", "<leader>W", ":noautocmd w<CR>", { desc = "Save without autocmd" })

-- Quit
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Vim fuGITive keymaps
map("n", "<leader>gt", ":Git<CR>", { desc = "Git status" })
map("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
map("n", "<leader>Gf", ":Git fetch<CR>", { desc = "Git fetch" })
map("n", "<leader>Gr", ":Git rebase", { desc = "Git rebase" })
map("n", "<leader>Gm", ":Git merge", { desc = "Git merge" })

-- Foldclose keymaps
map("n", "<leader>z", ":foldclose<CR>", { desc = "Fold close" })
map("n", "<leader>zz", ":foldopen<CR>", { desc = "Fold open" })

-- Toggle background
map("n", "<leader>tb", ":lua vim.o.background = vim.o.background == 'dark' and 'light' or 'dark'<CR>", { desc = "Toggle background" })

-- Toggle relative number
map("n", "<leader>tn", ":lua vim.o.relativenumber = not vim.o.relativenumber<CR>", { desc = "Toggle relative number" })

-- Toggle inlay hints
map("n", "<leader>th", ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", { desc = "Toggle inlay hints" })

-- Vsplit toggle
map("n", "<leader>sv", function()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  if #wins == 1 then
    vim.cmd("vsplit")
  else
    vim.cmd("close")
  end
end, { desc = "Toggle vsplit" })

-- Better paste (don't replace register)
map("v", "p", '"_dP', opts)

-- Center cursor after scroll
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

