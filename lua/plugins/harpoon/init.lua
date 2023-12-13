-- https<cmd>//github.com/ThePrimeagen/harpoon

local noremap = { noremap = true, silent = true }

return {
	'ThePrimeagen/harpoon',
	lazy = true,
	keys = {
		{ '<leader>ha', '<cmd>lua require("harpoon.mark").add_file()<CR>', noremap }, -- add file
		{ '<leader>hd', '<cmd>lua require("harpoon.mark").rm_file()<CR>', noremap }, -- remove file
		{ '<leader>hc', '<cmd>lua require("harpoon.mark").clear_all()<CR>', noremap }, -- clear all files
		{ '<leader>hq', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', noremap }, -- quick menu
		{ '<leader>hx', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>dd', noremap }, -- remove file and open the quick menu
		{ '<leader>o', '<cmd>lua require("harpoon.ui").nav_next()<CR>zz', noremap }, -- navigate to next mark
		{ '<leader>i', '<cmd>lua require("harpoon.ui").nav_prev()<CR>zz', noremap }, -- navigate to previous mark
		{ '<leader>1', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>zz', noremap }, -- navigate to file 1
		{ '<leader>2', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>zz', noremap }, -- navigate to file 2
		{ '<leader>3', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>zz', noremap }, -- navigate to file 3
		{ '<leader>4', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>zz', noremap }, -- navigate to file 4
		{ '<leader>5', '<cmd>lua require("harpoon.ui").nav_file(5)<CR>zz', noremap }, -- navigate to file 5
		{ '<leader>6', '<cmd>lua require("harpoon.ui").nav_file(6)<CR>zz', noremap }, -- navigate to file 6
		{ '<leader>7', '<cmd>lua require("harpoon.ui").nav_file(7)<CR>zz', noremap }, -- navigate to file 7
		{ '<leader>8', '<cmd>lua require("harpoon.ui").nav_file(8)<CR>zz', noremap }, -- navigate to file 8
		{ '<leader>9', '<cmd>lua require("harpoon.ui").nav_file(9)<CR>zz', noremap }, -- navigate to file 9
	},
	config = function()
		require('plugins.harpoon.autocmd')
		require('harpoon').setup({
			excluded_filetypes = {
				'harpoon',
				'gitcommit',
				'oil',
				'telescope',
				'toggleterm',
			},
			tabline = false,
			tabline_prefix = '  ',
			tabline_suffix = '  ',
		})
	end,
}
