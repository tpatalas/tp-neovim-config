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
				width = 35,
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
			},
		})
	end,
}
