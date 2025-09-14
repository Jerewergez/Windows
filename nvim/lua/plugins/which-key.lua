return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      local wk = require("which-key")
        wk.register({
          ["<leader>"] = {
            e = { ":NvimTreeToggle<CR>", "Explorar archivos" },
            q = { ":q<CR>", "Salir" },
            w = { ":w<CR>", "Guardar" },
            f = {
              name = "Buscar (Telescope)",
              f = { "<cmd>Telescope find_files<CR>", "Buscar archivo" },
              g = { "<cmd>Telescope live_grep<CR>", "Buscar texto" },
              s = { "<cmd>Telescope treesitter<CR>", "Árbol de sintaxis" },
            },
          },
        })
    end,
  },
}
