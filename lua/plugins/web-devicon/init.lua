-- https://github.com/nvim-tree/nvim-web-devicons
-- https://www.nerdfonts.com/cheat-sheet

return {
	'nvim-tree/nvim-web-devicons',
	lazy = true,
	enabled = false,
	ft = { 'norg', 'oil' },
	opts = {
		override_by_extension = {
			['norg'] = {
				icon = '',
				color = '#51a0cf',
				name = 'Neorg',
			},
		},
	},
}
