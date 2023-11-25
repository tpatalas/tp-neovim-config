-- https://github.com/ThePrimeagen/harpoon

local noremap = { noremap = true, silent = true }

return {
	'ThePrimeagen/harpoon',
	lazy = true,
	keys = {
		{ '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>', noremap }, -- add file
		{ '<leader>hd', ':lua require("harpoon.mark").rm_file()<CR>', noremap }, -- remove file
		{ '<leader>hc', ':lua require("harpoon.mark").clear_all()<CR>', noremap }, -- clear all files
		{ '<leader>hq', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', noremap }, -- quick menu
		{ '<leader>hx', ':lua require("harpoon.ui").toggle_quick_menu()<CR>dd', noremap }, -- remove file and open the quick menu
		{ '<leader>o', ':lua require("harpoon.ui").nav_next()<CR>zz', noremap }, -- navigate to next mark
		{ '<leader>i', ':lua require("harpoon.ui").nav_prev()<CR>zz', noremap }, -- navigate to previous mark
		{ '<leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>zz', noremap }, -- navigate to file 1
		{ '<leader>2', ':lua require("harpoon.ui").nav_file(2)<CR>zz', noremap }, -- navigate to file 2
		{ '<leader>3', ':lua require("harpoon.ui").nav_file(3)<CR>zz', noremap }, -- navigate to file 3
		{ '<leader>4', ':lua require("harpoon.ui").nav_file(4)<CR>zz', noremap }, -- navigate to file 4
		{ '<leader>5', ':lua require("harpoon.ui").nav_file(5)<CR>zz', noremap }, -- navigate to file 5
		{ '<leader>6', ':lua require("harpoon.ui").nav_file(6)<CR>zz', noremap }, -- navigate to file 6
		{ '<leader>7', ':lua require("harpoon.ui").nav_file(7)<CR>zz', noremap }, -- navigate to file 7
		{ '<leader>8', ':lua require("harpoon.ui").nav_file(8)<CR>zz', noremap }, -- navigate to file 8
		{ '<leader>9', ':lua require("harpoon.ui").nav_file(9)<CR>zz', noremap }, -- navigate to file 9
	},
	config = function()
		require('plugins.harpoon.autocmd')
		require('harpoon').setup({
			excluded_filetypes = { 'harpoon', 'gitcommit' },
			tabline = false,
			tabline_prefix = '  ',
			tabline_suffix = '  ',
		})
	end,
}
