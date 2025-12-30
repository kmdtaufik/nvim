-- Nix Language Server Configuration
-- Using nixd for Nix language support

vim.lsp.config.nixd = {
    cmd = { "nixd" },
    filetypes = { "nix" },
    root_markers = {
        "flake.nix",
        "default.nix",
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
                enable = true,

                -- NixOS options
                nixos = {
                    expr = '(builtins.getFlake "/etc/nixos").nixosConfigurations.<hostname>.options',
                },

                -- Home Manager options
                ["home-manager"] = {
                    expr = '(builtins.getFlake "/etc/nixos").homeConfigurations.<username>.options',
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
