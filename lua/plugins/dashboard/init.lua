return {
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	dependencies = {
		{ 'nvim-tree/nvim-web-devicons' },
	},
	config = function()
		require('dashboard').setup({
			theme = 'hyper',
			hide = {},
			preview = {},
			config = {
				week_header = {
					enable = true,
				},
				packages = {
					enable = true, -- show how many plugins neovim loaded
				},
				footer = {},
			},
		})
	end,
}
