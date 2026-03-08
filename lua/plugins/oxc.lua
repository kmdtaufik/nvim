return {
  -- 1. Setup Oxlint as an LSP (Real-time diagnostics)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- According to the docs you linked, oxlint has a built-in LSP.
        -- We don't need a complex 'setup' function here because oxlint
        -- does not format code; it just sends diagnostics.
        oxlint = {},
      },
    },
  },

  -- 2. Setup Oxfmt for formatting (Replacing Prettier)
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      -- Based on the Oxfmt Beta release, it now supports all these filetypes
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

      -- Explicitly define the oxfmt command just in case conform.nvim
      -- hasn't updated its default registry for the Beta yet.
      -- The docs mention it now supports reading from stdin.
      opts.formatters = opts.formatters or {}
      opts.formatters.oxfmt = {
        command = "oxfmt",
        args = { "--stdin-filepath", "$FILENAME" },
      }
    end,
  },

  -- 3. Mason Installation
  {
    "mason/mason.nvim",
    opts = {
      ensure_installed = {
        "oxlint",
        -- Note: If Mason fails to install oxfmt because it's too new,
        -- just comment the line below out and ensure oxfmt is installed
        -- locally in your EasyCMS project via `bun add -D oxfmt`.
        "oxfmt",
      },
    },
  },
}
