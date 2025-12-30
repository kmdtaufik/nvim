-- Rust.vim Configuration
-- Additional Rust tooling and formatting

return {
    init = function()
        -- Enable rustfmt on save
        vim.g.rustfmt_autosave = 1

        -- Emit rustfmt errors to quickfix list
        vim.g.rustfmt_emit_files = 1

        -- Don't fail silently
        vim.g.rustfmt_fail_silently = 0

        -- Use rust-analyzer for completion (via LSP)
        vim.g.rust_recommended_style = 1

        -- Use edition 2021 by default
        vim.g.rustfmt_options = "--edition 2021"
    end,
}
