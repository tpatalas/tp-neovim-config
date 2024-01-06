-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-notify.md

return {
	'echasnovski/mini.notify',
	version = false,
	lazy = true,
	event = 'VeryLazy',
	config = function()
		require('mini.notify').setup({
			content = {
				-- Function which formats the notification message
				-- By default prepends message with notification time
				format = nil,

				-- Function which orders notification array from most to least important
				-- By default orders first by level and then by update timestamp
				sort = nil,
			},

			-- Notifications about LSP progress
			lsp_progress = {
				-- Whether to enable showing
				enable = false,

				-- Duration (in ms) of how long last message should be shown
				duration_last = 1000,
			},

			-- Window options
			window = {
				-- Floating window config
				config = {
					-- Specify the width and height of the window
					-- width = 30,
					-- height = 10,

					row = 100,
					-- col = 30,
					border = 'rounded',
				},

				winblend = 0,
			},
		})
	end,
}
