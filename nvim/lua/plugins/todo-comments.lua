---@diagnostic disable: undefined-field
local desc = Utils.plugin_keymap_desc('TODO comments')

return {
    'folke/todo-comments.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    event = 'BufReadPre',
    opts = {
        gui_style = {
            fg = 'NONE',
            bg = 'NONE',
        },
        colors = {
            info = {'DiffText', '#2563EB'},
        },
    },
    keys = {
        {'<leader>st', function() Snacks.picker.todo_comments() end, desc = 'Todo'},
        {'<leader>sT', function() Snacks.picker.todo_comments({keywords = {'TODO', 'FIX', 'FIXME'}}) end, desc = 'Todo/Fix/Fixme'},
    },
    config = function(_, opts)
        local todo_comments = require('todo-comments')
        todo_comments.setup(opts)
        vim.keymap.set('n', ']t', function() todo_comments.jump_next() end, {desc = desc('Next todo comment')})
        vim.keymap.set('n', '[t', function() todo_comments.jump_prev() end, {desc = desc('Previous todo comment')})
    end,
}
