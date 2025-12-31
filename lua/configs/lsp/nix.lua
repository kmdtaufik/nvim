-- Nix Language Server Configuration
-- Using nixd for Nix language support

vim.lsp.config.nixd = {
  cmd = { "nixd" },
  filetypes = { "nix" },
  root_markers = {
    "flake.nix",
    "shell.nix",
    ".git"
  },
  settings = {
    nixd = {
      -- Formatting with alejandra
      formatting = {
        command = { "alejandra" },
      },

      -- Diagnostics
      diagnostic = {
        suppress = {},
      },

      -- Nixpkgs options
      nixpkgs = {
        -- Expression to get nixpkgs
        expr = "import <nixpkgs> { }",
      },

      -- Options for NixOS, home-manager, etc.
      options = {
        -- Enable options completion
        -- enable = true,

        -- NixOS options
        nixos = {
          expr = '(builtins.getFlake ("git+file://" + toString ~/abyss)).nixosConfigurations.nixos.options',
        },

        -- -- Home Manager options
        home_manager = {
          expr =
          '(builtins.getFlake ("git+file://" + toString ~/abyss)).nixosConfigurations.nixos.options.home-manager.users.type.getSubOptions []',
        },
      },
    },
  },
}

-- Enable nixd
vim.lsp.enable("nixd")

return {
  servers = { "nixd" },
}
