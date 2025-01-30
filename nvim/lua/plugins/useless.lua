-- not so useless...
return {
    -- undotree
    {'mbbill/undotree', cmd = 'UndotreeToggle'},

    {'wakatime/vim-wakatime', lazy = false},

    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {
            fast_wrap = {map = '<M-e>'},
        },
        config = function(_, opts)
            local autopairs = require('nvim-autopairs')
            local Rule = require('nvim-autopairs.rule')
            local cond = require('nvim-autopairs.conds')

            autopairs.setup(opts)
            autopairs.add_rules({
                Rule('<', '>', 'rust'):with_pair(cond.before_regex('%a+:?:?$', 3)):with_move(function(args)
                    return args.char == '>'
                end),
            })
        end,
    },

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
