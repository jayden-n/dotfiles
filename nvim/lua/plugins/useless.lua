-- not so useless...
return {
    -- undotree
    {'mbbill/undotree', cmd = 'UndotreeToggle'},

    {'wakatime/vim-wakatime', lazy = false},

    {
        'refractalize/oil-git-status.nvim',
        dev = false,
        dependencies = {
            'stevearc/oil.nvim',
        },
        config = {
            show_ignored = false,
            symbols = { -- customize the symbols that appear in the git status columns
                index = {
                    ['!'] = '!',
                    ['?'] = '?',
                    ['A'] = '',
                    ['C'] = 'C',
                    ['D'] = '',
                    ['M'] = '',
                    ['R'] = '',
                    ['T'] = 'T',
                    ['U'] = 'U',
                    [' '] = ' ',
                },
                working_tree = {
                    ['!'] = '!',
                    ['?'] = '?',
                    ['A'] = '',
                    ['C'] = 'C',
                    ['D'] = '',
                    ['M'] = '',
                    ['R'] = '',
                    ['T'] = 'T',
                    ['U'] = 'U',
                    [' '] = ' ',
                },
            },
        },
    },
}
