local keyset = vim.keymap.set
local silent = {silent = true}

keyset({'i', 'n', 'v'}, '<C-c>', function()
    if vim.fn.mode() ~= 'i' then
        vim.cmd('nohlsearch') -- Clear search highlights in Normal/Visual mode
    end
    return '<Esc>'            -- Always act as Esc
end, {expr = true, silent = true, desc = 'Escape and clear search highlights'})

keyset('n', '<C-a>', 'gg<S-v>G', {desc = 'Select all'})
keyset('i', 'jj', '<Esc>')
keyset('n', 'U', '<C-r>', silent)
keyset('n', '<C-x>', 'ciw', silent)
keyset('n', 'yc', 'yy<cmd>normal gcc<CR>p', silent)
keyset('n', '<CR>', 'o', silent)
keyset('n', '<S-CR>', 'O', silent)

-- Editing: write
keyset('n', '<leader>w', '<Cmd>w<CR>', {desc = 'Save file'})

-- Editing: quit
keyset('n', '<leader>q', '<Cmd>q<CR>', {desc = 'Quit'})

-- Motion
keyset({'n', 'x'}, 'H', '^', silent)
keyset({'n', 'x'}, 'L', '$', silent)

-- Split window
keyset('n', '<leader>sh', ':split<Return><C-w>w', {desc = 'Split window horizontally'}) -- Horizontal
keyset('n', '<leader>sv', ':vsplit<Return><C-w>w', {desc = 'Split window vertically'})  -- Vertical

-- Resize window
keyset('n', '<Up>', '<Cmd>resize +2<CR>', silent)
keyset('n', '<Down>', '<Cmd>resize -2<CR>', silent)
keyset('n', '<Left>', '<Cmd>vertical resize -2<CR>', silent)
keyset('n', '<Right>', '<Cmd>vertical resize +2<CR>', silent)

-- Move to window
-- keyset('n', '<C-h>', '<C-w>h', {remap = true, desc = 'Go to left window'})
-- keyset('n', '<C-j>', '<C-w>j', {remap = true, desc = 'Go to lower window'})
-- keyset('n', '<C-k>', '<C-w>k', {remap = true, desc = 'Go to upper window'})
-- keyset('n', '<C-l>', '<C-w>l', {remap = true, desc = 'Go to right window'})

-- Move line in Visual mode with Shift + j/k
keyset('v', 'J', ":m '>+1<CR>gv=gv", silent)
keyset('v', 'K', ":m '<-2<CR>gv=gv", silent)

-- Jumping pages keeps cursor in the middle
keyset('n', '<C-d>', '<C-d>zz', {desc = 'Jump page down'})
keyset('n', '<C-u>', '<C-u>zz', {desc = 'Jump page up'})

-- Keep search terms in the middle of the screen
keyset('n', 'n', 'nzzzv', {desc = 'Jump to next search term'})
keyset('n', 'N', 'Nzzzv', {desc = 'Jump to previous search term'})

-- Pastes copied buffer and keeps it in the register
-- keyset('x', '<leader>p', '\"_dP')

-- Sources current buffer
keyset('n', '<leader><leader>x', function() vim.cmd('so') end, {desc = 'Source current buffer'})
keyset('n', '<leader>X', ':.lua<CR>', {desc = 'Source current line'})
keyset('v', '<leader>X', ':.lua<CR>', {desc = 'Source current selection'})
