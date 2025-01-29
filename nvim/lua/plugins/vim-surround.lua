return {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    keys = {
        {'gsa', desc = 'Add surround', mode = {'n', 'v'}},
        {'gsc', desc = 'Change surround'},
        {'gsd', desc = 'Delete surround'},
        {'<C-g>s', desc = 'Add surround', mode = {'i'}},
        {'<C-g>S', desc = 'Add surround', mode = {'i'}},
    },
    opts = {
        move_cursor = false,
        keymaps = {
            insert = '<C-g>s',
            insert_line = '<C-g>S',
            normal = 'gsa',
            normal_cur = false,
            normal_line = false,
            normal_cur_line = false,
            visual = 'gsa',
            visual_line = false,
            delete = 'gsd',
            change = 'gsc',
            change_line = false,
        },
    },
}

