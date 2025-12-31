local options = {
  formatters_by_ft = {
    -- Lua
    lua = { "stylua" },

    -- Web Development (JS/TS/React/Next/Vite)
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    json = { "prettierd" },
    jsonc = { "prettierd" },
    html = { "prettierd" },
    css = { "prettierd" },
    scss = { "prettierd" },
    less = { "prettierd" },
    yaml = { "prettierd" },
    graphql = { "prettierd" },

    -- Python
    python = { "isort", "black" },

    -- Rust
    rust = { "rustfmt" },

    -- C/C++
    c = { "clang-format" },
    cpp = { "clang-format" },

    -- Nix
    nix = { "alejandra" },

    -- Markdown
    markdown = { "prettierd" },

    -- LaTeX (using latexindent if available, otherwise skip)
    -- tex = { "latexindent" },
  },

  -- format on save
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },

  -- Format on save with async formatting
  -- format_on_save = function(bufnr)
  --   return {
  --     timeout_ms = 500,
  --     lsp_fallback = true,
  --     bufnr = bufnr,
  --   }
  -- end,

  -- Format after save (non-blocking)
  -- format_after_save = {
  --   lsp_fallback = true,
  -- },

  -- Notify on format errors
  notify_on_error = true,

  -- Formatters configuration
  formatters = {
    -- Prettier configuration
    prettierd = {
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/.prettierrc.json"),
      },
    },

    -- Black configuration (Python)
    black = {
      prepend_args = { "--fast", "--line-length", "88" },
    },

    -- isort configuration (Python imports)
    isort = {
      prepend_args = { "--profile", "black" },
    },

    -- Rustfmt configuration
    rustfmt = {
      prepend_args = { "--edition", "2021" },
    },

    -- Clang-format configuration (C/C++)
    ["clang-format"] = {
      prepend_args = { "--style=LLVM" },
    },
  },
}

return options
