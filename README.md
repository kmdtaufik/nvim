# NvChad Configuration

<!--toc:start-->

- [NvChad Configuration](#nvchad-configuration)
  - [🚀 Supported Languages & Tools](#🚀-supported-languages-tools)
    - [Web Development (MERN + Modern Stack)](#web-development-mern-modern-stack)
    - [Systems Programming](#systems-programming)
    - [Python](#python)
    - [Configuration & Scripting](#configuration-scripting)
    - [Documentation](#documentation)
  - [📦 Installed System Packages](#📦-installed-system-packages)
  - [🎯 Key Features](#🎯-key-features)
    - [LSP Configuration](#lsp-configuration)
    - [Formatting](#formatting)
    - [Treesitter](#treesitter)
    - [Additional Plugins](#additional-plugins)
  - [⌨️ Key Mappings](#️-key-mappings)
    - [General](#general)
    - [LSP](#lsp)
    - [Formatting](#formatting-1)
    - [Diagnostics](#diagnostics)
    - [Trouble (Diagnostics)](#trouble-diagnostics)
    - [Additional LSP](#additional-lsp)
    - [Window Navigation](#window-navigation)
    - [Visual Mode](#visual-mode)
    - [Language-Specific](#language-specific)
  - [📁 File Structure](#📁-file-structure)
  - [🎨 Customization](#🎨-customization)
    - [Theme](#theme)
    - [Formatters](#formatters)
    - [LSP Settings](#lsp-settings)
    - [Prettier Settings](#prettier-settings)
  - [🔧 Per-Language Configuration](#🔧-per-language-configuration)
    - [Indentation](#indentation)
    - [Auto-Format on Save](#auto-format-on-save)
    - [Spell Checking](#spell-checking)
    - [Line Wrapping](#line-wrapping)
  - [📝 Language-Specific Features](#📝-language-specific-features)
    - [TypeScript/JavaScript](#typescriptjavascript)
    - [Rust](#rust)
    - [C/C++](#cc)
    - [Python](#python-1)
    - [Nix](#nix)
    - [LaTeX](#latex)
  - [🚀 Getting Started](#🚀-getting-started)
    - [Useful Commands](#useful-commands)
  - [🐛 Troubleshooting](#🐛-troubleshooting)
    - [LSP not working](#lsp-not-working)
    - [Formatter not working](#formatter-not-working)
    - [Treesitter issues](#treesitter-issues)
  - [📚 Resources](#📚-resources)
  - [🎓 Tips](#🎓-tips)
  - [🔄 Updates](#🔄-updates)
  - [📜 License](#📜-license)
  <!--toc:end-->

Complete Neovim configuration using NvChad v2.5 with full language server
support for modern development.

## 🚀 Supported Languages & Tools

### Web Development (MERN + Modern Stack)

- **JavaScript/TypeScript** - LSP: `ts_ls`, Formatter: `prettierd`
- **React/Next.js/Vite** - Full JSX/TSX support
- **HTML/CSS** - LSP: `html`, `cssls`, Formatter: `prettierd`
- **Tailwind CSS** - LSP: `tailwindcss` with class regex support
- **JSON** - LSP: `jsonls`, Formatter: `prettierd`
- **ESLint** - LSP: `eslint` with auto-fix on save

### Systems Programming

- **Rust** - LSP: `rust_analyzer`, Formatter: `rustfmt`
  - Clippy integration
  - Cargo support
  - Inlay hints
- **C/C++** - LSP: `clangd`, Formatter: `clang-format`
  - Header insertion
  - Clang-tidy integration

### Python

- **Python** - LSP: `pyright`, Formatters: `black` + `isort`
  - Type checking
  - Import sorting

### Configuration & Scripting

- **Nix** - LSP: `nixd`, Formatter: `alejandra`

### Documentation

- **Markdown** - LSP: `marksman`, Formatter: `prettierd`
  - Auto-wrapping
  - Spell checking
- **LaTeX** - LSP: `texlab`, Engine: `tectonic`
  - Build integration
  - Forward search support

## 📦 Installed System Packages

All language servers and tools are installed via Nix:

```nix
# Core
neovim, gcc, ripgrep, fd, git

# MERN Stack
nodejs_20, typescript, typescript-language-server
vscode-langservers-extracted, tailwindcss-language-server
prettierd

# Rust
cargo, rustc, rust-analyzer, rustfmt

# C++
clang-tools

# Python
python3, pyright, black, isort

# Nix
nixd, alejandra

# Markdown & LaTeX
marksman, markdownlint-cli, texlab, tectonic
```

## 🎯 Key Features

### LSP Configuration

- ✅ Full LSP support for all languages
- ✅ Inlay hints (TypeScript, Rust)
- ✅ Code actions and diagnostics
- ✅ Auto-completion
- ✅ Hover documentation
- ✅ Go to definition/references
- ✅ Rename refactoring

### Formatting

- ✅ Auto-format on save
- ✅ Language-specific formatters
- ✅ Async formatting with `conform.nvim`
- ✅ Prettier configuration for web dev
- ✅ No Mason dependency (all tools system-installed)

### Treesitter

- ✅ Syntax highlighting for all languages
- ✅ Incremental selection
- ✅ Code folding
- ✅ Auto-tag closing (HTML/JSX)

### Additional Plugins

- ✅ **Trouble** - Better diagnostics viewer
- ✅ **nvim-ts-autotag** - Auto-close HTML/JSX tags
- ✅ **rust.vim** - Additional Rust tooling

## ⌨️ Key Mappings

### General

| Key         | Mode   | Action             |
| ----------- | ------ | ------------------ |
| `<Space>`   | Normal | Leader key         |
| `;`         | Normal | Enter command mode |
| `jk`        | Insert | Exit insert mode   |
| `<leader>w` | Normal | Save file          |
| `<leader>q` | Normal | Quit               |

### LSP

| Key          | Mode   | Action               |
| ------------ | ------ | -------------------- |
| `gd`         | Normal | Go to definition     |
| `gD`         | Normal | Go to declaration    |
| `gi`         | Normal | Go to implementation |
| `gr`         | Normal | Show references      |
| `K`          | Normal | Hover documentation  |
| `<leader>ca` | Normal | Code action          |
| `<leader>ra` | Normal | Rename symbol        |
| `<leader>D`  | Normal | Type definition      |
| `<leader>sh` | Normal | Signature help       |

### Formatting

| Key          | Mode          | Action                |
| ------------ | ------------- | --------------------- |
| `<leader>fm` | Normal/Visual | Format file/selection |

### Diagnostics

| Key          | Mode   | Action                    |
| ------------ | ------ | ------------------------- |
| `[d`         | Normal | Previous diagnostic       |
| `]d`         | Normal | Next diagnostic           |
| `<leader>e`  | Normal | Show diagnostic float     |
| `<leader>dl` | Normal | Diagnostics location list |

### Trouble (Diagnostics)

| Key          | Mode   | Action             |
| ------------ | ------ | ------------------ |
| `<leader>xx` | Normal | Toggle diagnostics |
| `<leader>xX` | Normal | Buffer diagnostics |
| `<leader>cs` | Normal | Symbols            |
| `<leader>xL` | Normal | Location list      |
| `<leader>xQ` | Normal | Quickfix list      |

### Additional LSP

| Key          | Mode   | Action           |
| ------------ | ------ | ---------------- |
| `gh`         | Normal | Find references  |
| `<leader>o`  | Normal | Document symbols |
| `gp`         | Normal | Peek definition  |
| `<leader>cd` | Normal | Line diagnostics |

### Window Navigation

| Key                      | Mode   | Action           |
| ------------------------ | ------ | ---------------- |
| `<C-h/j/k/l>`            | Normal | Navigate windows |
| `<C-Up/Down/Left/Right>` | Normal | Resize windows   |

### Visual Mode

| Key   | Mode   | Action                |
| ----- | ------ | --------------------- |
| `</>` | Visual | Indent and reselect   |
| `J/K` | Visual | Move text down/up     |
| `p`   | Visual | Paste without yanking |

### Language-Specific

| Key          | Mode   | Action               |
| ------------ | ------ | -------------------- |
| `<leader>rr` | Normal | Run Rust program     |
| `<leader>rt` | Normal | Run Rust tests       |
| `<leader>lb` | Normal | Build LaTeX          |
| `<leader>lf` | Normal | LaTeX forward search |

## 📁 File Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── autocmds.lua           # Auto commands
│   ├── chadrc.lua             # NvChad config
│   ├── mappings.lua           # Key mappings
│   ├── options.lua            # Vim options
│   ├── configs/
│   │   ├── conform.lua        # Formatter config
│   │   ├── lazy.lua           # Lazy.nvim config
│   │   └── lspconfig.lua      # LSP config
│   └── plugins/
│       └── init.lua           # Plugin definitions
└── .prettierrc.json           # Prettier config
```

## 🎨 Customization

### Theme

Current theme: `onedark`

To change theme, edit `lua/chadrc.lua`:

```lua
M.base46 = {
  theme = "onedark", -- Change this
}
```

### Formatters

Configure formatters in `lua/configs/conform.lua`:

```lua
formatters_by_ft = {
  lua = { "stylua" },
  python = { "isort", "black" },
  -- Add more...
}
```

### LSP Settings

Customize LSP servers in `lua/configs/lspconfig.lua`:

```lua
lspconfig.ts_ls.setup({
  settings = {
    -- Your settings here
  }
})
```

### Prettier Settings

Modify `.prettierrc.json` for web formatting preferences:

```json
{
  "semi": true,
  "singleQuote": true,
  "printWidth": 100
}
```

## 🔧 Per-Language Configuration

### Indentation

- **Lua, JS/TS, Nix**: 2 spaces
- **Python, Rust, C/C++**: 4 spaces

### Auto-Format on Save

Enabled for: `.lua`, `.rs`, `.py`, `.js`, `.jsx`, `.ts`, `.tsx`, `.json`,
`.html`, `.css`, `.scss`, `.md`, `.nix`, `.c`, `.cpp`

### Spell Checking

Enabled for: Markdown, LaTeX

### Line Wrapping

Enabled for: Markdown, LaTeX

## 📝 Language-Specific Features

### TypeScript/JavaScript

- Inlay hints for parameters and types
- Auto-import
- Organize imports
- ESLint integration with auto-fix

### Rust

- Clippy diagnostics
- Cargo integration
- Proc macro support
- Inlay hints for lifetimes
- Auto-format with rustfmt on save

### C/C++

- Clang-tidy integration
- Header insertion (IWYU)
- Function argument placeholders
- LLVM style formatting

### Python

- Type checking with Pyright
- Black formatting (88 chars)
- Import sorting with isort (Black profile)
- Auto-search paths

### Nix

- Formatting with alejandra
- Full language support

### LaTeX

- Build with tectonic
- SyncTeX support
- Chktex disabled (can be enabled)
- 80-character line length

## 🚀 Getting Started

1. **Open Neovim**: `nvim`
2. **Wait for plugins to install** (first launch only)
3. **Restart Neovim** to activate all plugins
4. **Open a file** and start coding!

### Useful Commands

- `:Lazy` - Plugin manager
- `:Mason` - NOT USED (we use system packages)
- `:LspInfo` - Check LSP status
- `:ConformInfo` - Check formatter status
- `:Trouble` - View diagnostics
- `:TSUpdate` - Update Treesitter parsers
- `:checkhealth` - Check Neovim health

## 🐛 Troubleshooting

### LSP not working

1. Check if language server is installed: `which <server-name>`
2. Check LSP status: `:LspInfo`
3. Check logs: `:lua vim.cmd('e '..vim.lsp.get_log_path())`

### Formatter not working

1. Check if formatter is installed: `which <formatter-name>`
2. Check conform status: `:ConformInfo`
3. Try manual format: `<leader>fm`

### Treesitter issues

1. Update parsers: `:TSUpdate`
2. Check installed parsers: `:TSInstallInfo`

## 📚 Resources

- [NvChad Documentation](https://nvchad.com/docs/quickstart/install)
- [Neovim LSP Guide](https://neovim.io/doc/user/lsp.html)
- [conform.nvim](https://github.com/stevearc/conform.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

## 🎓 Tips

1. **Use `:Telescope keymaps`** to search all keybindings
2. **Press `K`** twice to enter hover window (useful for scrolling docs)
3. **Use `<C-space>`** for incremental selection in Treesitter
4. **Use `<leader>xx`** to view all diagnostics in Trouble
5. **Use `gd` + `<C-o>`** to go to definition and back
6. **Format on save is enabled** - disable in `lua/options.lua` if needed

## 🔄 Updates

To update NvChad and plugins:

```vim
:Lazy sync
```
