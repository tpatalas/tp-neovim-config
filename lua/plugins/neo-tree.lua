-- more info:
-- https://github.com/nvim-neo-tree/neo-tree.nvim
local noremap = { noremap = true, silent = true }

return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v2.x',
	dependencies = {
		'MunifTanjim/nui.nvim',
	},
	keys = {
		{ '<leader>eo', ':Neotree toggle<CR>', noremap }, -- toggle file explorer
		{ '<leader>ef', ':Neotree reveal_force_cwd<CR>', noremap }, -- reveal in file explorer with forced current working directory
	},
	config = function()
		require('neo-tree').setup({
			window = {
				position = 'right',
				width = 40,
			},
			filesystem = {
				filtered_items = {
					hide_gitignored = true,
					hide_dotfiles = false,
					hide_by_name = {
						'.gitignore',
						'.git',
						'.husky',
						'.swc',
					},
				},
				follow_current_file = false,
				never_show = {
					'.DS_Store',
					'thumbs.db',
				},
				group_empty_dirs = false,
			},

			default_component_configs = {
				indent = {
					padding = 1,
				},
			},
		})
	end,
}
