-- https://github.com/nvim-neo-tree/neo-tree.nvim

local noremap = { noremap = true, silent = true }

return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = {
		'MunifTanjim/nui.nvim',
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	keys = {
		{ '<leader>eo', ':Neotree toggle<CR>', noremap }, -- toggle file explorer
		{ '<leader>ef', ':Neotree reveal_force_cwd<CR>', noremap }, -- reveal in file explorer with forced current working directory
	},
	config = function()
		local default_configs = require('plugins.neo_tree.configs')

		require('neo-tree').setup(default_configs)
	end,
}
