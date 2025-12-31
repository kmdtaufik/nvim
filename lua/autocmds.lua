require "nvchad.autocmds"

-- Custom autocommands

-- Filetype specific indentation settings
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python", "rust", "c", "cpp" },
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
    end,
    desc = "Set 4-space indentation for Python,Rust,C,C++",
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
