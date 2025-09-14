--  Configuración general
vim.opt.mouse = 'a'              -- Habilita el uso del mouse
vim.opt.ignorecase = true        -- Búsquedas sin distinción de mayúsculas
vim.opt.number = true            -- Mostrar número de línea
vim.opt.relativenumber = true    -- Líneas relativas
vim.opt.tabstop = 4              -- Tamaño de tabulación
vim.opt.shiftwidth = 4           -- Espaciado para indentación
vim.opt.expandtab = true         -- Usar espacios en lugar de tabs

-- 🧠 Mapeo de teclas
local map = vim.keymap.set
map('n', '<Space>', '', {})      -- Asegura que <Space> esté libre

-- 💾 Comandos básicos
map('n', '<leader>w', ':w<CR>', { desc = 'Guardar archivo' })
map('n', '<leader>q', ':q<CR>', { desc = 'Cerrar ventana' })

-- 🗂️ Explorador de archivos
map('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Explorar archivos' })

-- 🔍 Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Buscar archivo' })
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Buscar texto' })
map('n', '<leader>fs', '<cmd>Telescope treesitter<CR>', { desc = 'Estructura de sintaxis' })

-- 🐱‍🏍 Navegación entre ventanas
map('n', '<C-h>', '<C-w>h', { desc = 'Ventana izquierda' })
map('n', '<C-j>', '<C-w>j', { desc = 'Ventana abajo' })
map('n', '<C-k>', '<C-w>k', { desc = 'Ventana arriba' })
map('n', '<C-l>', '<C-w>l', { desc = 'Ventana derecha' })
