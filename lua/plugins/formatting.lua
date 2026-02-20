-- Formatting with conform.nvim
return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>lf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          css = { "prettier" },
          sass = { "prettier" },
          scss = { "prettier" },
          less = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          astro = { "prettier" },
          markdown = { "prettier" },
          graphql = { "prettier" },
          svelte = { "prettier" },
          vue = { "prettier" },
          lua = { "stylua" },
          python = { "black" },
          go = { "gofmt" },
          rust = { "rustfmt" },
          sh = { "shfmt" },
          bash = { "shfmt" },
          gotmpl = { "gofmt" },
        },
        format_on_save = function(bufnr)
          -- Disable for certain filetypes or if no formatter
          local ignore_filetypes = {}
          if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
            return
          end
          return {
            timeout_ms = 500,
            lsp_fallback = true,
          }
        end,
      })
    end,
  },
}
