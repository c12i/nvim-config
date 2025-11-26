-- TypeScript development
return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    config = function()
      require("typescript-tools").setup({
        on_attach = function(client, bufnr)
          -- Use global on_attach if available
          if _G.lsp_on_attach then
            _G.lsp_on_attach(client, bufnr)
          end

          -- Override gd for TypeScript
          vim.keymap.set(
            "n",
            "gd",
            "<cmd>TSToolsGoToSourceDefinition<CR>",
            { buffer = bufnr, desc = "Go to source def" }
          )

          -- Organize imports
          vim.keymap.set("n", "<leader>oi", "<cmd>TSToolsOrganizeImports<CR>", {
            buffer = bufnr,
            noremap = true,
            silent = true,
            desc = "Organize Imports",
          })

          -- TSTools keymaps
          vim.keymap.set("n", "<leader>ti", "<cmd>TSToolsOrganizeImports<CR>", {
            buffer = bufnr,
            desc = "TS Organize Imports",
          })
        end,
        settings = {
          expose_as_code_action = { "organize_imports", "remove_unused" },
          tsserver_plugins = {},
          complete_function_calls = true,
          separate_diagnostic_server = true,
        },
      })
    end,
  },
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = "json",
    config = function()
      require("package-info").setup()
    end,
  },
}

