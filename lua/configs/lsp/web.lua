-- Web Development Language Servers Configuration
-- JavaScript, TypeScript, React, HTML, CSS, JSON, ESLint, Tailwind

-- TypeScript/JavaScript Language Server
vim.lsp.config.ts_ls = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx"
    },
    root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
            suggest = {
                includeCompletionsForModuleExports = true,
            },
            updateImportsOnFileMove = {
                enabled = "always",
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
            suggest = {
                includeCompletionsForModuleExports = true,
            },
            updateImportsOnFileMove = {
                enabled = "always",
            },
        }
    }
}

-- HTML Language Server
vim.lsp.config.html = {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html", "templ" },
    root_markers = { "package.json", ".git" },
    settings = {
        html = {
            format = {
                enable = true,
            },
            hover = {
                documentation = true,
                references = true,
            },
        },
    },
}

-- CSS Language Server
vim.lsp.config.cssls = {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    root_markers = { "package.json", ".git" },
    settings = {
        css = {
            validate = true,
            lint = {
                unknownAtRules = "ignore",
            },
        },
        scss = {
            validate = true,
            lint = {
                unknownAtRules = "ignore",
            },
        },
        less = {
            validate = true,
            lint = {
                unknownAtRules = "ignore",
            },
        },
    },
}

-- JSON Language Server
vim.lsp.config.jsonls = {
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json", "jsonc" },
    root_markers = { "package.json", ".git" },
    settings = {
        json = {
            -- Schema validation
            validate = { enable = true },
            format = { enable = true },
            -- Add common schemas manually if needed
            -- Or install schemastore.nvim plugin for automatic schemas
        },
    },
}

-- Tailwind CSS Language Server
vim.lsp.config.tailwindcss = {
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "astro",
    },
    root_markers = {
        "tailwind.config.js",
        "tailwind.config.cjs",
        "tailwind.config.mjs",
        "tailwind.config.ts",
        "postcss.config.js",
        "postcss.config.cjs",
        "postcss.config.mjs",
        "postcss.config.ts",
    },
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    -- Support for cva (class-variance-authority)
                    { "cva\\(([^)]*)\\)",                           "[\"'`]([^\"'`]*).*?[\"'`]" },
                    -- Support for cx, clsx, classnames
                    { "cx\\(([^)]*)\\)",                            "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                    { "clsx\\(([^)]*)\\)",                          "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                    { "classnames\\(([^)]*)\\)",                    "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                    -- Support for className prop
                    { "className\\s*[:=]\\s*['\"`]([^'\"`]*)['\"`]" },
                    { "class\\s*[:=]\\s*['\"`]([^'\"`]*)['\"`]" },
                },
            },
            validate = true,
            lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidScreen = "error",
                invalidVariant = "error",
                invalidConfigPath = "error",
                invalidTailwindDirective = "error",
                recommendedVariantOrder = "warning",
            },
            classAttributes = {
                "class",
                "className",
                "classList",
                "ngClass",
            },
        },
    },
}

-- ESLint Language Server
vim.lsp.config.eslint = {
    cmd = { "vscode-eslint-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
        "svelte",
        "astro",
    },
    root_markers = {
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        ".eslintrc.json",
        "eslint.config.js",
        "eslint.config.mjs",
        "eslint.config.cjs",
        "package.json",
    },
    settings = {
        codeAction = {
            disableRuleComment = {
                enable = true,
                location = "separateLine",
            },
            showDocumentation = {
                enable = true,
            },
        },
        codeActionOnSave = {
            enable = false,
            mode = "all",
        },
        format = true,
        nodePath = "",
        onIgnoredFiles = "off",
        packageManager = "npm",
        quiet = false,
        rulesCustomizations = {},
        run = "onType",
        useESLintClass = false,
        validate = "on",
        workingDirectory = {
            mode = "location",
        },
    },
    on_attach = function(client, bufnr)
        -- Auto-fix on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.cmd("EslintFixAll")
            end,
        })
    end,
}

-- Enable all web development language servers
local web_servers = {
    "ts_ls",
    "html",
    "cssls",
    "jsonls",
    "tailwindcss",
    "eslint",
}

vim.lsp.enable(web_servers)

return {
    servers = web_servers,
}
