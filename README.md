# nvim-config

Neovim configuration using lazy.nvim and Mason.

## Structure

```
.
├── init.lua              # Entry point, lazy.nvim bootstrap
└── lua/
    ├── config/
    │   ├── options.lua   # Vim options
    │   ├── keymaps.lua   # Keybindings
    │   └── autocmds.lua  # Autocommands
    └── plugins/
        ├── alpha.lua         # Dashboard
        ├── bufferline.lua    # Buffer tabs
        ├── cmp.lua           # Completions
        ├── colorscheme.lua   # Gruvbox theme
        ├── editor.lua        # Editor plugins (autopairs, surround, etc)
        ├── formatting.lua    # conform.nvim formatters
        ├── git.lua           # Git integration
        ├── lsp.lua           # LSP configuration
        ├── lualine.lua       # Statusline
        ├── nvim-tree.lua     # File explorer
        ├── project.lua       # Project management
        ├── rust.lua          # Rust-specific config
        ├── telescope.lua     # Fuzzy finder
        ├── toggleterm.lua    # Terminal
        ├── treesitter.lua    # Syntax highlighting
        ├── trouble.lua       # Diagnostics UI
        ├── typescript.lua    # TypeScript-specific config
        └── which-key.lua     # Keybinding hints
```

## Installation

```bash
git clone https://github.com/c12i/nvim-config.git ~/.config/nvim
nvim
```

Plugins install automatically on first launch.

## Key Features

- LSP with Mason (auto-install servers)
- Treesitter syntax highlighting
- Fuzzy finding with Telescope
- Global search and replace with Nvim Spectre
- Git integration (gitsigns, vim-fugitive)
- Auto-formatting on save
- Buffer tabs with bufferline
- File explorer with nvim-tree
- Dashboard with recent projects
- Terminal integration with toggleterm
- Diagnostics UI with trouble.nvim

## LSP Servers

Managed by Mason. Auto-installed:

- lua_ls, ts_ls, pyright, gopls, rust_analyzer
- bashls, dockerls, html, cssls, jsonls, yamlls
- taplo, svelte, vue_ls, prismals, terraformls, vimls, emmet_ls, none_ls (previously null_ls)

## Formatters

Managed by conform.nvim:

- prettier (js/ts/css/html/json/yaml/md)
- stylua (lua)
- black (python)
- rustfmt (rust)
- gofmt (go)
- shfmt (bash)

## Keymaps

Leader key: `Space`

Press `<leader>` to see all available keybindings via which-key.
Press `<leader>sk` to search keymaps with Telescope.

## Adding New Plugins

Create a new file in `lua/plugins/`:

```lua
-- lua/plugins/myplugin.lua
return {
  {
    "author/plugin-name",
    event = "VeryLazy",  -- or ft = "filetype", cmd = "Command", keys = {...}
    dependencies = { "other/plugin" },
    config = function()
      require("plugin-name").setup({
        -- plugin options
      })
    end,
  },
}
```

Restart nvim or run `:Lazy sync`.

## Adding LSP Servers

Edit `lua/plugins/lsp.lua`:

1. Add server to `ensure_installed`:

```lua
ensure_installed = {
  "lua_ls",
  "new_server",  -- add here
},
```

2. (Optional) Add custom configuration:

```lua
handlers = {
  ["new_server"] = function()
    lspconfig.new_server.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        -- server-specific settings
      },
    })
  end,
}
```

Restart nvim or run `:Mason` to install.

## Adding Keymaps

Edit `lua/config/keymaps.lua`:

```lua
local map = vim.keymap.set

-- Normal mode
map("n", "<leader>x", ":Command<CR>", { desc = "Description" })

-- Visual mode
map("v", "<leader>x", ":Command<CR>", { desc = "Description" })

-- Insert mode
map("i", "<C-x>", "<Esc>:Command<CR>", { desc = "Description" })

-- Multiple modes
map({ "n", "v" }, "<leader>x", ":Command<CR>", { desc = "Description" })
```

Keymaps are loaded on startup. No restart needed.

## Adding Formatters

Edit `lua/plugins/formatting.lua`:

```lua
formatters_by_ft = {
  newlang = { "formatter_name" },
},
```

Install formatter via Mason: `:Mason` or ensure it's in PATH.

## Running Checks Locally

### Install Tools

```bash
# Install luacheck
luarocks install luacheck

# Install StyLua
cargo install stylua

# or on macOS:
brew install stylua
```

### Run Checks

```bash
# Lint your Lua code
luacheck .

# Check formatting
stylua --check .

# Auto-format code
stylua .

# Test config loads
nvim --headless -c "quit"
```
