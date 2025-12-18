-- Autocommands configuration
-- Migrated from LunarVim config.lua

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Disable spell check for specific filetypes/buftypes
augroup("DisableSpell", { clear = true })
autocmd({ "FileType", "BufEnter" }, {
  group = "DisableSpell",
  pattern = "*",
  callback = function()
    local disabled_spell = {
      -- Filetypes
      ["NvimTree"] = true,
      ["fugitive"] = true,
      ["gitcommit"] = true,
      ["TelescopePrompt"] = true,
      ["lazy"] = true,
      ["mason"] = true,
      ["json"] = true,

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

-- Highlight on yank
augroup("HighlightYank", { clear = true })
autocmd("TextYankPost", {
  group = "HighlightYank",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Resize splits on window resize
augroup("ResizeSplits", { clear = true })
autocmd("VimResized", {
  group = "ResizeSplits",
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Close certain filetypes with <q>
augroup("CloseWithQ", { clear = true })
autocmd("FileType", {
  group = "CloseWithQ",
  pattern = {
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Auto create parent directories when saving
augroup("AutoCreateDir", { clear = true })
autocmd("BufWritePre", {
  group = "AutoCreateDir",
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Open nvim-tree when opening a directory
augroup("NvimTreeOpenOnDir", { clear = true })
autocmd("VimEnter", {
  group = "NvimTreeOpenOnDir",
  callback = function(data)
    local directory = vim.fn.isdirectory(data.file) == 1
    if directory then
      vim.cmd.cd(data.file)
      require("nvim-tree.api").tree.open()
    end
  end,
})
