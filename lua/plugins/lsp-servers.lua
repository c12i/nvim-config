-- LSP Server configurations
-- Migrated from lua/user/lsp-config/*.lua

local M = {}

M.setup = function(lspconfig, on_attach, capabilities)
  -- Default setup for most servers
  local default_servers = {
    "bashls",
    "dockerls",
    "html",
    "cssls",
    "prismals",
    "sqlls",
    "nil_ls",
    "terraformls",
    "vimls",
    "svelte",
    "gopls",
  }

  for _, server in ipairs(default_servers) do
    lspconfig[server].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end

  -- Lua
  lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = { enable = false },
      },
    },
  })

  -- JSON
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

  -- YAML
  lspconfig.yamlls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      yaml = {
        schemaStore = {
          enable = false,
          url = "",
        },
        schemas = require("schemastore").yaml.schemas(),
      },
    },
  })

  -- TOML
  lspconfig.taplo.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- Python
  lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
        },
      },
    },
  })

  -- Vue
  lspconfig.volar.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "vue" },
  })

  -- Emmet for JSX/TSX
  lspconfig.emmet_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "typescriptreact", "javascriptreact", "html", "css" },
    init_options = {
      html = {
        options = {
          ["jsx.enabled"] = true,
        },
      },
    },
  })
end

return M

