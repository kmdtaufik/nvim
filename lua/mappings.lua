require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- LSP Keymaps
map("n", "gD", vim.lsp.buf.declaration, { desc = "LSP Go to declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "LSP Go to implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "LSP Show references" })
map("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover information" })
map("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "LSP Signature help" })
map("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "LSP Type definition" })
map("n", "<leader>ra", vim.lsp.buf.rename, { desc = "LSP Rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code action" })

-- Formatting
map("n", "<leader>fm", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })

map("v", "<leader>fm", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format selection" })

-- Diagnostics
-- map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
-- map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic in float" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Add diagnostics to location list" })
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostic location list" })

-- Trouble (diagnostics viewer)
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble Toggle diagnostics" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Trouble Buffer diagnostics" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Trouble Symbols" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Trouble Location list" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Trouble Quickfix list" })

-- Rust specific
map("n", "<leader>rr", "<cmd>RustRun<cr>", { desc = "Rust Run" })
map("n", "<leader>rt", "<cmd>RustTest<cr>", { desc = "Rust Test" })

-- Additional LSP keybinds (using built-in LSP)
map("n", "gh", vim.lsp.buf.references, { desc = "LSP Find references" })
map("n", "<leader>o", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "LSP Document symbols" })
map("n", "gp", function()
  -- Peek definition in floating window
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, 'textDocument/definition', params, function(_, result)
    if result == nil or vim.tbl_isempty(result) then
      return
    end
    vim.lsp.util.preview_location(result[1], { border = 'rounded' })
  end)
end, { desc = "LSP Peek definition" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "LSP Line diagnostics" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- Resize windows with arrows
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Better indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move text down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move text up" })

-- Stay in indent mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Better paste (don't yank replaced text)
map("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Quick save
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })

-- Quick quit
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Git keymaps (lazygit integration via snacks.nvim)
-- Note: Main lazygit keymaps are defined in lua/plugins/lazygit.lua
-- Additional git keymaps can be added here

-- Buffer navigation with Ctrl-Tab (since Tab is used by Sidekick in insert mode)
-- map("n", "<C-Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- map("n", "<C-S-Tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

-- LaTeX specific
map("n", "<leader>lb", "<cmd>TexlabBuild<cr>", { desc = "LaTeX Build" })
map("n", "<leader>lf", "<cmd>TexlabForward<cr>", { desc = "LaTeX Forward search" })
