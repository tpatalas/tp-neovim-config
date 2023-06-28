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
		{ '<leader>o', ':lua require("harpoon.ui").nav_next()<CR>zz', noremap }, -- navigate to next mark
		{ '<leader>i', ':lua require("harpoon.ui").nav_prev()<CR>zz', noremap }, -- navigate to previous mark
	},
}
