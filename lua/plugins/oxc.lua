return {
  -- 1. Setup Oxlint as an LSP (Real-time diagnostics)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        oxlint = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      local supported = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "json",
        "jsonc",
        "css",
        "markdown",
        "html",
      }

      for _, ft in ipairs(supported) do
        -- Completely replace Prettier with oxfmt for these filetypes
        opts.formatters_by_ft[ft] = { "oxfmt" }
      end

      opts.formatters = opts.formatters or {}
      opts.formatters.oxfmt = {
        command = "oxfmt",
        args = { "--stdin-filepath", "$FILENAME" },
      }
    end,
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "oxlint",
        "oxfmt",
      },
    },
  },
}
