-- Sidekick.nvim Configuration
-- AI Sidekick with Copilot Next Edit Suggestions (NES) and AI CLI Integration
-- Location: ~/.config/nvim/lua/configs/sidekick.lua

local M = {}

-- Sidekick configuration options
M.opts = {
    -- Next Edit Suggestions (NES) Configuration
    nes = {
        enabled = true, -- Enable NES by default (requires GitHub Copilot)
        debounce = 100, -- Debounce time in milliseconds before requesting suggestions

        -- Events that trigger new NES requests
        trigger = {
            events = {
                "ModeChanged i:n",     -- When leaving insert mode
                "TextChanged",         -- When text changes in normal mode
                "User SidekickNesDone" -- After applying previous edit
            },
        },

        -- Events that clear current suggestions
        clear = {
            events = {
                "TextChangedI", -- When typing in insert mode
                "InsertEnter"   -- When entering insert mode
            },
            esc = true,         -- Clear suggestions when pressing <Esc>
        },

        -- Diff visualization options
        diff = {
            inline = "words", -- Show inline diffs at word level ("words", "chars", or false)
        },
    },

    -- Jump behavior configuration
    jump = {
        jumplist = true, -- Add entries to jumplist when jumping to edits
    },

    -- Sign column configuration
    signs = {
        enabled = true, -- Show signs in sign column for edits
        icon = " ",     -- Icon to use for edit signs
    },

    -- AI CLI Integration Configuration
    cli = {
        watch = true, -- Automatically reload files changed by AI tools

        -- Window configuration
        win = {
            layout = "right", -- Window position: "float", "left", "bottom", "top", "right"

            -- Window options
            wo = {},
            bo = {},

            -- Float window configuration (when layout = "float")
            float = {
                width = 0.9,  -- 90% of screen width
                height = 0.9, -- 90% of screen height
            },

            -- Split window configuration (when layout = "left", "right", "top", "bottom")
            split = {
                width = 80,  -- Width for vertical splits (left/right)
                height = 20, -- Height for horizontal splits (top/bottom)
            },

            -- Keymaps available inside the CLI terminal window
            keys = {
                -- Buffer and file pickers
                buffers = { "<c-b>", "buffers", mode = "nt", desc = "Open buffer picker" },
                files = { "<c-f>", "files", mode = "nt", desc = "Open file picker" },

                -- Hide window keymaps
                hide_n = { "q", "hide", mode = "n", desc = "Hide terminal window" },
                hide_ctrl_q = { "<c-q>", "hide", mode = "n", desc = "Hide terminal window" },
                hide_ctrl_dot = { "<c-.>", "hide", mode = "nt", desc = "Hide terminal window" },
                hide_ctrl_z = { "<c-z>", "hide", mode = "nt", desc = "Hide terminal window" },

                -- Prompt insertion
                prompt = { "<c-p>", "prompt", mode = "t", desc = "Insert prompt or context" },

                -- Exit terminal mode
                stopinsert = { "<c-q>", "stopinsert", mode = "t", desc = "Enter normal mode" },

                -- Window navigation (only active when there's a window in that direction)
                nav_left = { "<c-h>", "nav_left", expr = true, desc = "Navigate to left window" },
                nav_down = { "<c-j>", "nav_down", expr = true, desc = "Navigate to below window" },
                nav_up = { "<c-k>", "nav_up", expr = true, desc = "Navigate to above window" },
                nav_right = { "<c-l>", "nav_right", expr = true, desc = "Navigate to right window" },
            },

            -- Custom window navigation function (optional)
            nav = nil, -- Defaults to vim.cmd.wincmd

            -- Custom configuration function called when creating terminal
            config = function(terminal)
                -- terminal.opts can be modified here
            end,
        },

        -- Multiplexer configuration for persistent AI sessions
        mux = {
            backend = vim.env.ZELLIJ and "zellij" or "tmux", -- Auto-detect multiplexer
            enabled = true,                                  -- Enable persistent sessions across Neovim restarts
            create = "terminal",                             -- "terminal", "window", or "split" (zellij only supports "terminal")
            split = {
                vertical = true,                             -- Vertical or horizontal split
                size = 0.5,                                  -- Size of split (0-1 for percentage)
            },
        },

        -- AI CLI Tools Configuration
        tools = {
            -- Anthropic Claude Code
            claude = {
                cmd = { "claude" },
            },

            -- Google Gemini CLI
            gemini = {
                cmd = { "gemini" },
            },

            -- xAI Grok
            grok = {
                cmd = { "grok" },
            },

            -- OpenAI Codex
            codex = {
                cmd = { "codex", "--enable", "web_search_request" },
            },

            -- GitHub Copilot CLI
            copilot = {
                cmd = { "copilot", "--banner" },
            },

            -- Aider AI pair programmer
            aider = {
                cmd = { "aider" },
            },

            -- Cursor AI agent
            cursor = {
                cmd = { "cursor-agent" },
            },

            -- OpenCode
            opencode = {
                cmd = { "opencode" },
                env = { OPENCODE_THEME = "system" },
            },

            -- Qwen Code
            qwen = {
                cmd = { "qwen" },
            },

            -- Amazon Q Developer
            amazon_q = {
                cmd = { "q" },
            },

            -- Charm's Crush AI assistant
            crush = {
                cmd = { "crush" },
                -- Override default prompt keymap for crush
                keys = {
                    prompt = { "<a-p>", "prompt" },
                },
            },
        },

        -- Custom context variables (can add more)
        context = {},

        -- Predefined Prompts Library
        prompts = {
            -- Code Review & Improvement
            changes = "Can you review my changes?",
            review = "Can you review {file} for any issues or improvements?",
            explain = "Explain {this}",
            optimize = "How can {this} be optimized?",

            -- Bug Fixing
            fix = "Can you fix {this}?",
            diagnostics = "Can you help me fix the diagnostics in {file}?\n{diagnostics}",
            diagnostics_all = "Can you help me fix these diagnostics?\n{diagnostics_all}",

            -- Documentation & Testing
            document = "Add documentation to {function|line}",
            tests = "Can you write tests for {this}?",

            -- Context-Only Prompts (just send context variables)
            buffers = "{buffers}",
            file = "{file}",
            line = "{line}",
            position = "{position}",
            quickfix = "{quickfix}",
            selection = "{selection}",
            ["function"] = "{function}",
            class = "{class}",
        },

        -- Picker for file/tool selection
        picker = "snacks", -- "snacks", "telescope", or "fzf-lua"
    },

    -- Copilot Status Configuration
    copilot = {
        status = {
            enabled = true,              -- Track Copilot status with didChangeStatus
            level = vim.log.levels.WARN, -- Notification level (or vim.log.levels.OFF to disable)
        },
    },

    -- UI Configuration
    ui = {
        icons = {
            attached = " ", -- Copilot attached
            started = " ", -- Copilot started
            installed = " ", -- Tool installed
            missing = " ", -- Tool not found
            external_attached = "󰖩 ", -- External tool attached
            external_started = "󰖪 ", -- External tool started
            terminal_attached = " ", -- Terminal attached
            terminal_started = " ", -- Terminal started
        },
    },

    -- Debug Configuration
    debug = false, -- Enable debug logging
}

return M
