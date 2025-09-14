return {
  "numToStr/Comment.nvim",
  event = "VeryLazy", -- o "BufReadPre" si querés que se cargue antes
  opts = {
    padding = true,          -- Agrega un espacio entre el comentario y el texto
    sticky = true,           -- Mantiene el cursor en la posición después de comentar
    ignore = "^$",           -- Ignora líneas vacías al comentar en bloques

    toggler = {
      line = "gcc",          -- Atajo para comentar una línea en modo normal
      block = "gbc",         -- Atajo para comentario en bloque
    },

    opleader = {
      line = "gc",           -- Visual mode: comentar líneas seleccionadas
      block = "gb",          -- Visual mode: comentario por bloque
    },

    extra = {
      above = "gcO",         -- Inserta una línea comentada encima
      below = "gco",         -- Inserta una línea comentada debajo
      eol = "gcA",           -- Comenta al final de la línea actual
    },

    mappings = {
      basic = true,          -- Activa los atajos básicos: gc, gbc, etc.
      extra = true,          -- Activa atajos como gcO, gco, gcA
      extended = false       -- Puedes activarlo si usás text-objects
    },
  }
}
 
