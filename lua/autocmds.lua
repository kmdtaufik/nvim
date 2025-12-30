require "nvchad.autocmds"

-- Custom autocommands

-- Filetype specific indentation settings
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python" },
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
    end,
    desc = "Set 4-space indentation for Python",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "rust" },
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
    end,
    desc = "Set 4-space indentation for Rust",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
    end,
    desc = "Set 4-space indentation for C/C++",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "tex" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.spell = true
    end,
    desc = "Enable line wrapping and spell check for Markdown and LaTeX",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "nix" },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end,
    desc = "Set 2-space indentation for Nix",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
    end,
    desc = "Highlight yanked text briefly",
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
    desc = "Remove trailing whitespace on save",
})

-- Auto-format on save for specific filetypes
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {
        "*.lua",
        "*.rs",
        "*.py",
        "*.js",
        "*.jsx",
        "*.ts",
        "*.tsx",
        "*.json",
        "*.html",
        "*.css",
        "*.scss",
        "*.md",
        "*.nix",
        "*.c",
        "*.cpp",
    },
    callback = function()
        require("conform").format({ async = false, lsp_fallback = true })
    end,
    desc = "Auto-format on save using conform.nvim",
})
