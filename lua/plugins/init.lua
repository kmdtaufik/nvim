-- Plugin Specifications
-- Simple plugins with minimal configuration are defined here.
-- Complex plugins with extensive configs are in separate files (treesitter.lua, trouble.lua, etc.)

return {
    -- Formatter (conform.nvim)
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        opts = require "configs.conform",
    },

    -- LSP Configuration
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- Auto-close HTML/JSX tags
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "html",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "svelte",
            "vue",
            "tsx",
            "xml",
            "php",
            "markdown",
        },
        opts = {
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = false,
            },
        },
    },

    -- Rust tooling
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
            vim.g.rustfmt_emit_files = 1
            vim.g.rustfmt_fail_silently = 0
            vim.g.rust_recommended_style = 1
            vim.g.rustfmt_options = "--edition 2021"
        end,
    },
}
