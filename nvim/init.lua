-- Definimos la tecla
vim.g.mapleader = ' '
-- Configuración personalizada 
pcall(require, "config.keymap")

-- -- Elimina advertencia de which-key
local orig_notify = vim.notify
vim.notify = function(msg, level, opts)
  if msg:match("which%-key") and level == vim.log.levels.WARN then
    return
  end
  orig_notify(msg, level, opts)
end

-- Asegura que Lazy esté en el runtime
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

-- Configuración de plugins con Lazy
require("lazy").setup({ import = "plugins" })

