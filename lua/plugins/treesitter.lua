-- Treesitter Plugin Configuration
-- Syntax highlighting, code parsing, and text objects
--
-- NOTE: JSX and TSX syntax are handled by the 'javascript' and 'tsx' parsers.
-- There is no separate 'jsx' parser - don't add it to the list!

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },

  opts = require "configs.treesitter",

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
