return {
	'utilyre/barbecue.nvim',
	name = 'barbecue',
	version = '*',
	dependencies = {
		'SmiteshP/nvim-navic',
		'nvim-tree/nvim-web-devicons',
	},
	event = 'BufRead',
	config = function()
		require('barbecue').setup({
			attach_navic = false,
		})
	end,
}
