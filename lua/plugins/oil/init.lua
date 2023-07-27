local noremap = { noremap = true, silent = true }

return {
	'stevearc/oil.nvim',
	opts = {},
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {
		{ '<leader>ef', ':lua require(\'oil\').open(vim.fn.expand(\'%:p:h\'))<CR>', noremap }, -- open the current directory
		{ '<leader>eo', ':Oil . <CR>', noremap }, -- open the root
	},
	config = function()
		require('oil').setup({
			columns = {
				-- { 'mtime', highlight = 'OilMTime' },
				-- { 'size', highlight = 'OilSize' },
				{ 'icon', highlight = 'OilIcons' },
				-- "permissions",
			},
			keymaps = {
				['g?'] = 'actions.show_help',
				['<CR>'] = 'actions.select',
				['<leader>ev'] = 'actions.select_vsplit',
				['<leader>es'] = 'actions.select_split',
				['<leader>ep'] = 'actions.preview',
				['<leader>ww'] = 'actions.close',
				['<leader>er'] = 'actions.refresh',
				['<left>'] = 'actions.parent',
				['h'] = 'actions.parent',
				['<right>'] = 'actions.open_cwd',
				['l'] = 'actions.open_cwd',
				['`'] = 'actions.cd',
				['~'] = 'actions.tcd',
				['<leader>eh'] = 'actions.toggle_hidden',
			},
		})
	end,
}
