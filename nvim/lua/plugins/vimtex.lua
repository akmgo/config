return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_view_method = "skim"
		vim.g.vimtex_view_general_viewer = "skim"
		vim.g.vimtex_view_general_options = [[--synctex-forward @line:@col:@tex @pdf]]
		vim.g.vimtex_view_inverse_search = 1
		-- vim.g.vimtex_quickfix_mode = 0
		vim.g.vimtex_view_skim_sync = 1
		vim.g.vimtex_view_skim_activate = 1
		vim.g.vimtex_quickfix_ignore_filters = {
			"Underfull",
			"Overfull",
			"specifier changed to",
			"Token not allowed in a PDF string",
			"LaTeX Warning: Float too large for page",
			"contains only floats",
			"LaTeX Warning: Citation",
			'Missing "author" in',
			"LaTeX Font Warning:",
		}
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				local buf_ft = vim.bo.filetype
				if buf_ft == "tex" then
					vim.cmd("VimtexCompile")
				end
			end,
		})
	end,
}
