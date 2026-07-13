# nvim-config

Neovim configuration using lazy.nvim and Mason. Tested on: MacOS and Linux (Ubuntu)

## Structure

```
.
├── init.lua              # Entry point, lazy.nvim bootstrap
├── bin/
│   └── notes-link        # Symlinks a repo's @notes/ dir into the Obsidian vault
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

**Optional [WezTerm](https://wezterm.org/index.html) Setup** (_if using WezTerm_)

```bash
ln -s ~/.config/nvim/.wezterm.lua ~/.wezterm.lua
```

**Optional [Zellij](https://zellij.dev/) Setup** (_if using Zellij for window management, e.g. inside WezTerm_)

```bash
mkdir -p ~/.config/zellij
ln -s ~/.config/nvim/.zellij.kdl ~/.config/zellij/config.kdl
```

**Optional sync dotfiles (Configure ~`wezterm`~, `Ghostty`, `yazi`, `zellij`, `notes-link`)**

```bash
./install.sh
```

Plugins install automatically on first launch.

## Scripts

### `notes-link`

Personal notes live in an `@notes/` directory inside whatever repo you're working in, and get symlinked into an Obsidian vault so they're browsable/searchable/graphable there without living inside the vault's own directory tree.

`notes-link` automates that wiring:

- Creates `@notes/` in a repo (if it doesn't already exist).
- Symlinks that `@notes/` dir into `~/Documents/obsidian-notes/my-notes/<name>`.
- Is idempotent — safe to re-run, and refuses to clobber anything that isn't already the correct symlink.
- Warns if `@notes/` isn't gitignored in that repo (it should be covered globally, see setup below).

```bash
notes-link <vault-dirname> [repo-path]

# examples
notes-link rabbitmq                    # links ./@notes as ~/Documents/obsidian-notes/my-notes/rabbitmq
notes-link go ~/coding/babel-go        # links ~/coding/babel-go/@notes as .../my-notes/go
```

Override the vault base directory with `NOTES_VAULT_DIR` if your vault isn't at `~/Documents/obsidian-notes/my-notes`.

**Setup on a fresh machine:**

Running `./install.sh` (see [Installation](#installation)) handles both of these:

1. Symlinks `bin/notes-link` to `~/.local/bin/notes-link` — make sure `~/.local/bin` is on your `PATH`.
2. Adds `@notes/` to your global gitignore (`git config --global core.excludesFile`, creating `~/.gitignore` if you don't already have one configured), so no per-repo `.gitignore` entry is ever needed.

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
