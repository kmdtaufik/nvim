# LSP Configuration Structure

This directory contains modular language server configurations using Neovim 0.11+ native `vim.lsp.config` API.

## 📁 File Organization

Each language has its own dedicated configuration file:

```
lsp/
├── web.lua        # JavaScript/TypeScript/React/HTML/CSS/JSON/ESLint/Tailwind
├── cpp.lua        # C/C++ (Clangd)
├── rust.lua       # Rust (rust-analyzer)
├── python.lua     # Python (Pyright)
├── nix.lua        # Nix (nixd)
├── markdown.lua   # Markdown (Marksman)
├── latex.lua      # LaTeX (Texlab)
└── README.md      # This file
```

## 🚀 How It Works

### 1. Main Entry Point
`lua/configs/lspconfig.lua` requires all language modules:

```lua
require("configs.lsp.web")
require("configs.lsp.cpp")
require("configs.lsp.rust")
-- ... etc
```

### 2. Each Language Module
Every language file follows this structure:

```lua
-- Configure the LSP server
vim.lsp.config.server_name = {
    cmd = { "server-binary", "args" },
    filetypes = { "filetype" },
    root_markers = { "project-file" },
    settings = {
        -- Server-specific settings
    },
}

-- Enable the server
vim.lsp.enable("server_name")

-- Return server names for reference
return {
    servers = { "server_name" },
}
```

### 3. Automatic Loading
All servers are automatically configured and enabled when Neovim starts.

## 📋 Configured Language Servers

### Web Development (`web.lua`)
- **ts_ls** - TypeScript/JavaScript
  - Inlay hints enabled
  - Auto-import on file move
- **html** - HTML language server
- **cssls** - CSS/SCSS/Less
- **jsonls** - JSON with schema validation
- **tailwindcss** - Tailwind CSS IntelliSense
  - Custom class regex for cva, cx, clsx
- **eslint** - ESLint with auto-fix on save

### Systems Programming

#### C/C++ (`cpp.lua`)
- **clangd** - C/C++ language server
  - Background indexing
  - Clang-tidy integration
  - Header insertion (IWYU)
  - Function argument placeholders

#### Rust (`rust.lua`)
- **rust-analyzer** - Rust language server
  - Full Clippy integration
  - Cargo support with all features
  - Proc macro support
  - Comprehensive inlay hints
  - Hover actions and documentation

### Python (`python.lua`)
- **pyright** - Python type checker
  - Workspace-wide diagnostics
  - Auto-import completions
  - Library code type inference
  - Type checking mode: basic

### Configuration Languages

#### Nix (`nix.lua`)
- **nixd** - Nix language server
  - Formatting with alejandra
  - NixOS and Home Manager options
  - Nixpkgs expression evaluation

### Documentation

#### Markdown (`markdown.lua`)
- **marksman** - Markdown language server
  - Document symbols
  - Workspace symbols
  - References and rename support

#### LaTeX (`latex.lua`)
- **texlab** - LaTeX language server
  - Build with tectonic
  - SyncTeX support
  - 80-character line formatting
  - Chktex linting (disabled by default)

## ✏️ Customization

### Enable/Disable Languages

Comment out the require in `lua/configs/lspconfig.lua`:

```lua
-- require("configs.lsp.rust")  -- Disable Rust LSP
```

### Modify Language Settings

Edit the specific language file. For example, to change Rust settings:

```lua
-- lua/configs/lsp/rust.lua
vim.lsp.config.rust_analyzer = {
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                command = "check",  -- Change from "clippy" to "check"
            },
        }
    }
}
```

### Add New Language Servers

1. Create a new file: `lua/configs/lsp/mylang.lua`
2. Configure the server using `vim.lsp.config`
3. Enable it with `vim.lsp.enable()`
4. Require it in `lua/configs/lspconfig.lua`

Example:

```lua
-- lua/configs/lsp/mylang.lua
vim.lsp.config.mylangserver = {
    cmd = { "mylangserver", "--stdio" },
    filetypes = { "mylang" },
    root_markers = { ".mylang-project" },
}

vim.lsp.enable("mylangserver")

return {
    servers = { "mylangserver" },
}
```

Then add to `lspconfig.lua`:
```lua
require("configs.lsp.mylang")
```

## 🔧 Advanced Configuration

### On_Attach Callbacks

Add custom on_attach logic to any server:

```lua
vim.lsp.config.ts_ls = {
    -- ... other config
    on_attach = function(client, bufnr)
        -- Custom logic when LSP attaches
        print("TypeScript LSP attached!")
    end,
}
```

### Capabilities

Customize LSP capabilities:

```lua
vim.lsp.config.clangd = {
    capabilities = {
        offsetEncoding = { "utf-16" },
    },
}
```

### Root Directory Detection

Customize how the LSP finds the project root:

```lua
vim.lsp.config.myserver = {
    root_markers = {
        "package.json",
        ".git",
        "pyproject.toml",
    },
}
```

## 📚 Benefits of Modular Structure

### ✅ Organization
- Each language in its own file
- Easy to find and modify settings
- Clear separation of concerns

### ✅ Maintainability
- Update one language without affecting others
- Easy to add/remove languages
- Self-documenting structure

### ✅ Flexibility
- Enable/disable languages by commenting requires
- Override settings per language
- Test configurations in isolation

### ✅ Scalability
- Add new languages without modifying existing files
- Keep main config file clean and simple
- Easy to share language-specific configs

## 🐛 Troubleshooting

### LSP Not Attaching

1. Check if server is installed:
   ```bash
   which typescript-language-server
   ```

2. Check LSP status:
   ```vim
   :LspInfo
   ```

3. Check logs:
   ```vim
   :lua vim.cmd('e '..vim.lsp.get_log_path())
   ```

### Server Configuration Issues

1. Verify the config is loaded:
   ```vim
   :lua print(vim.inspect(vim.lsp.config.ts_ls))
   ```

2. Check for syntax errors:
   ```vim
   :checkhealth
   ```

### Server Not Found

Make sure the server binary is in your PATH and the `cmd` array is correct.

## 📖 References

- [Neovim LSP Documentation](https://neovim.io/doc/user/lsp.html)
- [vim.lsp.config Guide](https://neovim.io/doc/user/lsp.html#lspconfig-nvim-0.11)
- [Language Server Protocol Spec](https://microsoft.github.io/language-server-protocol/)

## 💡 Tips

1. **Keep settings organized** - Group related settings together
2. **Document custom settings** - Add comments explaining non-obvious configs
3. **Test incrementally** - Enable one language at a time when adding new servers
4. **Use defaults wisely** - Only override what you need to change
5. **Check server docs** - Each LSP server has unique configuration options

## 🔄 Migration from Old API

If you have old `lspconfig.setup()` code:

**Old (deprecated):**
```lua
local lspconfig = require('lspconfig')
lspconfig.ts_ls.setup({
    settings = { ... }
})
```

**New (Neovim 0.11+):**
```lua
vim.lsp.config.ts_ls = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "javascript" },
    root_markers = { "package.json" },
    settings = { ... }
}
vim.lsp.enable("ts_ls")
```

Key differences:
- Use `vim.lsp.config.<name>` instead of `lspconfig.<name>.setup()`
- Must specify `cmd`, `filetypes`, and `root_markers` explicitly
- Call `vim.lsp.enable()` to activate the server
- No need to require `lspconfig` module