require("config.basic")
require("config.keymap")
require("config.lazy")

-- NOTE:保存latex源文件自动编译
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.tex",
	command = "silent! VimtexCompile",
})
