# NvChad Quick Reference Cheatsheet

## 🎯 Essential Keybindings

### Leader Key: `<Space>`

## 🔍 Finding & Navigation

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fa` | Find all files |
| `<leader>fw` | Find word (grep) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Find help tags |
| `<leader>fo` | Find old files |
| `<leader>fz` | Find in current buffer |
| `<leader>cm` | Find git commits |
| `<leader>gt` | Find git status |
| `<leader>pt` | Find pick hidden term |
| `<leader>ma` | Find bookmarks |
| `<leader>th` | Find themes |

## 📝 File Operations

| Key | Action |
|-----|--------|
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `<C-s>` | Save file (alternative) |
| `<leader>n` | New buffer |
| `<leader>x` | Close buffer |

## 🌳 File Explorer (NvimTree)

| Key | Action |
|-----|--------|
| `<C-n>` | Toggle NvimTree |
| `<leader>e` | Focus NvimTree |

### Inside NvimTree:
| Key | Action |
|-----|--------|
| `a` | Add file/folder |
| `d` | Delete |
| `r` | Rename |
| `x` | Cut |
| `c` | Copy |
| `p` | Paste |
| `y` | Copy name |
| `Y` | Copy relative path |
| `gy` | Copy absolute path |
| `o` | Open file |
| `<CR>` | Open file |
| `<Tab>` | Open file (keep tree) |
| `H` | Toggle hidden files |
| `R` | Refresh |

## 🪟 Window Management

| Key | Action |
|-----|--------|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to down window |
| `<C-k>` | Move to up window |
| `<C-l>` | Move to right window |
| `<C-Up>` | Increase height |
| `<C-Down>` | Decrease height |
| `<C-Left>` | Decrease width |
| `<C-Right>` | Increase width |

## 📑 Buffer/Tab Management

| Key | Action |
|-----|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>x` | Close buffer |
| `<leader>b` | New buffer |

## 🔧 LSP Features

### Navigation
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Show references |
| `K` | Hover documentation |
| `<leader>D` | Type definition |
| `<leader>sh` | Signature help |

### Code Actions
| Key | Action |
|-----|--------|
| `<leader>ca` | Code action |
| `<leader>ra` | Rename symbol |
| `<leader>fm` | Format file/selection |

### Diagnostics
| Key | Action |
|-----|--------|
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>e` | Show diagnostic float |
| `<leader>dl` | Diagnostic location list |

## 🔍 Additional LSP Features

| Key | Action |
|-----|--------|
| `gh` | Find references |
| `<leader>o` | Document symbols |
| `gp` | Peek definition |
| `<leader>cd` | Line diagnostics |

## 🐛 Trouble (Diagnostics Viewer)

| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle diagnostics |
| `<leader>xX` | Buffer diagnostics |
| `<leader>cs` | Symbols |
| `<leader>xL` | Location list |
| `<leader>xQ` | Quickfix list |

## ✍️ Editing

### Basic
| Key | Action |
|-----|--------|
| `jk` | Exit insert mode |
| `;` | Enter command mode |
| `<leader>fm` | Format document |

### Visual Mode
| Key | Action |
|-----|--------|
| `<` | Indent left (reselect) |
| `>` | Indent right (reselect) |
| `J` | Move text down |
| `K` | Move text up |
| `p` | Paste without yanking |

### Comments
| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment |
| `gbc` | Toggle block comment |
| `gc` (visual) | Toggle comment |

## 🎨 UI & Themes

| Key | Action |
|-----|--------|
| `<leader>th` | Theme picker |
| `<leader>uu` | Update NvChad |

## 📟 Terminal

| Key | Action |
|-----|--------|
| `<A-i>` | Toggle floating terminal |
| `<A-h>` | Toggle horizontal terminal |
| `<A-v>` | Toggle vertical terminal |
| `<leader>h` | New horizontal term |
| `<leader>v` | New vertical term |

### Inside Terminal:
| Key | Action |
|-----|--------|
| `<C-x>` | Exit terminal mode |
| `<A-i>` | Toggle terminal |

## 🦀 Rust Specific

| Key | Action |
|-----|--------|
| `<leader>rr` | Run Rust program |
| `<leader>rt` | Run Rust tests |

## 📄 LaTeX Specific

| Key | Action |
|-----|--------|
| `<leader>lb` | Build LaTeX document |
| `<leader>lf` | Forward search |

## 🔤 Which-Key (Help)

| Key | Action |
|-----|--------|
| `<leader>` (wait) | Show all leader keymaps |
| `<leader>wK` | Show which-key |
| `<leader>wk` | Show which-key (query) |

## 📊 Git Integration

| Key | Action |
|-----|--------|
| `<leader>cm` | Git commits |
| `<leader>gt` | Git status |

## 🎯 Marks & Bookmarks

| Key | Action |
|-----|--------|
| `m<letter>` | Set mark |
| `'<letter>` | Jump to mark |
| `<leader>ma` | Find marks |

## 🔍 Search & Replace

| Key | Action |
|-----|--------|
| `/` | Search forward |
| `?` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `*` | Search word under cursor |
| `:%s/old/new/g` | Replace all |
| `:%s/old/new/gc` | Replace with confirm |

## 🎓 Advanced Tips

### Multiple Cursors (Visual Block)
1. `<C-v>` - Enter visual block mode
2. Select lines with `j/k`
3. `I` - Insert at start
4. `A` - Insert at end
5. `<Esc>` - Apply to all lines

### Macros
1. `q<letter>` - Start recording
2. Perform actions
3. `q` - Stop recording
4. `@<letter>` - Replay macro
5. `@@` - Replay last macro

### Folding
| Key | Action |
|-----|--------|
| `za` | Toggle fold |
| `zA` | Toggle all folds |
| `zc` | Close fold |
| `zo` | Open fold |
| `zM` | Close all folds |
| `zR` | Open all folds |

## 🚀 Productivity Commands

```vim
:Lazy                 " Plugin manager
:LspInfo             " LSP status
:ConformInfo         " Formatter status
:TSUpdate            " Update Treesitter
:checkhealth         " Health check
:Telescope keymaps   " Search all keymaps
:messages            " Show messages
:Mason               " NOT USED (system packages)
```

## 📝 Quick Notes

- **Auto-format on save**: Enabled by default
- **Auto-save**: Use `<leader>w` or `<C-s>`
- **Exit insert mode**: Use `jk` (faster than Esc)
- **Command mode**: Use `;` (faster than `:`)
- **Hover docs**: Press `K` twice to enter hover window
- **Go back**: Use `<C-o>` after jumping to definition

## 🎨 Color & Syntax

Current theme: **onedark**

All syntax highlighting powered by **Treesitter** for:
- JavaScript/TypeScript/JSX/TSX
- Rust, C/C++, Python
- HTML/CSS, JSON, Markdown
- LaTeX, Nix, Bash
- And more!

Built-in LSP UI features (Neovim 0.11+):
- Native floating windows
- Clean diagnostics display
- No deprecated APIs

## 🔄 Common Workflows

### Web Development (React/Next.js)
1. `<leader>ff` - Find component
2. `gd` - Jump to definition
3. `<leader>ca` - Quick fix/refactor
4. `<leader>fm` - Format with Prettier
5. Auto-fixes ESLint on save

### Rust Development
1. `<leader>ff` - Find module
2. `K` - View docs
3. `<leader>rr` - Run program
4. `<leader>rt` - Run tests
5. Auto-format with rustfmt on save

### Python Development
1. `<leader>ff` - Find file
2. `gd` - Jump to definition
3. `<leader>ca` - Type-aware refactoring
4. Auto-format with black+isort on save

### Documentation (LaTeX/Markdown)
1. Spell check enabled automatically
2. Line wrapping enabled
3. `<leader>lb` - Build LaTeX
4. Auto-format markdown with prettier

---

**Pro Tip**: Use `:Telescope keymaps` to search all available keybindings!

**Quick Help**: Type `<leader>` and wait to see all leader key options!