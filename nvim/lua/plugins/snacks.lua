---@diagnostic disable: undefined-field
local desc = Utils.plugin_keymap_desc('snacks')

return {
    'folke/snacks.nvim',
    lazy = false,
    opts = {
        -- indent = {
        --     indent = {
        --         char = '┊',
        --     },
        --     scope = {
        --         enabled = false,
        --     },
        --     chunk = {
        --         enabled = false,
        --     },
        --     filter = function(buf)
        --         return vim.g.snacks_indent ~= false
        --             and vim.b[buf].snacks_indent ~= false
        --             and vim.bo[buf].buftype == ''
        --             and vim.bo[buf].filetype ~= 'markdown'
        --     end,
        -- },
        bigfile = {enabled = true},
        quickfile = {enabled = true},
        gitbrowse = {enabled = true},
        dashboard = {enabled = false},
        notifier = {enabled = false},
        statuscolumn = {enabled = false},
        words = {enabled = false},
        picker = {
            sources = {
                files = {hidden = true},
            },
            debug = {
                scores = true, -- show scores in the list
            },
            layout = {
                preset = 'ivy',
                cycle = false,
            },
            matcher = {
                frecency = true,
            },
            win = {
                input = {
                    keys = {
                        -- to close the picker on ESC instead of going to normal mode,
                        -- add the following keymap to your config
                        ['<Esc>'] = {'close', mode = {'n', 'i'}},
                        -- I'm used to scrolling like this in LazyGit
                        ['J'] = {'preview_scroll_down', mode = {'i', 'n'}},
                        ['K'] = {'preview_scroll_up', mode = {'i', 'n'}},
                        ['H'] = {'preview_scroll_left', mode = {'i', 'n'}},
                        ['L'] = {'preview_scroll_right', mode = {'i', 'n'}},
                    },
                },
            },
        },
    },
    keys = function()
        local snacks = require('snacks')
        return {
            {'<leader>gg', function() Snacks.lazygit({configure = false}) end, desc = 'Lazygit'},
            {
                '<M-b>',
                function()
                    Snacks.picker.git_branches({
                        layout = 'ivy',
                    })
                end,
                desc = 'Keymaps',
            },

            {'<leader>ff', function() Snacks.picker.files() end, desc = 'Find Files'},
            {'<leader>fg', function() Snacks.picker.grep() end, desc = 'Grep'},
            {'<leader>fw', function() Snacks.picker.grep_word() end, desc = 'Visual selection or word', mode = {'n', 'x'}},
            {'<leader>fr', function() Snacks.picker.recent() end, desc = 'Recent'},
            {'<leader>fc', function() Snacks.picker.grep_buffers() end, desc = 'Grep Open Buffers'},
            {'<leader>fb', function() Snacks.picker.buffers() end, desc = 'Buffers'},
            {'<leader>fd', function() Snacks.picker.diagnostics() end, desc = 'Diagnostics'},
            {
                '<leader>cR',
                function() snacks.rename.rename_file() end,
                desc = desc('Rename File'),
            },
            {
                '<leader>gy',
                function() snacks.gitbrowse() end,
                desc = desc('Open line(s) in browser'),
                mode = {'n', 'v'},
            },
            {
                '<leader>gY',
                function()
                    snacks.gitbrowse.open({
                        open = function(url)
                            vim.fn.setreg('+', url)
                            vim.notify('Yanked url to clipboard')
                        end,
                    })
                end,
                desc = desc('Copy line(s) link'),
                mode = {'n', 'v'},
            },
        }
    end,
}
