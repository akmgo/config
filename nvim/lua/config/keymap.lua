vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set({ "n", "t" }, "<leader>ta", "<cmd>tabNext<CR>", { silent = true })
vim.keymap.set({ "n", "t" }, "<leader>tc", "<cmd>tabclose<CR>", { silent = true })

--PERF:bufferline插件快捷键
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<leader>d", ":bdelete<CR>", { silent = true })
vim.keymap.set("n", "<leader>o", ":BufferLineCloseOthers<CR>", { silent = true })
for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, ":BufferLineGoToBuffer" .. i .. "<CR>", { silent = true })
end

--PERF:diffview插件快捷键
vim.keymap.set("n", "<leader>go", ":DiffviewOpen<CR>", { desc = "打开 Diffview" })
vim.keymap.set("n", "<leader>gc", ":DiffviewClose<CR>", { desc = "关闭 Diffview" })

--PERF:grugfar插件快捷键
vim.keymap.set("n", "<leader>r", ":GrugFar<CR>", { silent = true })

--PERF:hop插件快捷键
vim.keymap.set("n", "<leader>h", ":HopWord<CR>", { silent = true })

--PERF:lspsaga插件快捷键

--PERF:mason插件快捷键
vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { silent = true })

--PERF:vimtex插件快捷键
vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>", { desc = "[VimTeX] 编译当前文件" })
vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "[VimTeX] 打开 PDF 阅读器" })
vim.keymap.set("n", "<leader>li", "<cmd>VimtexInfo<CR>", { desc = "[VimTeX] 查看插件信息" })

--PERF:flash插件快捷键
vim.keymap.set("n", "<leader>j", function()
	require("flash").jump()
end, { silent = true })
vim.keymap.set("n", "<leader>J", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })

--PERF:neoclip插件快捷键
vim.keymap.set("n", "<leader>tn", "<cmd>Telescope neoclip<CR>", { silent = true })

--PERF:neogen插件快捷键
vim.keymap.set("n", "<leader>ng", ":lua require('neogen').generate()<CR>", { desc = "Neogen" })

--PERF:noice插件快捷键
vim.keymap.set("n", "<leader>ti", "<cmd>Telescope noice<CR>", { silent = true })

--PERF:nvim-tree插件快捷键
-- ╭──────────────────────────────────────────────────────────╮
-- │                  nvim-tree 常用快捷键速查表              │
-- ╰──────────────────────────────────────────────────────────╯
-- a     → 创建文件/目录             → fs.create()
-- c     → 复制文件                 → fs.copy.node()
-- [c    → 上一个 Git 修改点         → node.navigate.git.prev()
-- ]c    → 下一个 Git 修改点         → node.navigate.git.next()
-- d     → 删除文件                 → fs.remove()
-- gy    → 复制绝对路径             → fs.copy.absolute_path()
-- ge    → 复制文件名               → fs.copy.basename()
-- p     → 粘贴文件                 → fs.paste()
-- r     → 重命名                   → fs.rename()
-- x     → 剪切文件                 → fs.cut()
-- -     → 返回上级目录             → tree.change_root_to_parent()
vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeFindFileToggle<CR>", { silent = true })

--PERF:symbols-outline插件快捷键
-- ╭──────────────────────────────────────────────────────────╮
-- │                      Outline 快捷键说明                  │
-- ╰──────────────────────────────────────────────────────────╯
-- Escape       → 关闭 Outline
-- Enter        → 跳转到符号所在位置（同时关闭 Outline）
-- o            → 跳转到符号但不关闭 Outline
-- Ctrl+Space   → 悬停查看当前符号信息
-- K            → 显示/隐藏当前符号预览
-- r            → 重命名符号
-- a            → 代码操作（Code Actions）
-- h            → 折叠当前符号
-- l            → 展开当前符号
-- W            → 折叠所有符号
-- E            → 展开所有符号
-- R            → 重置所有折叠状态
-- ?            → 显示帮助信息
vim.keymap.set("n", "<leader>s", "<cmd>SymbolsOutline<CR>", { silent = true })

--PERF:telescope插件快捷键
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<CR>", { silent = true })
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { silent = true })

--PERF:toggleterm插件快捷键
vim.keymap.set("n", "<leader>tg", "<cmd>ToggleTerm<CR>", { silent = true })

--PERF:trouble插件快捷键
vim.keymap.set("n", "<leader>td", "<cmd>Trouble diagnostics<CR>", { silent = true })

--PERF:markdown-preview插件快捷键
vim.keymap.set("n", "<leader>m", "<cmd>MarkdownPreviewToggle<CR>", { silent = true })

--PERF:nvim-autopairs插件快捷键
-- ╭────────────────────────────────────────────────────────────╮
-- │                    nvim-surround 常用快捷键速查表          │
-- ╰────────────────────────────────────────────────────────────╯
-- Old text                    Command         New text
-- ---------------------------------------------------------------
-- surr*ound_words             ysiw)           (surround_words)
-- *make strings               ys$"            "make strings"
-- [delete ar*ound me!]        ds]             delete around me!
-- remove <b>HTML t*ags</b>    dst             remove HTML tags
-- 'change quot*es'            cs'"            "change quotes"
-- <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
-- delete(functi*on calls)     dsf             function calls

--PERF:mini-move插件快捷键
if false then
	local dummy_keys = {

		left = "<C-h>",
		right = "<C-l>",
		down = "<C-j>",
		up = "<C-k>",

		-- Move current line in Normal mode
		line_left = "<C-h>",
		line_right = "<C-l>",
		line_down = "<C-j>",
		line_up = "<C-k>",
	}
end
--PERF:comment插件快捷键
if false then
	local dummy_keys = {
		toggler = {
			line = "<leader>c",
			block = "<leader>b",
		},
		opleader = {
			line = "<leader>c",
			block = "<leader>b",
		},
	}
end

--PERF:gitsigns插件快捷键
if false then
	local dummy_keys = function(map, gitsigns)
		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end)

		map("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end)

		map("n", "<leader>hs", gitsigns.stage_hunk)
		map("n", "<leader>hr", gitsigns.reset_hunk)

		map("v", "<leader>hs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)

		map("v", "<leader>hr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)

		map("n", "<leader>hS", gitsigns.stage_buffer)
		map("n", "<leader>hR", gitsigns.reset_buffer)
		map("n", "<leader>hp", gitsigns.preview_hunk)
		map("n", "<leader>hi", gitsigns.preview_hunk_inline)

		map("n", "<leader>hb", function()
			gitsigns.blame_line({ full = true })
		end)

		map("n", "<leader>hd", gitsigns.diffthis)

		map("n", "<leader>hD", function()
			gitsigns.diffthis("~")
		end)

		map("n", "<leader>hQ", function()
			gitsigns.setqflist("all")
		end)
		map("n", "<leader>hq", gitsigns.setqflist)

		-- Toggles
		map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
		map("n", "<leader>tw", gitsigns.toggle_word_diff)
	end
	dummy_keys(a, a)
end

--PERF:blink插件快捷键
if false then
	local dummy_keys = {
		["<Down>"] = {
			function(cmp)
				return cmp.select_next({ auto_insert = false })
			end,
			"fallback",
		},
		["<Tab>"] = {
			function(cmp)
				return cmp.select_next({ auto_insert = false })
			end,
			"fallback",
		},
		["<Up>"] = {
			function(cmp)
				return cmp.select_prev({ auto_insert = false })
			end,
			"fallback",
		},
		["<S-Tab>"] = {
			function(cmp)
				return cmp.select_prev({ auto_insert = false })
			end,
			"fallback",
		},
		["<CR>"] = {
			function(cmp)
				return cmp.accept()
			end,
			"fallback",
		},
	}
end
