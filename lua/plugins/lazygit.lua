-- Lazygit Integration
-- Provides a floating terminal window for lazygit, similar to LazyVim's implementation
-- Uses snacks.nvim for terminal management

return {
    -- snacks.nvim - provides various utilities including terminal and lazygit integration
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- Enable bigfile detection (disables heavy features for large files)
            bigfile = { enabled = true },
            -- Enable notifications
            notifier = {
                enabled = true,
                timeout = 3000,
            },
            -- Enable quickfile (faster file opening)
            quickfile = { enabled = true },
            -- Enable statuscolumn enhancements
            statuscolumn = { enabled = false }, -- NvChad handles this
            -- Enable word highlighting under cursor
            words = { enabled = true },
            -- Lazygit configuration
            lazygit = {
                enabled = true,
                configure = true,
                -- Set a custom theme for lazygit
                theme = {
                    [241] = { fg = "Special" },
                    activeBorderColor = { fg = "MatchParen", bold = true },
                    cherryPickedCommitBgColor = { fg = "Identifier" },
                    cherryPickedCommitFgColor = { fg = "Function" },
                    defaultFgColor = { fg = "Normal" },
                    inactiveBorderColor = { fg = "FloatBorder" },
                    optionsTextColor = { fg = "Function" },
                    searchingActiveBorderColor = { fg = "MatchParen", bold = true },
                    selectedLineBgColor = { bg = "Visual" },
                    unstagedChangesColor = { fg = "DiagnosticError" },
                },
            },
            -- Terminal configuration
            terminal = {
                enabled = true,
                win = {
                    style = "terminal",
                    height = 0.9,
                    width = 0.9,
                },
            },
            -- Styles configuration for consistent window appearance
            styles = {
                notification = {
                    wo = { wrap = true },
                },
                terminal = {
                    bo = {
                        filetype = "snacks_terminal",
                    },
                    wo = {},
                    keys = {
                        q = "hide",
                        gf = function(self)
                            local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
                            if f == "" then
                                Snacks.notifier.warn("No file found")
                            else
                                self:hide()
                                vim.schedule(function()
                                    vim.cmd("e " .. f)
                                end)
                            end
                        end,
                        term_normal = {
                            "<esc>",
                            function(self)
                                self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
                                if self.esc_timer:is_active() then
                                    self.esc_timer:stop()
                                    vim.cmd("stopinsert")
                                else
                                    self.esc_timer:start(200, 0, function() end)
                                    return "<esc>"
                                end
                            end,
                            mode = "t",
                            expr = true,
                            desc = "Double escape to normal mode",
                        },
                    },
                },
            },
        },
        keys = {
            -- Lazygit keymaps (similar to LazyVim)
            {
                "<leader>gg",
                function()
                    Snacks.lazygit({
                        cwd = vim.fn.getcwd(),
                    })
                end,
                desc = "Lazygit (cwd)",
            },
            {
                "<leader>gG",
                function()
                    Snacks.lazygit({
                        cwd = vim.fn.expand("%:p:h"),
                    })
                end,
                desc = "Lazygit (current file)",
            },
            {
                "<leader>gf",
                function()
                    Snacks.lazygit.log_file()
                end,
                desc = "Lazygit Current File History",
            },
            {
                "<leader>gl",
                function()
                    Snacks.lazygit.log()
                end,
                desc = "Lazygit Log",
            },
            -- Git browse functionality (open current file/line in browser)
            {
                "<leader>gb",
                function()
                    Snacks.gitbrowse()
                end,
                desc = "Git Browse (open)",
                mode = { "n", "x" },
            },
            {
                "<leader>gY",
                function()
                    Snacks.gitbrowse({
                        open = function(url)
                            vim.fn.setreg("+", url)
                        end,
                        notify = false,
                    })
                end,
                desc = "Git Browse (copy url)",
                mode = { "n", "x" },
            },
            -- Terminal keymaps
            {
                "<leader>ft",
                function()
                    Snacks.terminal(nil, { cwd = vim.fn.getcwd() })
                end,
                desc = "Terminal (cwd)",
            },
            {
                "<c-/>",
                function()
                    Snacks.terminal(nil, { cwd = vim.fn.getcwd() })
                end,
                desc = "Terminal (cwd)",
                mode = { "n", "t" },
            },
            -- Notification history
            {
                "<leader>un",
                function()
                    Snacks.notifier.show_history()
                end,
                desc = "Notification History",
            },
            {
                "<leader>uN",
                function()
                    Snacks.notifier.hide()
                end,
                desc = "Dismiss All Notifications",
            },
        },
        init = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
                    -- Setup some globals for easy access
                    _G.dd = function(...)
                        Snacks.debug.inspect(...)
                    end
                    _G.bt = function()
                        Snacks.debug.backtrace()
                    end
                    vim.print = _G.dd -- Override print to use snacks for `:=` command

                    -- Create toggle commands
                    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
                    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                    Snacks.toggle
                        .option("conceallevel", {
                            off = 0,
                            on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2,
                        })
                        :map("<leader>uc")
                    Snacks.toggle.line_number():map("<leader>ul")
                    Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map(
                    "<leader>ub")
                    Snacks.toggle.treesitter():map("<leader>uT")
                    Snacks.toggle.inlay_hints():map("<leader>uh")
                end,
            })
        end,
    },
}
