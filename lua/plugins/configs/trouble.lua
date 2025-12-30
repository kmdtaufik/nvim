-- Trouble Configuration
-- Better diagnostics list and quickfix viewer

return {
    opts = {
        -- Position of the trouble list
        position = "bottom", -- position of the list (bottom, top, left, right)

        -- Height of the trouble list when position is top or bottom
        height = 10,

        -- Width of the list when position is left or right
        width = 50,

        -- Icons for different diagnostic types
        icons = true,

        -- Automatically close the list when you have diagnosed all issues
        auto_close = false,

        -- Automatically open the list when you have diagnostics
        auto_open = false,

        -- Automatically preview the location of the diagnostic
        auto_preview = true,

        -- Automatically fold closed kinds
        auto_fold = false,

        -- Use diagnostic signs to set the fold icon
        use_diagnostic_signs = true,

        -- Modes for trouble
        modes = {
            diagnostics = {
                mode = "diagnostics",
                filter = { buf = 0 },
            },
            symbols = {
                mode = "lsp_document_symbols",
                focus = false,
                win = { position = "right", size = 0.25 },
            },
        },

        -- Key mappings inside trouble window
        keys = {
            ["?"] = "help",
            r = "refresh",
            R = "toggle_refresh",
            q = "close",
            o = "jump_close",
            ["<esc>"] = "cancel",
            ["<cr>"] = "jump",
            ["<2-leftmouse>"] = "jump",
            ["<c-s>"] = "jump_split",
            ["<c-v>"] = "jump_vsplit",
            -- go down to next item (depends on mode)
            ["}"] = "next",
            ["]]"] = "next",
            -- go up to previous item (depends on mode)
            ["{"] = "prev",
            ["[["] = "prev",
            dd = "delete",
            d = { action = "delete", mode = "v" },
            i = "inspect",
            p = "preview",
            P = "toggle_preview",
            zo = "fold_open",
            zO = "fold_open_recursive",
            zc = "fold_close",
            zC = "fold_close_recursive",
            za = "fold_toggle",
            zA = "fold_toggle_recursive",
            zm = "fold_more",
            zM = "fold_close_all",
            zr = "fold_reduce",
            zR = "fold_open_all",
            zx = "fold_update",
            zX = "fold_update_all",
            zn = "fold_disable",
            zN = "fold_enable",
            zi = "fold_toggle_enable",
        },
    },
}
