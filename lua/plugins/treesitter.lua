
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {"c","python","cpp", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html","markdown", "markdown_inline"},

        sync_install = false,

        auto_install = true,

        highlight = {
          enable = true,

          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = true,
        },
      })
    end
  }
}

