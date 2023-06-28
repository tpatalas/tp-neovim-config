local noremap = { noremap = true, silent = true }

return {
	'dhruvasagar/vim-table-mode',
	lazy = true,
	ft = { 'markdown' },
	keys = {
		{ '<leader>mto', '<cmd>TableModeToggle<CR>', noremap }, -- toggle markdown table
	},
}
