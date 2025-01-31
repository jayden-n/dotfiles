local octo_desc = Utils.plugin_keymap_desc('octo')

return {
    {
        'lewis6991/gitsigns.nvim',
        event = 'BufReadPre',
        opts = function()
            local desc = Utils.plugin_keymap_desc('gitsigns')

            return {
                signs = {
                    add = {text = '┃'},
                    change = {text = '┃'},
                    delete = {text = '_'},
                    topdelete = {text = '‾'},
                    changedelete = {text = '~'},
                    untracked = {text = '┆'},
                },
                current_line_blame = false,
                current_line_blame_opts = {delay = 500},
                max_file_length = 40000, -- Disable if file is longer than this (in lines)
                preview_config = {
                    border = 'single',
                    title = 'Preview changes',
                    title_pos = 'center',
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function()
                            gs.next_hunk()
                            vim.cmd('normal! zz')
                        end)
                        return '<Ignore>'
                    end, {expr = true, desc = desc('Next hunk')})

                    map('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function()
                            gs.prev_hunk()
                            vim.cmd('normal! zz')
                        end)
                        return '<Ignore>'
                    end, {expr = true, desc = desc('Previous hunk')})

                    -- Actions
                    map('n', '<leader>gs', gs.stage_hunk, {desc = desc('Stage hunk')})
                    map('n', '<leader>gr', gs.reset_hunk, {desc = desc('Reset hunk')})
                    map('v', '<leader>gs', function()
                        gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')}
                    end, {desc = desc('Stage hunk')})
                    map('v', '<leader>gr', function()
                        gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')}
                    end, {desc = desc('Reset hunk')})
                    -- map('n', '<leader>hS', gs.stage_buffer, {desc = desc('Stage buffer')})
                    -- map('n', '<leader>hR', gs.reset_buffer, {desc = desc('Reset buffer')})
                    map('n', '<leader>gp', gs.preview_hunk, {desc = desc('Preview hunk')})
                    map('n', '<leader>gb', function() gs.blame_line {full = true} end, {desc = desc('Blame line')})
                    -- map('n', '<leader>tb', gs.toggle_current_line_blame, {desc = desc('Toggle current line blame')})
                    -- map('n', '<leader>hd', gs.diffthis, {desc = desc('Diff this')})
                    -- map('n', '<leader>hD', function() gs.diffthis('~') end, {desc = desc('Diff this')})

                    -- Text object
                    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end,
            }
        end,
    },
}
