vim.pack.add(
	{
		{
			src = "https://github.com/rose-pine/neovim.git"
		}
	}
)
require("rose-pine").setup(
	{
		variant = "auto",
		dark_variant = "main",
		dim_inactive_windows = false,
		extend_background_behind_borders = true,
		enable = {
			terminal = true,
			legacy_highlights = true,
			migrations = true,
		},
		styles = {
			bold = true,
			italic = true,
			transparency = false,
		},
		groups = {
			border = "love",
			link = "iris",
		},
		palette = {
			moon = {
				base = '#161521',
			},
			main = {
				base = '#191724',
				surface = '#1f1d2e',
				overlay = '#26333a',
				pine = '#318cb0'
			}
		}
	}
)
vim.cmd("colorscheme rose-pine")
