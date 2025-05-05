return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				auto_install = true,
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"elixir",
					"heex",
					"javascript",
					"html",
					"regex",
					"bash",
				},
				sync_install = false,
				highlight = { enable = true, disable = { "latex", "tex" } },
				indent = { enable = true },
				modules = {},
				ignore_install = {},
			})
		end,
	},
}
