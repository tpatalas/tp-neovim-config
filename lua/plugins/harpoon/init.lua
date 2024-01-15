-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2
--
--

return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	lazy = true,
	keys = {
		-- { '<leader>ha', '<cmd>lua require("harpoon"):list():append()<CR>', noremap }, -- add file
		{ '<leader>ha', '<cmd>lua require("harpoon"):list():prepend()<CR>', noremap }, -- add file
		-- {
		-- 	'<leader>ha',
		-- 	'<cmd>lua require("harpoon"):list():prepend()<CR> | <cmd>lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<CR>',
		-- 	noremap,
		-- }, -- add file and open quick menu
		{ '<leader>o', '<cmd>lua require("harpoon"):list():next({ ui_nav_wrap = true })<CR>', noremap }, -- navigate to next mark with wrap
		{ '<leader>i', '<cmd>lua require("harpoon"):list():prev({ ui_nav_wrap = true })<CR>', noremap }, -- navigate to previous mark
		{ '<leader>hc', '<cmd>lua require("harpoon"):list():clear()<CR>', noremap }, -- clear all files
		{ '<leader>hd', '<cmd>lua require("harpoon"):list():remove()<CR>', noremap }, -- remove current file listed on the harpoon list
		{ '<leader>hq', '<cmd>lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<CR>', noremap }, -- quick menu
	},
	config = function()
		local harpoon = require('harpoon')
		local list = harpoon:list()
		local excluded_filetypes = { 'oil', 'gitcommit' }
		local excluded_filenames = { 'wezterm.lua' }

		local function isFileTypeExcluded()
			local filetype = vim.bo.filetype
			return vim.tbl_contains(excluded_filetypes, filetype)
		end

		local function isFileNameExcluded()
			local filename = vim.fn.expand('%:t')
			return vim.tbl_contains(excluded_filenames, filename)
		end

		local function isFileEmpty()
			return vim.fn.line('$') <= 1 and vim.fn.getline(1) == ''
		end

		vim.api.nvim_create_autocmd('VimLeavePre', {
			callback = function()
				if not isFileTypeExcluded() and not isFileNameExcluded() and not isFileEmpty() then
					list:clear()
					list:prepend()
				end
			end,
		})

		harpoon:setup({
			settings = {
				save_on_toggle = false,
				sync_on_ui_close = false,
				key = function()
					return vim.loop.cwd()
				end,
			},
		})
	end,
}
