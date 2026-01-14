-- Rust development (without rustaceanvim)
return {
  {
    "saecki/crates.nvim",
    tag = "stable",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup({
        completion = {
          cmp = {
            enabled = true,
          },
        },
      })
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = { "rust" },
    init = function()
      -- Ensure gd works for rust files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "rust",
        callback = function(event)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, desc = "Go to definition" })
        end,
      })
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
  },
}
