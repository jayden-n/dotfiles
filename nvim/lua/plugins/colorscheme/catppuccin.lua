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
            no_bold = true,
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
            custom_highlights = function(colors)
                return {
                    --- status line
                    StatusLine = {fg = colors.lavender},

                    --- gitsigns
                    StatusLineGitSignsAdd = {fg = colors.green, bg = colors.mantle},
                    StatusLineGitSignsChange = {fg = colors.yellow, bg = colors.mantle},
                    StatusLineGitSignsDelete = {fg = colors.red, bg = colors.mantle},

                    --- diagnostics
                    StatusLineDiagnosticSignError = {fg = colors.red, bg = colors.mantle},
                    StatusLineDiagnosticSignWarn = {fg = colors.yellow, bg = colors.mantle},
                    StatusLineDiagnosticSignInfo = {fg = colors.sky, bg = colors.mantle},
                    StatusLineDiagnosticSignHint = {fg = colors.mauve, bg = colors.mantle},

                    --- misc
                    TabLineSel = {bg = colors.pink},
                    CmpBorder = {fg = colors.surface2},
                    Pmenu = {bg = colors.none},
                    ModeMsg = {fg = colors.flamingo},
                }
            end,
        })
    end,
}

return M
