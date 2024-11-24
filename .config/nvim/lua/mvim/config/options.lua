vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable auto format
vim.g.autoformat = true

local opt = vim.opt

opt.confirm = true
opt.autowrite = true -- new
opt.cmdheight = 0
opt.pumheight = 12
opt.winminwidth = 5 -- new
opt.wildoptions = "pum"
opt.wildmode = "longest:full,full"
opt.completeopt = "menu,menuone,noselect"

opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"
opt.formatoptions = "jcrqlnt" -- tcqj

opt.scrolloff = 10
opt.sidescrolloff = 5

-- split
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen" -- new
vim.o.background = "dark"

-- display
opt.wrap = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.smartcase = true
opt.ignorecase = true
opt.virtualedit = "block" -- new
opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- opt.list = true -- new
opt.fillchars = {
  eob = " ",
  fold = " ",
  foldsep = " ",
  foldopen = "",
  foldclose = "",
}

-- fold
opt.foldlevel = 99
-- opt.foldcolumn = "auto"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
-- Set fold settings
-- These options were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldcolumn = "0"
opt.foldnestmax = 5
opt.foldtext = ""
opt.laststatus = 0 -- 3
opt.showcmd = false
opt.showmode = false

opt.clipboard = "unnamedplus"

opt.cursorline = true
-- opt.cursorlineopt = Mo.C.transparent and "number" or "number,line"

-- indent
opt.expandtab = true
opt.smartindent = true -- new
opt.shiftround = true
opt.shiftwidth = 4
opt.tabstop = 4 -- new

-- number
opt.number = true
opt.relativenumber = true

-- Enable relative line numbers
opt.nu = true
opt.rnu = true

-- time
opt.timeoutlen = 300 -- 300
opt.updatetime = 200 -- 200

-- undo
opt.undofile = true

-- turn off swapfile
opt.swapfile = false

-- Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
opt.breakindent = true

--  Set cursor to fat cursor
-- opt.guicursor = "n-v-c:block-Cursor"
-- set true color
vim.opt.termguicolors = true

-- opt.guicursor = {
--   "n-v-c:block", -- Normal, visual, command-line: block cursor
--   "i-ci-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
--   "r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
--   "o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
--   -- "a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
--   -- "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
-- }
