-- Statusline
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      local function get_lsp_clients()
        local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
        if next(buf_clients) == nil then
          return ""
        end

        local client_names = {}
        for _, client in pairs(buf_clients) do
          table.insert(client_names, client.name)
        end

        return "  " .. table.concat(client_names, ", ")
      end

      require("lualine").setup({
        options = {
          theme = "gruvbox",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            { "mode", color = { gui = "bold" } },
          },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = {
            { get_lsp_clients, color = { gui = "italic" } },
            "encoding",
            "fileformat",
            "filetype"
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}
