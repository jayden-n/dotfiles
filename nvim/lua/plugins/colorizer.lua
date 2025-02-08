return {
    'NvChad/nvim-colorizer.lua',
    opts = {
        filetypes = {'*'},
        user_default_options = {
            RGB = true,
            RRGGBB = true,
            names = false,
            RRGGBBAA = true,
            AARRGGBB = true,
            rgb_fn = true,
            hsl_fn = true,
            css = true,
            css_fn = true,
            mode = 'background', -- foreground, background,  virtualtext
            tailwind = false,    -- false / true / "normal" / "lsp" / "both"
            sass = {enable = false, parsers = {'css'}},
            virtualtext = '■',
            always_update = false,
        },
        buftypes = {},
    },
}
