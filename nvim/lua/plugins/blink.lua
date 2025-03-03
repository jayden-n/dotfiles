return {
    'saghen/blink.cmp',
    version = '*',
    event = 'InsertEnter',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = 'enter',
            ['<C-y>'] = {'show', 'show_documentation', 'hide_documentation'},
            ['<C-u>'] = {'scroll_documentation_up', 'fallback'},
            ['<C-d>'] = {'scroll_documentation_down', 'fallback'},

            ['<Tab>'] = {'select_next', 'fallback'},
            ['<S-Tab>'] = {'select_prev', 'fallback'},

            ['<C-j>'] = {'select_next', 'fallback'},
            ['<C-k>'] = {'select_prev', 'fallback'},

            cmdline = {
                preset = 'enter',
                ['<Tab>'] = {'select_next', 'fallback'},
                ['<S-Tab>'] = {'select_prev', 'fallback'},

                ['<C-j>'] = {'select_next', 'fallback'},
                ['<C-k>'] = {'select_prev', 'fallback'},
            },
        },
        -- appearance = {
        --     use_nvim_cmp_as_default = true,
        -- },
        sources = {
            default = {'lsp', 'path', 'snippets', 'buffer', 'lazydev'},
            providers = {
                lsp = {
                    fallbacks = {'buffer'},
                    max_items = 7,    -- Maximum number of items to display in the menu
                    async = true,
                    timeout_ms = 0,   -- How long to wait for the provider to return before showing completions and treating it as asynchronous
                    score_offset = 1, -- Boost/penalize the score of the items
                },
                lazydev = {
                    name = 'LazyDev',
                    module = 'lazydev.integrations.blink',
                    score_offset = 100, -- show at a higher priority than lsp
                },
                snippets = {
                    name = 'Snippets',
                    module = 'blink.cmp.sources.snippets',
                    min_keyword_length = 3,
                    opts = {
                        friendly_snippets = false,
                        search_paths = {vim.fn.stdpath('config') .. '/snippets/nvim'},
                    },
                },
            },
        },
        signature = {
            enabled = true,
            window = {
                border = 'single',
                winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
                max_width = math.floor(vim.o.columns * 0.4),
                max_height = math.floor(vim.o.lines * 0.5),
            },
        },
        completion = {
            accept = {
                auto_brackets = {
                    enabled = false,
                },
            },
            trigger = {
                show_on_accept_on_trigger_character = false,
            },
            list = {
                max_items = 7,
                -- Manual selection, if not in cmdline
                selection = {
                    preselect = false,
                    auto_insert = function(ctx) return ctx.mode == 'cmdline' end,
                },
            },
            menu = {
                border = 'single',
                winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
                draw = {
                    treesitter = {'lsp'},
                    columns = {
                        {'label', gap = 2}, {'kind_icon', gap = 1, 'kind'},
                    },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
                window = {
                    border = 'single',
                    winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
                    max_width = math.floor(vim.o.columns * 0.4),
                    max_height = math.floor(vim.o.lines * 0.5),
                },
            },
        },
        fuzzy = {
            use_typo_resistance = false,
        },
    },
    opts_extend = {'sources.default'},
}
