local M = {
    'catppuccin/nvim',
    name = 'catppuccin',
    event = 'VimEnter',
    lazy = false,
    priority = 1000,
    config = function()
        require('catppuccin').setup({
            flavour = 'mocha',
            term_colors = true,
            transparent_background = false,
            no_italic = true,
            integrations = {
                blink_cmp = true,
                lsp_trouble = true,
                semantic_tokens = true,
                harpoon = true,
                mason = true,
                gitsigns = true,
                neotest = true,
                nvim_surround = true,
                snacks = true,
                which_key = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = {'undercurl'},
                        hints = {'undercurl'},
                        warnings = {'undercurl'},
                        information = {'undercurl'},
                    },
                },
            },
        })
    end,
}

return M
