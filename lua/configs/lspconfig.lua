-- LSP Configuration Entry Point
-- This file loads all language-specific LSP configurations from the lsp/ directory
-- Each language has its own configuration file for better organization

-- Load NvChad LSP defaults
require("nvchad.configs.lspconfig").defaults()

-- Import all language-specific configurations
-- Each module configures and enables its respective language servers

-- Web Development (JS/TS/React/HTML/CSS/JSON/ESLint/Tailwind)
require("configs.lsp.web")

-- C/C++ (Clangd)
require("configs.lsp.cpp")

-- Rust (rust-analyzer)
require("configs.lsp.rust")

-- Python (Pyright)
require("configs.lsp.python")

-- Nix (nixd)
require("configs.lsp.nix")

-- Markdown (Marksman)
require("configs.lsp.markdown")

-- LaTeX (Texlab)
require("configs.lsp.latex")

-- Note: Each language configuration file:
-- 1. Defines vim.lsp.config.<server_name> with full settings
-- 2. Calls vim.lsp.enable() for that server
-- 3. Returns a table with the server names
--
-- This modular approach makes it easy to:
-- - Enable/disable languages by commenting out requires
-- - Customize per-language settings in dedicated files
-- - Keep configuration organized and maintainable
