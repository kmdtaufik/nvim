-- LaTeX Language Server Configuration
-- Using Texlab with tectonic build system

vim.lsp.config.texlab = {
    cmd = { "texlab" },
    filetypes = { "tex", "plaintex", "bib" },
    root_markers = {
        ".latexmkrc",
        ".git",
        "main.tex",
        "*.tex",
    },
    settings = {
        texlab = {
            -- Build settings
            build = {
                -- Use tectonic as the build engine
                executable = "tectonic",
                args = {
                    "-X",
                    "compile",
                    "%f",
                    "--synctex",
                    "--keep-logs",
                    "--keep-intermediates"
                },
                onSave = false,
                forwardSearchAfter = false,
            },

            -- Auxiliary directory
            auxDirectory = ".",

            -- Forward search (SyncTeX)
            forwardSearch = {
                executable = nil,
                args = {},
            },

            -- Chktex linting
            chktex = {
                onOpenAndSave = false,
                onEdit = false,
            },

            -- Diagnostics
            diagnosticsDelay = 300,

            -- Formatter settings
            formatterLineLength = 80,

            -- Latexindent formatting
            latexindent = {
                modifyLineBreaks = false,
            },

            -- Completion settings
            completion = {
                matcher = "fuzzy",
            },

            -- Experimental features
            experimental = {
                followPackageLinks = true,
            },

            -- Bibtex formatting
            bibtexFormatter = "texlab",

            -- LaTeX formatter
            latexFormatter = "latexindent",
        },
    },
}

-- Enable texlab
vim.lsp.enable("texlab")

return {
    servers = { "texlab" },
}
