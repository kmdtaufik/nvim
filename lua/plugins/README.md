# Plugins Configuration

This directory contains all plugin specifications and their configurations.

## 📁 Structure

```
plugins/
├── init.lua           # Simple plugins with minimal configuration
├── treesitter.lua     # Treesitter syntax highlighting (complex config)
├── trouble.lua        # Trouble diagnostics viewer (complex config)
└── README.md          # This file
```

**Philosophy:**
- **Simple plugins** (minimal config) → `init.lua`
- **Complex plugins** (extensive config) → Separate files

## 📦 Installed Plugins

### Core Functionality

#### Formatting
- **stevearc/conform.nvim** - Async formatter
  - Configuration: `lua/configs/conform.lua`
  - Event: `BufWritePre`
  - Auto-format on save enabled

#### LSP Configuration
- **neovim/nvim-lspconfig** - Language Server Protocol support
  - Configuration: `lua/configs/lspconfig.lua`
  - Language-specific configs: `lua/configs/lsp/*.lua`

### Syntax & Parsing

#### Treesitter
- **nvim-treesitter/nvim-treesitter** - Syntax highlighting and parsing
  - Configuration: `lua/plugins/treesitter.lua`
  - Auto-install enabled
  - Parsers: JS/TS/React/Rust/C++/Python/Nix/Markdown/LaTeX/etc.
  - Features: Syntax highlighting, indentation, incremental selection, text objects

### Language-Specific

#### Web Development
- **windwp/nvim-ts-autotag** - Auto-close HTML/JSX tags
  - Configuration: `lua/plugins/init.lua` (simple config)
  - Supports: HTML, JSX, TSX, Vue, Svelte, XML

#### Rust
- **rust-lang/rust.vim** - Rust tooling
  - Configuration: `lua/plugins/init.lua` (simple config)
  - Rustfmt on save enabled
  - Edition 2021 support

### UI Enhancements

#### Diagnostics
- **folke/trouble.nvim** - Better diagnostics viewer
  - Configuration: `lua/plugins/trouble.lua`
  - Keymaps: `<leader>xx`, `<leader>xX`, `<leader>cs`, `<leader>xL`, `<leader>xQ`

## 🎯 Adding New Plugins

### Simple Plugin (in init.lua)

Add to `lua/plugins/init.lua`:

```lua
{
    "author/plugin-name",
    event = "VeryLazy",
    opts = {
        setting1 = true,
        setting2 = "value",
    },
}
```

### Complex Plugin (separate file)

1. Create `lua/plugins/myplugin.lua`:

```lua
-- MyPlugin Configuration
-- Description of what it does

return {
    "author/plugin-name",
    event = "VeryLazy",
    
    opts = {
        -- Extensive configuration here
        feature1 = {
            enable = true,
            setting = "value",
        },
        feature2 = {
            -- More settings...
        },
    },
    
    config = function(_, opts)
        require("plugin-name").setup(opts)
    end,
}
```

2. The plugin will be auto-loaded by lazy.nvim (no need to require it in init.lua)

### When to Use Separate Files?

Create a separate file when:
- ✅ Plugin has 20+ lines of configuration
- ✅ Multiple features need detailed setup
- ✅ Keymaps are defined within plugin spec
- ✅ Custom functions or callbacks
- ✅ Complex `opts` table

Keep in `init.lua` when:
- ✅ Plugin has < 10 lines of config
- ✅ Simple `opts` or single `init` function
- ✅ Minimal or no configuration needed

## 📚 Plugin Loading Events

Plugins use different loading strategies for optimal performance:

- **event = "BufWritePre"** - Load before saving (conform.nvim)
- **event = { "BufReadPost", "BufNewFile" }** - Load when opening files (Treesitter)
- **cmd = "CommandName"** - Load when command is run (Trouble)
- **ft = "filetype"** - Load for specific filetypes (Rust.vim, autotag)
- **keys = { ... }** - Load when keybinding is pressed (Trouble)

## 🔧 Current Plugin Structure

### init.lua (Simple Configs)
```lua
return {
    { "plugin1", opts = { ... } },  -- < 10 lines
    { "plugin2", init = function() ... end },
    { "plugin3", ft = "rust" },
}
```

### treesitter.lua (Complex Config)
```lua
return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = { ... },  -- 50+ parsers
        highlight = { ... },
        indent = { ... },
        incremental_selection = { ... },
        textobjects = { ... },
    },
}
```

### trouble.lua (Complex Config)
```lua
return {
    "folke/trouble.nvim",
    keys = { ... },  -- Multiple keybindings
    opts = {
        -- 50+ lines of configuration
        position = "bottom",
        modes = { ... },
        keys = { ... },
    },
}
```

## 🚀 Available Plugins (NvChad)

NvChad includes these plugins by default:

- **lazy.nvim** - Plugin manager
- **nvim-web-devicons** - File icons
- **nvim-tree** - File explorer
- **telescope.nvim** - Fuzzy finder
- **which-key.nvim** - Keybinding helper
- **gitsigns.nvim** - Git integration
- **nvim-cmp** - Completion engine
- **nvim-autopairs** - Auto-pair brackets/quotes
- **Comment.nvim** - Commenting utility

See `:Lazy` for full list.

## 💡 Tips

1. **Lazy Loading** - Use `event`, `cmd`, `ft`, or `keys` to lazy load plugins
2. **Organization** - Simple plugins in `init.lua`, complex ones in separate files
3. **Dependencies** - Use `dependencies = { ... }` for plugin dependencies
4. **Building** - Use `build = "command"` for post-install build steps
5. **Priority** - Use `priority = 1000` for plugins that must load first

## 🔍 Checking Plugin Status

```vim
:Lazy                 " Open plugin manager UI
:Lazy sync            " Update all plugins
:Lazy clean           " Remove unused plugins
:Lazy profile         " Show startup time
:checkhealth lazy     " Check lazy.nvim health
```

## 📖 References

- [lazy.nvim Documentation](https://github.com/folke/lazy.nvim)
- [NvChad Plugin System](https://nvchad.com/docs/config/plugins)
- [Treesitter Documentation](https://github.com/nvim-treesitter/nvim-treesitter)
- [Trouble Documentation](https://github.com/folke/trouble.nvim)

## 🎨 Plugin Configuration Best Practices

1. **Modularity** - Separate files for complex configs
2. **Simplicity** - Keep simple configs in init.lua
3. **Documentation** - Comment all non-obvious settings
4. **Performance** - Use lazy loading when possible
5. **Defaults** - Only override what's necessary
6. **Testing** - Test configuration after changes

---

**Structure**: Flat organization with separate files only for complex plugins
**Auto-loading**: All `.lua` files in this directory are automatically loaded by lazy.nvim
**No imports needed**: Just create a file and return the plugin spec!