# Plugins Configuration

This directory contains all plugin specifications and their configurations.

## 📁 Structure

```
plugins/
├── init.lua          # Main plugin specifications (loaded by lazy.nvim)
└── configs/          # Individual plugin configurations
    ├── treesitter.lua  # Treesitter syntax highlighting
    ├── autotag.lua     # Auto-close HTML/JSX tags
    ├── trouble.lua     # Diagnostics viewer
    └── rust.lua        # Rust-specific tooling
```

## 📦 Installed Plugins

### Core Functionality

#### LSP Configuration
- **neovim/nvim-lspconfig** - Language Server Protocol support
  - Configuration: `lua/configs/lspconfig.lua`
  - Language-specific configs: `lua/configs/lsp/*.lua`

#### Formatting
- **stevearc/conform.nvim** - Async formatter
  - Configuration: `lua/configs/conform.lua`
  - Auto-format on save enabled

### Syntax & Parsing

#### Treesitter
- **nvim-treesitter/nvim-treesitter** - Syntax highlighting and parsing
  - Configuration: `lua/plugins/configs/treesitter.lua`
  - Auto-install enabled
  - Parsers: JS/TS/React/Rust/C++/Python/Nix/Markdown/LaTeX/etc.

### Language-Specific

#### Web Development
- **windwp/nvim-ts-autotag** - Auto-close HTML/JSX tags
  - Configuration: `lua/plugins/configs/autotag.lua`
  - Supports: HTML, JSX, TSX, Vue, Svelte, XML

#### Rust
- **rust-lang/rust.vim** - Rust tooling
  - Configuration: `lua/plugins/configs/rust.lua`
  - Rustfmt on save enabled
  - Edition 2021 support

### UI Enhancements

#### Diagnostics
- **folke/trouble.nvim** - Better diagnostics viewer
  - Configuration: `lua/plugins/configs/trouble.lua`
  - Keymaps: `<leader>xx`, `<leader>xX`, `<leader>cs`

## 🎯 Adding New Plugins

### 1. Add Plugin Specification

Edit `lua/plugins/init.lua`:

```lua
{
    "author/plugin-name",
    event = "VeryLazy",  -- or ft, cmd, keys, etc.
    opts = function()
        return require "plugins.configs.myplugin"
    end,
}
```

### 2. Create Configuration File

Create `lua/plugins/configs/myplugin.lua`:

```lua
-- My Plugin Configuration
-- Description of what it does

return {
    opts = {
        -- Plugin options here
        setting1 = true,
        setting2 = "value",
    },
}
```

### 3. Reload Configuration

```vim
:Lazy reload
```

## 📚 Plugin Loading Events

Plugins use different loading strategies for optimal performance:

- **event = "BufWritePre"** - Load before saving (conform.nvim)
- **event = { "BufReadPost", "BufNewFile" }** - Load when opening files (Treesitter)
- **cmd = "CommandName"** - Load when command is run (Trouble)
- **ft = "filetype"** - Load for specific filetypes (Rust.vim, autotag)
- **keys = { ... }** - Load when keybinding is pressed (Trouble)

## 🔧 Configuration Files

Each plugin configuration file should:

1. **Return a table** with plugin options
2. **Include comments** explaining settings
3. **Document keymaps** if applicable
4. **Be self-contained** - no external dependencies

### Example Structure

```lua
-- Plugin Name Configuration
-- Brief description

return {
    opts = {
        -- Core settings
        enabled = true,
        
        -- Feature flags
        feature1 = {
            enable = true,
            option = "value",
        },
        
        -- Keymaps (if applicable)
        keys = {
            ["<key>"] = "action",
        },
    },
    
    -- Optional init function
    init = function()
        -- Pre-load setup
    end,
    
    -- Optional config function
    config = function(_, opts)
        -- Post-load setup
        require("plugin").setup(opts)
    end,
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
2. **Configuration** - Keep configs in separate files for maintainability
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

1. **Modularity** - One file per plugin
2. **Documentation** - Comment all non-obvious settings
3. **Performance** - Use lazy loading when possible
4. **Defaults** - Only override what's necessary
5. **Testing** - Test configuration after changes

---

**Note**: All plugin configurations use the `opts` pattern for lazy.nvim compatibility. This allows lazy.nvim to automatically call `plugin.setup(opts)` with the provided options.