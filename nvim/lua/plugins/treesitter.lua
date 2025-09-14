
-- lua/plugins/treesitter.lua
return {
  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,          -- Activa el resaltado de sintaxis
        },
        indent = {
          enable = true,          -- Activa indentación automática
        },
        -- Puedes agregar módulos como 'incremental_selection', 'textobjects', etc.
      })
    end,
  },
}
