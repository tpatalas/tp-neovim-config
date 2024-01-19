return {
	'numToStr/Comment.nvim',
	lazy = true,
	event = 'VeryLazy',
	config = function()
		require('Comment').setup({
			toggler = {
				line = '<leader>co',
				block = '"',
			},
			opleader = {
				line = '<leader>co',
				BLock = '"',
			},
		})
	end,
}
