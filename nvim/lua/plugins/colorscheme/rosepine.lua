return {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    opts = {
        dark_variant = 'moon',
        styles = {italic = false},
        palette = {
            moon = {
                gold = '#f6d5a7',
                foam = '#a1d1da',
                iris = '#d9c7ef',
                rose = '#ebbcba',
                pine = '#437e91',
                no_bg = '#0e0e0e',
            },
        },
        highlight_groups = {
            Normal = {bg = 'no_bg'},
            Directory = {fg = 'foam', bold = false},
            StatusLine = {bg = 'surface', fg = 'subtle'},
            StatusLineTerm = {link = 'StatusLine'},
            StatusLineNC = {link = 'StatusLine'},
            --- gitsigns
            StatusLineGitSignsAdd = {bg = 'surface', fg = 'pine'},
            StatusLineGitSignsChange = {bg = 'surface', fg = 'gold'},
            StatusLineGitSignsDelete = {bg = 'surface', fg = 'rose'},
            --- diagnostics
            StatusLineDiagnosticSignError = {bg = 'surface', fg = 'love'},
            StatusLineDiagnosticSignWarn = {bg = 'surface', fg = 'gold'},
            StatusLineDiagnosticSignInfo = {bg = 'surface', fg = 'foam'},
            StatusLineDiagnosticSignHint = {bg = 'surface', fg = 'iris'},
            StatusLineDiagnosticSignOk = {bg = 'surface', fg = 'pine'},

            ModeMsg = {fg = 'rose', bold = false},
        },
    },
}
