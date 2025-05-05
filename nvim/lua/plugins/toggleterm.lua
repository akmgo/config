return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				direction = "tab",
				start_in_insert = true,
				persist_size = true,
			})
		end,
	},
}
