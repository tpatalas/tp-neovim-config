-- more info:
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v2.x',
	dependencies = {
		'MunifTanjim/nui.nvim',
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
				group_empty_dirs = true,
			},

			default_component_configs = {
				indent = {
					padding = 1,
				},
			},
		})
	end,
}
