-- TypeScript development
return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact", "mjs" },
    config = function()
      require("typescript-tools").setup({
        on_attach = function(client, bufnr)
          if _G.lsp_on_attach then
            _G.lsp_on_attach(client, bufnr)
          end

          local opts = { buffer = bufnr, noremap = true, silent = true }

          -- Go to source definition
          vim.keymap.set(
            "n",
            "gd",
            "<cmd>TSToolsGoToSourceDefinition<CR>",
            vim.tbl_extend("force", opts, { desc = "Go to source def" })
          )

          -- Import keymaps
          vim.keymap.set(
            "n",
            "<leader>oi",
            "<cmd>TSToolsOrganizeImports<CR>",
            vim.tbl_extend("force", opts, { desc = "Organize Imports" })
          )
          vim.keymap.set(
            "n",
            "<leader>ai",
            "<cmd>TSToolsAddMissingImports<CR>",
            vim.tbl_extend("force", opts, { desc = "Add Missing Imports" })
          )
          vim.keymap.set(
            "n",
            "<leader>ru",
            "<cmd>TSToolsRemoveUnused<CR>",
            vim.tbl_extend("force", opts, { desc = "Remove Unused Imports" })
          )
          vim.keymap.set(
            "n",
            "<leader>rf",
            "<cmd>TSToolsRenameFile<CR>",
            vim.tbl_extend("force", opts, { desc = "Rename File" })
          )
          vim.keymap.set(
            "n",
            "<leader>fi",
            "<cmd>TSToolsFileReferences<CR>",
            vim.tbl_extend("force", opts, { desc = "File References" })
          )
        end,
        settings = {
          expose_as_code_action = { "fix_all", "add_missing_imports", "remove_unused", "organize_imports" },
          tsserver_plugins = {},
          complete_function_calls = true,
          include_completions_with_insert_text = true,
          separate_diagnostic_server = true,
          tsserver_file_preferences = {
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
            includeCompletionsWithSnippetText = true,
            includeAutomaticOptionalChainCompletions = true,
            includeCompletionsWithInsertText = true,
            importModuleSpecifierPreference = "relative",
            allowIncompleteCompletions = true,
          },
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
