return {  -- Búsqueda avanzada (fuzzy finder)
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
          require("telescope").setup()
        end,
      },
}

