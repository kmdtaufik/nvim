-- Rust Language Server Configuration
-- Using rust-analyzer with full Clippy and Cargo integration

vim.lsp.config.rust_analyzer = {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", "rust-project.json" },
    settings = {
        ['rust-analyzer'] = {
            -- Cargo settings
            cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                buildScripts = {
                    enable = true,
                },
                autoreload = true,
            },

            -- Check on save with Clippy
            checkOnSave = {
                command = "clippy",
                extraArgs = { "--no-deps" },
                allTargets = true,
            },

            -- Procedural macro support
            procMacro = {
                enable = true,
                attributes = {
                    enable = true,
                },
                ignored = {
                    ["async-trait"] = { "async_trait" },
                    ["napi-derive"] = { "napi" },
                    ["async-recursion"] = { "async_recursion" },
                },
            },

            -- Inlay hints
            inlayHints = {
                enable = true,
                lifetimeElisionHints = {
                    enable = "always",
                    useParameterNames = true,
                },
                chainingHints = {
                    enable = true,
                },
                closingBraceHints = {
                    enable = true,
                    minLines = 25,
                },
                closureReturnTypeHints = {
                    enable = "always",
                },
                discriminantHints = {
                    enable = "always",
                },
                expressionAdjustmentHints = {
                    enable = "always",
                },
                parameterHints = {
                    enable = true,
                },
                reborrowHints = {
                    enable = "always",
                },
                typeHints = {
                    enable = true,
                    hideClosureInitialization = false,
                    hideNamedConstructor = false,
                },
            },

            -- Diagnostics
            diagnostics = {
                enable = true,
                experimental = {
                    enable = true,
                },
            },

            -- Hover actions
            hover = {
                actions = {
                    enable = true,
                    references = {
                        enable = true,
                    },
                    run = {
                        enable = true,
                    },
                    debug = {
                        enable = true,
                    },
                    gotoTypeDef = {
                        enable = true,
                    },
                },
                documentation = {
                    enable = true,
                },
            },

            -- Completion
            completion = {
                autoimport = {
                    enable = true,
                },
                autoself = {
                    enable = true,
                },
                callable = {
                    snippets = "fill_arguments",
                },
                postfix = {
                    enable = true,
                },
                privateEditable = {
                    enable = false,
                },
            },

            -- Assist
            assist = {
                importEnforceGranularity = true,
                importPrefix = "crate",
            },

            -- Lens
            lens = {
                enable = true,
                debug = {
                    enable = true,
                },
                implementations = {
                    enable = true,
                },
                references = {
                    adt = {
                        enable = true,
                    },
                    enumVariant = {
                        enable = true,
                    },
                    method = {
                        enable = true,
                    },
                    trait = {
                        enable = true,
                    },
                },
                run = {
                    enable = true,
                },
            },

            -- Rustfmt
            rustfmt = {
                extraArgs = {},
                overrideCommand = nil,
                rangeFormatting = {
                    enable = false,
                },
            },

            -- Semantic tokens
            semanticHighlighting = {
                strings = {
                    enable = true,
                },
            },
        }
    }
}

-- Enable rust-analyzer
vim.lsp.enable("rust_analyzer")

return {
    servers = { "rust_analyzer" },
}
