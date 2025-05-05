return {
	"danymat/neogen",
	event = "VeryLazy",
	config = function()
		require("neogen").setup({
			languages = {
				cuda = require("neogen.configurations.cpp"),
			},
		})
	end,
}
