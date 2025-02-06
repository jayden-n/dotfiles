-- not so useless...
return {
    -- file name
    {
        'b0o/incline.nvim',
        -- event = {'BufReadPre', 'BufNewFile'},
        dependencies = {'nvim-web-devicons'},
        config = function()
            local helpers = require('incline.helpers')
            local devicons = require('nvim-web-devicons')
            require('incline').setup({
                window = {
                    padding = 0,
                    margin = {horizontal = 0},
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
                    if filename == '' then
                        filename = '[404]'
                    end
                    if vim.bo[props.buf].modified then
                        filename = '[+] ' .. filename
                    end
                    local ft_icon, ft_color = devicons.get_icon_color(filename)
                    local modified = vim.bo[props.buf].modified
                    return {
                        ft_icon
                        and {' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color)}
                        or '',
                        ' ',
                        {filename, gui = modified and 'bold,italic' or 'bold'},
                        ' ',
                        guibg = '#44406e',
                    }
                end,
            })
        end,
    },

    -- tmux navigator
    {
        'christoomey/vim-tmux-navigator',
        cmd = {
            'TmuxNavigateLeft',
            'TmuxNavigateDown',
            'TmuxNavigateUp',
            'TmuxNavigateRight',
            'TmuxNavigatePrevious',
            'TmuxNavigatorProcessList',
        },
        keys = {
            {'<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>'},
            {'<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>'},
            {'<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>'},
            {'<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>'},
            {'<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>'},
        },
    },

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
