local keymap = vim.keymap.set
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")

-- Editing: write
keymap("n", "<leader>w", "<Cmd>w<CR>", { desc = "Save file" })
keymap("n", "<leader>W", "<Cmd>wa<CR>", { desc = "Save files" })

-- Editing: quit
keymap("n", "<leader>q", "<Cmd>q<CR>", { desc = "Quit" })
keymap("n", "<leader>Q", "<Cmd>q!<CR>", { desc = "Force quit" })

-- Motion
keymap({ "n", "x" }, "H", "^", { desc = "To the first non-blank char of the line" })
keymap({ "n", "x" }, "L", "$", { desc = "To the end of the line" })

-- Move line in Visual mode with Shift + j/k
keymap("v", "J", ":move '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap("v", "K", ":move '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Split window
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split below" })
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split right" })

-- Move to window
keymap("n", "<C-h>", "<C-w>h", { remap = true, desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { remap = true, desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { remap = true, desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { remap = true, desc = "Go to right window" })

-- Resize window
keymap("n", "<Down>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<Up>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<Right>", "<Cmd>vertical resize -2<CR>", { desc = "Increase window width" })
keymap("n", "<Left>", "<Cmd>vertical resize +2<CR>", { desc = "Decrease window width" })

-- Saner behavior of n and N
keymap("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
keymap("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
keymap("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
keymap("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

keymap("v", ">", ">gv", { desc = "Visual shifting" })
keymap("v", "<", "<gv", { desc = "Visual shifting" })

-- Clear search with <esc>
keymap({ "i", "n" }, "<esc>", "<Cmd>nohlsearch<CR><Esc>", { desc = "Escape and clear hlsearch" })

-- Better up/down
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move cursor up" })
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move cursor down" })

keymap("i", "jj", [[col('.') == 1 ? '<Esc>' : '<Esc>l']], { expr = true })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
keymap("n", "<leader>cd", function()
  vim.diagnostic.open_float({ scope = "cursor", force = false })
end, { desc = "Line Diagnostic" })
keymap("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
keymap("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
keymap("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
keymap("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
keymap("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
keymap("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

keymap("n", "<leader>pl", "<CMD>Lazy<CR>", { desc = "Lazy" })

-- stylua: ignore start

-- -- Lazygit
-- keymap("n", "<leader>gg", function() Mo.U.terminal({ "lazygit" }) end, { desc = "Lazygit" })

-- Code format
keymap("n", "<leader>of", function() Mo.U.format.toggle() end, { desc = "Toggle auto format(global)" })
keymap("n", "<leader>oF", function() Mo.U.format.toggle(true) end, { desc = "Toggle auto format(buffer)" })
keymap({ "n", "v" }, "<leader>cf", function() Mo.U.format.format({ force = true }) end, { desc = "Code format" })
keymap("n", "<leader>oh", function() Mo.U.toggle.inlay_hints() end, { desc = "Toggle Inlay Hints" })
keymap("n", "<leader>os", function() Mo.U.toggle("spell") end, { desc = "Toggle spelling" })

keymap("n", "<leader>ow", function() Mo.U.toggle("wrap") end, { desc = "Toggle word wrap" })

-- Open Oil
keymap("n", "<leader>e", function()
  require("oil").toggle_float()
end, { desc = "Open Oil" })

-- Disable Space bar since it'll be used as the leader key
keymap("n", "<space>", "<nop>")
keymap("n", "<C-a>", "ggVG", { desc = "Select All" })

-- Press 'S' for quick find/replace for the word under the cursor
keymap("n", "S", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end, { desc = "Quick find/replace for word under cursor" })

-- Open Spectre for global find/replace
keymap("n", "<leader>S", function()
  require("spectre").toggle()
end, { desc = "Open Spectre for global find/replace" })

-- Press 'U' for redo
keymap("n", "U", "<C-r>", { desc = "Redo" })

-- Open Lazy.nvim
keymap("n", "<leader>lu", "<CMD>Lazy<CR>", { desc = "Open Lazy.nvim" })

-- Press gx to open the link under the cursor

keymap("n", "gx", ":silent !open <cWORD><CR>", { silent = true, desc = "Open link under cursor" })
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- leader d delete wont remember as yanked/clipboard when delete pasting
keymap({ "n", "v" }, "<leader>d", [["_d]])

-- Harpoon keybinds
keymap("n", "<leader>hu", function() harpoon_ui.toggle_quick_menu() end, { desc = "Open Harpoon UI" })
keymap("n", "<leader>ha", function() harpoon_mark.add_file() end, { desc = "Add file to Harpoon" })
keymap("n", "<leader>hr", function() harpoon_mark.rm_file() end, { desc = "Remove file from Harpoon" })
keymap("n", "<leader>hc", function() harpoon_mark.clear_all() end, { desc = "Clear all files from Harpoon" })
keymap("n", "<leader>1", function() harpoon_ui.nav_file(1) end, { desc = "Harpoon file 1" })
keymap("n", "<leader>2", function() harpoon_ui.nav_file(2) end, { desc = "Harpoon file 2" })
keymap("n", "<leader>3", function() harpoon_ui.nav_file(3) end, { desc = "Harpoon file 3" })
keymap("n", "<leader>4", function() harpoon_ui.nav_file(4) end, { desc = "Harpoon file 4" })
keymap("n", "<leader>5", function() harpoon_ui.nav_file(5) end, { desc = "Harpoon file 5" })

-- vim.keymap.set("n", "<leader>rw", ":RotateWindows<CR>", { desc = "Rotate open windows" })
-- keymap("n", "<C-,>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- Toggle Maximizer (szw/vim-maximizer)
-- keymap("n", "<leader>.", "<CMD>MaximizerToggle<CR>", { desc = "Toggle Maximizer" })
