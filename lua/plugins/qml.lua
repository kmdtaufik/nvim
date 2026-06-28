return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "qmljs" })
      else
        opts.ensure_installed = { "qmljs" }
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        qmlls = {
          filetypes = { "qml", "qmljs" },
        },
      },
    },
  },
}
