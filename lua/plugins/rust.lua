-- Rust development
return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          cmd = function()
            -- Use Mason's rust-analyzer
            local mason_registry = require("mason-registry")
            if mason_registry.is_installed("rust-analyzer") then
              local pkg = mason_registry.get_package("rust-analyzer")
              local path = pkg:get_install_path() .. "/rust-analyzer"
              return { path }
            end
            -- Fallback: let rustaceanvim find it
            return { "rust-analyzer" }
          end,
          on_attach = function(client, bufnr)
            if _G.lsp_on_attach then
              _G.lsp_on_attach(client, bufnr)
            end
          end,
          default_settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
              cargo = {
                allFeatures = true,
              },
            },
          },
        },
      }
    end,
  },
  {
    "saecki/crates.nvim",
    tag = "stable",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },
}
