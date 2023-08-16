-- https://github.com/folke/flash.nvim

return {
	'folke/flash.nvim',
	event = 'VeryLazy',
	opts = {},
	keys = {},
	config = function()
		require('flash').setup({
			modes = {
				search = {
					enabled = true,
				},
				char = {
					enabled = false,
				},
			},
		})
	end,
}
