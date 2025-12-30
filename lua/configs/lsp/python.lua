-- Python Language Server Configuration
-- Using Pyright for type checking and analysis

vim.lsp.config.pyright = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
        ".git"
    },
    settings = {
        python = {
            analysis = {
                -- Auto search paths
                autoSearchPaths = true,

                -- Diagnostic mode (openFilesOnly or workspace)
                diagnosticMode = "workspace",

                -- Use library code for types
                useLibraryCodeForTypes = true,

                -- Type checking mode
                typeCheckingMode = "basic", -- off, basic, or strict

                -- Auto import completions
                autoImportCompletions = true,

                -- Diagnostics severity overrides
                diagnosticSeverityOverrides = {
                    reportUnusedImport = "information",
                    reportUnusedVariable = "information",
                    reportDuplicateImport = "warning",
                },

                -- Stub path
                stubPath = "typings",

                -- Extra paths
                extraPaths = {},

                -- Log level
                logLevel = "Information",
            },

            -- Linting (handled by black and isort via conform)
            linting = {
                enabled = false,
            },
        },
    },
}

-- Enable pyright
vim.lsp.enable("pyright")

return {
    servers = { "pyright" },
}
