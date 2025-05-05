return {
	"simrat39/symbols-outline.nvim",
	cmd = "SymbolsOutline", -- 只有运行 :SymbolsOutline 时才加载，加速启动
	config = function()
		require("symbols-outline").setup()
	end,
}
