return {
	'williamboman/mason.nvim',
	lazy = true,
	event = 'VeryLazy',
	config = function()
		local mason = require('mason')
		mason.setup({
			ui = {
				icons = {
					package_installed = '✓',
					package_pending = '➜',
					package_uninstalled = '✗',
				},
				border = 'rounded',
				height = 0.8,
				weight = 0.8,
			},
		})
	end,
}
