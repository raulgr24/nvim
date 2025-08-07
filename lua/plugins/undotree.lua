return{
	"mbbill/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	lazy = false,
	config = function()
		vim.keymap.set("n","<leader>u", vim.cmd.UndotreeToggle, {desc = "Toggle Undo Tree"})
	end,
}
