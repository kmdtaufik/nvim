return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- Enable format on save
        opts = require "configs.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
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
                "javascript",
                "typescript",
                "tsx",
                "jsx",
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

            highlight = {
                enable = true,
                use_languagetree = true,
            },

            indent = {
                enable = true,
            },

            -- Enable incremental selection
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },

            -- Enable text objects
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                },
            },
        },
    },

    -- Additional useful plugins for development
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "html",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "xml",
        },
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },

    -- LSPSaga removed due to deprecated API warnings in Neovim 0.11+
    -- Built-in LSP UI is excellent, no need for additional plugin

    -- Rust-specific tools
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
            vim.g.rustfmt_emit_files = 1
            vim.g.rustfmt_fail_silently = 0
        end,
    },

    -- Better diagnostics
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        opts = {},
    },
}
