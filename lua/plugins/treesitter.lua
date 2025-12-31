-- Treesitter Plugin Configuration
-- Syntax highlighting, code parsing, and text objects
--
-- NOTE: JSX and TSX syntax are handled by the 'javascript' and 'tsx' parsers.
-- There is no separate 'jsx' parser - don't add it to the list!

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },

    opts = {
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
    },

    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
