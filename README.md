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
        ├── colorscheme.lua
        ├── treesitter.lua
        ├── nvim-tree.lua
        ├── lualine.lua
        ├── which-key.lua
        ├── telescope.lua
        ├── cmp.lua
        ├── lsp.lua
        ├── lsp-servers.lua
        ├── formatting.lua
        ├── git.lua
        ├── editor.lua
        ├── rust.lua
        └── typescript.lua
```

## Installation

```bash
git clone <repo> ~/.config/nvim
nvim
```

Plugins install automatically on first launch.

## Dependencies

- [ripgrep](https://github.com/BurntSushi/ripgrep) - telescope live grep
- [code-minimap](https://github.com/wfxr/code-minimap) - minimap
- [fd](https://github.com/sharkdp/fd) - telescope find files

## LSP Servers

Managed by Mason. Auto-installed on first launch:
- lua_ls, ts_ls, pyright, gopls, rust-analyzer
- bashls, dockerls, html, cssls, jsonls, yamlls
- taplo, svelte, volar, prismals, sqlls, nil_ls, terraformls

## Formatters

Managed by conform.nvim:
- prettier (js/ts/css/html/json/yaml/md)
- stylua (lua)
- black (python)
- rustfmt (rust)
- gofmt (go)
- shfmt (bash)
