-- Configuración del plugin nvim-cmp con integración de copilot

return {
  "hrsh7th/nvim-cmp",  -- Plugin principal de autocompletado
  dependencies = {
    "hrsh7th/cmp-buffer",       -- Fuente: palabras del buffer
    "hrsh7th/cmp-path",         -- Fuente: rutas del sistema de archivos
    "hrsh7th/cmp-nvim-lsp",     -- Fuente: lenguaje LSP
    "hrsh7th/cmp-cmdline",      -- Fuente: comandos en línea de comandos
    "L3MON4D3/LuaSnip",         -- Soporte para snippets
    "saadparwaiz1/cmp_luasnip", -- Fuente de snippets
    "zbirenbaum/copilot-cmp",   -- Integración con copilot.lua
  },

  event = "InsertEnter", -- Carga perezosa: solo al entrar en modo inserción

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Cargar integración de copilot
    require("copilot_cmp").setup()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Expande los snippets
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<Tab>"]     = cmp.mapping.select_next_item(),
        ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
        ["<CR>"]      = cmp.mapping.confirm({ select = true }), -- Aceptar sugerencia
        ["<C-Space>"] = cmp.mapping.complete(), -- Forzar menú de autocompletado
      }),

      -- Fuentes que se mostrarán en el menú de autocompletado
      sources = cmp.config.sources({
        { name = "copilot" },    -- IA de Copilot (prioridad más alta)
        { name = "nvim_lsp" },   -- Lenguaje Server Protocol
        { name = "luasnip" },    -- Snippets
        { name = "buffer" },     -- Palabras del buffer actual
        { name = "path" },       -- Rutas de archivos
      }),
    })
  end,
}

