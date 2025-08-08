vim.pack.add({
	{src = "https://github.com/nvim-lua/plenary.nvim"},
	{src = "https://github.com/ThePrimeagen/harpoon",version="harpoon2"},

	
})
local harpoon = require("harpoon")
harpoon:setup({
	settings = {
		save_on_toggle = true,
		sync_on_ui_close = true,
	}
})
vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
	vim.api.nvim_echo({{ "Archivo añadido a Harpoon ".. vim.fn.expand("%:t"), "Normal" }}, false, {})
end)
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<leader>z", function()
	local list = harpoon:list()
	local current_path = vim.loop.fs_realpath(vim.fn.expand("%:p"))
	print(current_path)
	local index_to_remove = nil
	for i, item in ipairs(list.items) do
		local item_real = item.value and vim.loop.fs_realpath(item.value)
		if item_real == current_path then
			index_to_remove = i
			break
		end
	end
	if index_to_remove then
		list:remove_at(index_to_remove)
		vim.api.nvim_echo({{ "Archivo eliminado de Harpoon ".. vim.fn.expand("%:t"), "Normal" }}, false, {})
		-- Compactar (eliminar huecos nil)
		local compacted = {}
		for _, item in ipairs(list.items) do
			if item then table.insert(compacted, item) end
		end
		list.items = compacted
	else
		vim.notify("Archivo no estaba en Harpoon", vim.log.levels.WARN)
	end
end,
{desc = "Elimina item de harpoon y ordena la lista"}
)
vim.keymap.set("n", "<leader>x", function()
	local list = harpoon:list()
	local current_path = vim.loop.fs_realpath(vim.fn.expand("%:p"))
	
	print("Ruta actual:", current_path)
	print("Items en Harpoon:")
	for i, path in ipairs(list.items) do
		print(i, path)
	end
end)
vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
