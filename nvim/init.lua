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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Asegura que Lazy esté en el runtime
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

-- Configuración de plugins con Lazy
require("lazy").setup({ import = "plugins" })

