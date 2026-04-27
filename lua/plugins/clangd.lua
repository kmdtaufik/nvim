return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          -- This tells LazyVim to configure clangd, but skip Mason installation
          mason = false,
        },
      },
    },
  },
}
