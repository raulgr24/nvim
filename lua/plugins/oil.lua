vim.pack.add({
	{ src = "https://github.com/echasnovski/mini.icons" },
	{ src = "https://github.com/stevearc/oil.nvim" },
})

require("mini.icons").setup()
require("oil").setup({
	default_file_explorer = true,
	view_options = { show_hidden = true },
})
print("Remap de Oil")
vim.keymap.set("n","<leader>pv","<cmd>Oil<CR>", {desc = "Abrir Oil.nvim"})

