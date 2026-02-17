return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- 1. Ensure the default 'nil' LSP doesn't conflict with nixd
      servers = {
        nil_ls = { enabled = false },

        -- 2. Define your nixd configuration
        nixd = {
          cmd = { "nixd" },
          filetypes = { "nix" },

          -- 3. Your exact settings block
          settings = {
            nixd = {
              -- formatting = {
              --   command = { "alejandra" },
              -- },
              -- diagnostic = {
              --   suppress = {},
              -- },
              nixpkgs = {
                expr = "import <nixpkgs> { }",
              },
              options = {
                nixos = {
                  expr = '(builtins.getFlake ("git+file://" + toString ~/abyss)).nixosConfigurations.nixos.options',
                },
                home_manager = {
                  expr = '(builtins.getFlake ("git+file://" + toString ~/abyss)).nixosConfigurations.nixos.options.home-manager.users.type.getSubOptions []',
                },
              },
            },
          },
        },
      },
    },
  },

  -- 4. Tell LazyVim's formatting engine (Conform) to use Alejandra
  -- This ensures <leader>cf (Format) uses the right tool.
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        nix = { "alejandra" },
      },
    },
  },
}
