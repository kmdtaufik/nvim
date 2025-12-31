-- Render Markdown Plugin Configuration
-- Beautiful markdown rendering with mode-based visibility

return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ft = { 'markdown' },

    opts = {
        -- Enable rendering by default
        enabled = true,

        -- Only render in normal, command, and terminal modes
        -- This means preview is hidden in insert and visual modes
        render_modes = { 'n', 'c', 't' },

        -- Faster updates
        debounce = 100,

        -- Maximum file size (in MB) to render
        max_file_size = 10.0,

        -- Anti-conceal: hide virtual text on cursor line
        anti_conceal = {
            enabled = true,
            above = 0,
            below = 0,
        },

        -- Heading configuration
        heading = {
            enabled = true,
            sign = true,
            icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
            position = 'overlay',
            width = 'full',
            border = false,
        },

        -- Code block configuration
        code = {
            enabled = true,
            sign = true,
            style = 'full',
            position = 'left',
            language_icon = true,
            language_name = true,
            width = 'full',
            left_pad = 0,
            right_pad = 0,
            border = 'thin',
        },

        -- Bullet points
        bullet = {
            enabled = true,
            icons = { '●', '○', '◆', '◇' },
            right_pad = 0,
            highlight = 'RenderMarkdownBullet',
        },

        -- Checkboxes
        checkbox = {
            enabled = true,
            unchecked = {
                icon = '󰄱 ',
                highlight = 'RenderMarkdownUnchecked',
            },
            checked = {
                icon = '󰱒 ',
                highlight = 'RenderMarkdownChecked',
            },
            custom = {
                todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
            },
        },

        -- Block quotes
        quote = {
            enabled = true,
            icon = '▋',
            repeat_linebreak = false,
        },

        -- Tables
        pipe_table = {
            enabled = true,
            preset = 'none',
            style = 'full',
            cell = 'padded',
            border = {
                '┌', '┬', '┐',
                '├', '┼', '┤',
                '└', '┴', '┘',
                '│', '─',
            },
        },

        -- Callouts (GitHub and Obsidian)
        callout = {
            note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo' },
            tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess' },
            important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint' },
            warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn' },
            caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError' },
        },

        -- Links
        link = {
            enabled = true,
            image = '󰥶 ',
            email = '󰀓 ',
            hyperlink = '󰌹 ',
            highlight = 'RenderMarkdownLink',
            custom = {
                web = { pattern = '^http', icon = '󰖟 ' },
                github = { pattern = 'github%.com', icon = '󰊤 ' },
            },
        },

        -- Dash/horizontal rule
        dash = {
            enabled = true,
            icon = '─',
            width = 'full',
        },

        -- Sign column
        sign = {
            enabled = true,
            highlight = 'RenderMarkdownSign',
        },

        -- LaTeX support
        latex = {
            enabled = true,
            converter = { 'latex2text' },
            highlight = 'RenderMarkdownMath',
        },

        -- Window options for rendered vs raw view
        win_options = {
            conceallevel = {
                default = vim.o.conceallevel,
                rendered = 3,
            },
            concealcursor = {
                default = vim.o.concealcursor,
                rendered = '',
            },
        },
    },

    config = function(_, opts)
        require('render-markdown').setup(opts)
    end,
}
