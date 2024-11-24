local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      show_end_of_buffer = true, -- show the '~' characters after the end of buffers
      flavour = Mo.C.transparent and "mocha" or "macchiato",
      term_colors = true,
      transparent_background = Mo.C.transparent,
      styles = {
        keywords = { "italic" },
        -- functions = { "italic" },
      },
      integrations = {
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            -- ok = { "italic" },
          },
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
            -- ok = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        harpoon = true,
        alpha = false,
        beacon = true,
        neogit = false,
        nvimtree = false,
        treesitter_context = false,
        rainbow_delimiters = false,
        mini = { enabled = false },
        dropbar = { enabled = false },
        -- illuminate = { enabled = false },
        mason = true,
        noice = true,
        notify = true,
        neotest = true,
        gitsigns = true,
        which_key = true,
        nvim_surround = true,
        flash = true,
        telescope = { style = Mo.C.transparent and nil or "nvchad" },
      },
      custom_highlights = function(colors)
        return {
          -- custom
          PanelHeading = {
            fg = colors.lavender,
            bg = Mo.C.transparent and colors.none or colors.crust,
            style = { "bold", "italic" },
          },

          -- lazy.nvim
          LazyH1 = {
            bg = Mo.C.transparent and colors.none or colors.peach,
            fg = Mo.C.transparent and colors.lavender or colors.base,
            style = { "bold" },
          },
          LazyButton = {
            bg = colors.none,
            fg = Mo.C.transparent and colors.overlay0 or colors.subtext0,
          },
          LazyButtonActive = {
            bg = Mo.C.transparent and colors.none or colors.overlay1,
            fg = Mo.C.transparent and colors.lavender or colors.base,
            style = { "bold" },
          },
          LazySpecial = { fg = colors.green },

          CmpItemMenu = { fg = colors.subtext1 },

          FloatBorder = {
            fg = Mo.C.transparent and colors.blue or colors.mantle,
            bg = Mo.C.transparent and colors.none or colors.mantle,
          },

          FloatTitle = {
            fg = Mo.C.transparent and colors.lavender or colors.base,
            bg = Mo.C.transparent and colors.none or colors.lavender,
          },
        }
      end,
    })
    vim.cmd.colorscheme("catppuccin")

    local palette = require("catppuccin.palettes").get_palette()
    Mo.C.filling_pigments(palette)
  end,
}

return M

-- local M = {
--   {
--     "sainnhe/everforest",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       -- Optionally configure and load the colorscheme
--       -- directly inside the plugin declaration.
--       vim.g.everforest_background = "medium" -- Options: "hard", "medium", "soft"
--       vim.g.everforest_enable_italic = true
--       vim.g.everforest_enable_italic = "1"
--       vim.g.everforest_diagnostic_virtual_text = "colored"
--       vim.g.everforest_current_word = "underline"
--       vim.g.everforest_inlay_hints_background = "dimmed"
--       -- Enable line highlight for diagnostics
--       vim.g.everforest_diagnostic_line_highlight = true
--       vim.g.everforest_diagnostic_text_highlight = true
--       vim.g.everforest_float_style = "dim"
--       vim.g.everforest_cursor = "aqua"
--
--       vim.cmd.colorscheme("everforest")
--     end,
--   },
-- }
--
-- return M
