-- LSP Configuration with Mason
return {
  -- Mason: LSP server installer
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- nvim-lspconfig + mason-lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "b0o/schemastore.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- On attach function
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, opts)
        vim.keymap.set("n", "<leader>lf", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end

      _G.lsp_on_attach = on_attach
      _G.lsp_capabilities = capabilities

      -- Diagnostic config (new API)
      vim.diagnostic.config({
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        virtual_text = { prefix = "●", source = "if_many" },
        float = { border = "rounded", source = "always", pad_top = 1, pad_bottom = 1 },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
      })

      -- Setup mason-lspconfig
      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "gopls",
          "bashls",
          "dockerls",
          "html",
          "cssls",
          "jsonls",
          "yamlls",
          "taplo",
          "svelte",
          "vue_ls",
          "prismals",
          "terraformls",
          "vimls",
          "emmet_ls",
          "tailwindcss",
          "buf_ls",
          "cucumber_language_server",
          "astro",
          "basedpyright",
        },
        automatic_installation = true,
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })
          end,

          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = { globals = { "vim" } },
                  workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                  },
                  telemetry = { enable = false },
                },
              },
            })
          end,

          ["jsonls"] = function()
            lspconfig.jsonls.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              settings = {
                json = {
                  schemas = require("schemastore").json.schemas(),
                  validate = { enable = true },
                },
              },
            })
          end,

          ["yamlls"] = function()
            lspconfig.yamlls.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              settings = {
                yaml = {
                  schemaStore = {
                    enable = true,
                    url = "https://www.schemastore.org/api/json/catalog.json",
                  },
                  schemas = require("schemastore").yaml.schemas(),
                  validate = false,
                  hover = true,
                  completion = true,
                },
              },
            })
          end,

          ["basedpyright"] = function()
            lspconfig.basedpyright.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              settings = {
                basedpyright = {
                  analysis = {
                    typeCheckingMode = "basic",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                  },
                },
              },
            })
          end,

          ["emmet_ls"] = function()
            lspconfig.emmet_ls.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              filetypes = { "typescriptreact", "javascriptreact", "html", "css" },
              init_options = {
                html = { options = { ["jsx.enabled"] = true } },
              },
            })
          end,

          ["gopls"] = function()
            vim.filetype.add({
              extension = { tmp = "html" },
            })

            lspconfig.gopls.setup({
              settings = {
                gopls = {
                  analyses = {
                    unusedparams = true,
                    shadow = true,
                  },
                  staticcheck = true,
                  gofumpt = true,
                },
              },
              filetypes = { "go", "gopls", "gowork", "gotmpl", "tmpl" },
            })
          end,

          ["buf_ls"] = function()
            lspconfig.bufls.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              cmd = { "bufls", "serve" },
              filetypes = { "proto" },
              root_dir = lspconfig.util.root_pattern("buf.yaml", "buf.work.yaml", ".git"),
            })
          end,

          ["astro"] = function()
            lspconfig.astro.setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })
          end,

          ["postgres_lsp"] = function()
            lspconfig.postgres_lsp.setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })
          end,
        },
      })
    end,
  },
}
