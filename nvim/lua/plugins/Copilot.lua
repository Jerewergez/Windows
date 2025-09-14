-- Configuración para el plugin Copilot con lazy.nvim
return  {
  "zbirenbaum/copilot.lua", -- Repositorio oficial del plugin
  cmd = "Copilot",          -- Activa el plugin solo si ejecutás el comando :Copilot
  event = "InsertEnter",    -- También se carga automáticamente al entrar en modo inserción

  config = function()
    require("copilot").setup({
      -- Configuración de las sugerencias automáticas
      suggestion = {
        enabled = true,         -- Habilita las sugerencias inline de Copilot
        auto_trigger = true,    -- Las muestra automáticamente al escribir
        debounce = 75,          -- Retardo para evitar que aparezcan con demasiada frecuencia

        -- Mapeo de teclas para manejar las sugerencias
        keymap = {
          accept = "<C-l>",     -- Aceptar sugerencia con Ctrl + l
          next = "<C-j>",       -- Ir a la siguiente sugerencia con Ctrl + j
          prev = "<C-k>",       -- Volver a la sugerencia anterior con Ctrl + k
          dismiss = "<C-h>",    -- Descartar la sugerencia con Ctrl + h
        },
      },

      -- Panel lateral que muestra múltiples sugerencias
      panel = {
        enabled = true,         -- Habilita el panel visual
        auto_refresh = true,    -- Se actualiza automáticamente

        -- Mapeo de teclas para interactuar con el panel
        keymap = {
          open = "<M-CR>",      -- Abrir panel con Alt + Enter
          accept = "<CR>",      -- Aceptar sugerencia del panel con Enter
          refresh = "gr",       -- Refrescar sugerencias manualmente
          next = "J",           -- Siguiente sugerencia
          prev = "K",           -- Sugerencia anterior
        },
      },

      -- Definición de en qué tipos de archivo estará activo Copilot
      filetypes = {
        markdown = true,        -- Activado en archivos Markdown
        help = false,           -- Desactivado en archivos de ayuda de Neovim
        gitcommit = true,       -- Activado en mensajes de commit
        ["*"] = true,           -- Activado por defecto en todos los demás archivos
      },
    })
  end,
}

