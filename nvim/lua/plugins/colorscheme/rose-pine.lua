return {
    'rose-pine/neovim',
    lazy = false,
    name = 'rose-pine',
    priority = 1000,
    opts = {
        dark_variant = 'moon',
        styles = {italic = false},
        highlight_groups = {
            -- Normal = {bg = 'no_bg'},
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
        },
    },
}
