-- Sidekick.nvim - AI Sidekick Plugin
-- Provides Next Edit Suggestions (NES) from Copilot LSP and integrated AI CLI terminal
-- Configuration: lua/configs/sidekick.lua
-- LSP Server: lua/configs/lsp/copilot.lua
if true then
  return {}
end
return {
  -- Sidekick.nvim - Main plugin
  {
    "folke/sidekick.nvim",
    event = "VeryLazy",
    dependencies = {
      "folke/snacks.nvim",     -- For picker and better UI
      "neovim/nvim-lspconfig", -- For Copilot LSP
    },
    opts = function()
      -- Load configuration from configs/sidekick.lua
      return require("configs.sidekick").opts
    end,
    keys = {
      -- ============================================
      -- Next Edit Suggestions (NES) Keymaps
      -- ============================================
      {
        "<Tab>",
        function()
          -- Jump to next edit or apply if at the last one
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- Fallback to normal Tab
          end
        end,
        expr = true,
        mode = { "i" }, -- Changed from "n" to "i" (insert mode only)
        desc = "Sidekick: Next Edit / Apply",
      },
      {
        "<leader>sn",
        function()
          require("sidekick.nes").toggle()
        end,
        desc = "Sidekick: Toggle NES",
      },
      {
        "<leader>su",
        function()
          require("sidekick.nes").update()
        end,
        desc = "Sidekick: Update NES",
      },
      {
        "<leader>sc",
        function()
          require("sidekick.nes").clear()
        end,
        desc = "Sidekick: Clear NES",
      },

      -- ============================================
      -- AI CLI Control Keymaps
      -- ============================================
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick: Toggle CLI",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<c-.>",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick: Toggle CLI",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select()
        end,
        desc = "Sidekick: Select CLI Tool",
      },
      {
        "<leader>ad",
        function()
          require("sidekick.cli").close()
        end,
        desc = "Sidekick: Close CLI Session",
      },

      -- ============================================
      -- Send Context to AI Keymaps
      -- ============================================
      {
        "<leader>at",
        function()
          require("sidekick.cli").send({ msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Sidekick: Send This",
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").send({ msg = "{file}" })
        end,
        desc = "Sidekick: Send File",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send({ msg = "{selection}" })
        end,
        mode = { "x" },
        desc = "Sidekick: Send Selection",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick: Select Prompt",
      },

      -- ============================================
      -- Quick Access to Specific AI Tools
      -- ============================================
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "claude", focus = true })
        end,
        desc = "Sidekick: Toggle Claude",
      },
      {
        "<leader>ag",
        function()
          require("sidekick.cli").toggle({ name = "gemini", focus = true })
        end,
        desc = "Sidekick: Toggle Gemini",
      },
      {
        "<leader>ax",
        function()
          require("sidekick.cli").toggle({ name = "grok", focus = true })
        end,
        desc = "Sidekick: Toggle Grok",
      },
      {
        "<leader>ao",
        function()
          require("sidekick.cli").toggle({ name = "codex", focus = true })
        end,
        desc = "Sidekick: Toggle Codex",
      },
    },
    init = function()
      -- Notification when Copilot LSP attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "copilot" then
            vim.notify("Copilot LSP attached", vim.log.levels.INFO, {
              title = "Sidekick",
            })
          end
        end,
      })
    end,
  },
}
