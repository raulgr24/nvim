--@param path string
local function set_python_path(path)
	--@type vim.lsp.Client[]
	local clients = vim.lsp.get_clients {
		bufnr = vim.api.nvim_get_current_buf(),
		name = 'pyright',
	}
	--@param client string 
	for _, client in ipairs(clients) do
		--@cast client vim.lsp.Client
		client.config.settings = vim.tbl_deep_extend(
			'force',
			client.config.settings or {},
			{python = {pythonPath = path } }
		)
		client:notify('workspace/didChangeConfiguration', { settings = nil })
	end
end

return {
	cmd = { 'pyright-langserver', '--stdio' },
	filetypes = { 'python' },
	root_markers = {
		'pyproject.toml',
		'setup.py',
		'setup.cfg',
		'requirements.txt',
		'Pipfile',
		'pyrightconfig.json',
		'.git',
	},
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = 'openFilesOnly',
				useLibraryCodeForTypes = true,
				-- "off" | "basic" | "standard" | "strict"
				typeCheckingMode = "standard",
				diagnosticSeverityOverrides = {
					reportOptionalMemberAccess = "none",
					-- opcionalmente:
					-- reportOptionalCall = "none",
					-- reportOptionalSubscript = "none",
				},
			},
		},
	},
	on_attach = function(client, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightOrganizeImports', function()
			client:exec_cmd({
				command = 'pyright.organizeimports',
				arguments = { vim.uri_from_bufnr(bufnr) },
			})
		end, {
				desc = 'Organize Imports',
			})
		vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightSetPythonPath', set_python_path, {
			desc = 'Reconfigure pyright with the provided python path',
			nargs = 1,
			complete = 'file',
		})
	end,
}
