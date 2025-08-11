vim.g.mapleader = " "
local has_oil = require("plugins.oil")
if has_oil then
	vim.keymap.set("n","<leader>pv","<cmd>Oil<CR>",{desc = "Abrir oil"})
else
	vim.keymap.set("n","<leader>pv","<cmd>Ex<CR>", {desc = "Abrir netrw"})
end
vim.keymap.set("n","<leader>w","<C-w>w", {desc = "Cambia de ventana"})
