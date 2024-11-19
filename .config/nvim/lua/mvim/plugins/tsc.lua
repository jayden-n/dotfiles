return {
  {
    "dmmulroy/tsc.nvim",
    lazy = true,
    ft = { "typescript", "typescriptreact" },
    cmd = "TSC",
    keys = {
      { "<leader>tc", "<cmd>TSC<cr>", desc = "Type-check" },
    },
    config = function()
      require("tsc").setup({
        auto_open_qflist = true,
        pretty_errors = false,
      })
    end,
  },
}
