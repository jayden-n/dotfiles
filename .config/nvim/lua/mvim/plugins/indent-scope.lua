return {
  {
    "echasnovski/mini.indentscope",
    version = false,
    event = "BufEnter",
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      local mocha = require("catppuccin.palettes").get_palette("mocha")
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "lazy",
          "mason",
          "notify",
          "oil",
          "Oil",
          "dashboard",
          "nvimtree",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })

      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = mocha.mauve })
    end,
  },
}
