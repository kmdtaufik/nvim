-- Markdown Language Server Configuration
-- Using Marksman for Markdown language support

vim.lsp.config.marksman = {
    cmd = { "marksman", "server" },
    filetypes = { "markdown", "markdown.mdx" },
    root_markers = {
        ".marksman.toml",
        ".git",
        ".marksman.yaml",
    },
    settings = {
        marksman = {
            -- Enable diagnostics
            diagnostics = {
                enabled = true,
            },

            -- Enable code actions
            codeActions = {
                enabled = true,
            },

            -- Enable completion
            completion = {
                enabled = true,
            },

            -- Enable hover
            hover = {
                enabled = true,
            },

            -- Enable references
            references = {
                enabled = true,
            },

            -- Enable rename
            rename = {
                enabled = true,
            },

            -- Enable document symbols
            documentSymbols = {
                enabled = true,
            },

            -- Enable workspace symbols
            workspaceSymbols = {
                enabled = true,
            },
        },
    },
}

-- Enable marksman
vim.lsp.enable("marksman")

return {
    servers = { "marksman" },
}
