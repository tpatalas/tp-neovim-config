return {
	'numToStr/Comment.nvim',
	lazy = true,
	event = { 'CursorMoved', 'CursorMovedI' },
	config = function()
		require('Comment').setup({
			pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
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
