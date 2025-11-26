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
            local mason_registry = require("mason-registry")
            local ra_binary = mason_registry.is_installed("rust-analyzer")
                and mason_registry.get_package("rust-analyzer"):get_install_path() .. "/rust-analyzer"
              or "rust-analyzer"
            return { ra_binary }
          end,
          on_attach = function(client, bufnr)
            -- Use global on_attach if available
            if _G.lsp_on_attach then
              _G.lsp_on_attach(client, bufnr)
            end
            -- Override gd for Rust
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
          end,
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

