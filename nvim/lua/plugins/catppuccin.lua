return{-- Tema Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
