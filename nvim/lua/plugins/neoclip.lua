return {
	"AckslD/nvim-neoclip.lua",
	dependencies = {
		-- you'll need at least one of these
		{ "nvim-telescope/telescope.nvim" },
		-- {'ibhagwan/fzf-lua'},
		{ "kkharji/sqlite.lua", module = "sqlite" },
	},
	config = function()
		require("neoclip").setup({
			enable_persistent_history = true, -- ✅ 开启持久化
			history = 1000, -- 保存的历史条数
			continuous_sync = true, -- 持续同步系统剪贴板（可选）
		})
		require("telescope").load_extension("neoclip")
	end,
}
