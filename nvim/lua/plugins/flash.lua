return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		-- jump = {
		--   autojump = true,
		-- },
		modes = {
			char = {
				autohide = true,
			},
		},
		exclude = {
			"notify",
			"cmp_menu",
			"noice",
			"lazy",
			"flash_prompt",
			function(win)
				-- exclude non-focusable windows
				return not vim.api.nvim_win_get_config(win).focusable
			end,
		},
		prompt = {
			prefix = { { "", "FlashPromptIcon" } },
		},
	},
}
