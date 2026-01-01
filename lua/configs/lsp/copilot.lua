-- Copilot Language Server Configuration
-- GitHub Copilot LSP for Next Edit Suggestions (NES) via sidekick.nvim
-- Requires GitHub Copilot subscription

-- Copilot LSP Configuration
vim.lsp.config.copilot = {
    cmd = { "copilot", "--stdio" },
    filetypes = {
        -- Version control and documentation
        "gitcommit",
        "markdown",
        "yaml",

        -- Web development
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "html",
        "css",
        "scss",
        "json",
        "vue",
        "svelte",

        -- Systems programming
        "rust",
        "c",
        "cpp",

        -- Scripting and general purpose
        "python",
        "lua",
        "sh",
        "bash",
        "zsh",

        -- Configuration
        "nix",
        "toml",

        -- Documentation
        "tex",
        "plaintex",
    },
    root_markers = { ".git" },
    single_file_support = true,
    settings = {},
}

-- Enable Copilot LSP
vim.lsp.enable("copilot")

-- Return server name for reference
return { "copilot" }
