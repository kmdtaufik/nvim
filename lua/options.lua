require "nvchad.options"

-- Add your custom options here!

local o = vim.o
local opt = vim.opt
local g = vim.g

-- Line numbers
o.relativenumber = true -- Relative line numbers
o.number = true         -- Show current line number
o.numberwidth = 4       -- Number column width

-- Cursor line
o.cursorline = true      -- Highlight current line
o.cursorlineopt = 'both' -- Highlight both number and line

-- Indentation
o.expandtab = true   -- Convert tabs to spaces
o.shiftwidth = 2     -- Number of spaces for indentation
o.tabstop = 2        -- Number of spaces for tab
o.softtabstop = 2    -- Number of spaces for tab in insert mode
o.smartindent = true -- Smart autoindenting
o.shiftround = true  -- Round indent to multiple of shiftwidth

-- Search
o.ignorecase = true -- Ignore case in search
o.smartcase = true  -- Override ignorecase if search has uppercase
o.hlsearch = true   -- Highlight search results
o.incsearch = true  -- Incremental search

-- UI
o.scrolloff = 8        -- Lines to keep above/below cursor
o.sidescrolloff = 8    -- Columns to keep left/right of cursor
o.signcolumn = "yes"   -- Always show sign column
o.wrap = false         -- Don't wrap lines
o.termguicolors = true -- True color support
o.showmode = false     -- Don't show mode (statusline handles it)
o.pumheight = 10       -- Popup menu height

-- Splits
o.splitright = true -- Vertical splits to the right
o.splitbelow = true -- Horizontal splits below

-- Files
o.swapfile = false       -- Don't create swapfiles
o.backup = false         -- Don't create backup files
o.undofile = true        -- Enable persistent undo
o.fileencoding = "utf-8" -- File encoding

-- Completion
o.completeopt = "menu,menuone,noselect" -- Completion options
o.shortmess = o.shortmess .. "c"        -- Don't show completion messages

-- Performance
o.updatetime = 300   -- Faster completion
o.timeoutlen = 300   -- Time to wait for mapped sequence
o.redrawtime = 10000 -- Time for redrawing display

-- Mouse
o.mouse = "a"           -- Enable mouse in all modes
o.mousemoveevent = true -- Enable mouse move events

-- Clipboard
opt.clipboard = "unnamedplus" -- Use system clipboard

-- Better display for messages
opt.cmdheight = 1 -- Command line height

-- Folding (using treesitter)
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldenable = false -- Don't fold by default
o.foldlevel = 99     -- High fold level

-- Spell checking (off by default, enable per filetype)
o.spelllang = "en_us"
o.spell = false

-- Concealment for specific filetypes (like markdown, latex)
o.conceallevel = 0 -- Don't conceal text

-- Better diff
opt.diffopt:append("vertical")
opt.diffopt:append("algorithm:histogram")
opt.diffopt:append("indent-heuristic")
