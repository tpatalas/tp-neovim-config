return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v2.x',
	dependencies = {
		'MunifTanjim/nui.nvim',
	},
	config = function()
		require('neo-tree').setup({
			filesystem = {
				filtered_items = {
					hide_gitignored = true,
					hide_dotfiles = false,
				},
				follow_current_file = true,
			},
		})
	end,
}
