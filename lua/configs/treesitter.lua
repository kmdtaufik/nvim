local options = {
  -- Parsers to install
  ensure_installed = {
    -- Core
    "vim",
    "lua",
    "vimdoc",
    "luadoc",
    "printf",

    -- Web Development (JS/TS/React/Next/Vite/Tailwind)
    "html",
    "css",
    "scss",
    "javascript", -- Includes JSX support
    "typescript",
    "tsx",        -- TypeScript + JSX
    "json",
    "jsonc",
    "graphql",

    -- Systems Programming
    "rust",
    "toml", -- Rust Cargo.toml
    "c",
    "cpp",
    "cmake",

    -- Python
    "python",

    -- Nix
    "nix",

    -- Documentation
    "markdown",
    "markdown_inline",
    "latex",
    "bibtex",

    -- Other useful
    "bash",
    "yaml",
    "regex",
    "gitignore",
    "gitcommit",
    "diff",
  },

  -- Auto-install parsers when entering buffer
  auto_install = true,

  -- Syntax highlighting
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },

  -- Indentation based on treesitter
  indent = {
    enable = true,
  },

  -- Incremental selection based on named nodes
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },

  -- Text objects for better code navigation
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj
    },
  },

}
return options
