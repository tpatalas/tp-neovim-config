local noremap = { noremap = true, silent = true }
local keymaps = require('plugins.telescope.keymaps')

return {
	'nvim-telescope/telescope.nvim',
	lazy = true,
	cmd = 'Telescope',
	dependencies = {
		'nvim-telescope/telescope-fzf-native.nvim',
		'nvim-telescope/telescope-file-browser.nvim',
		build = 'make',
	},
	keys = keymaps,
	config = function()
		local default_configs = require('plugins.telescope.configs')

		require('telescope').setup({
			defaults = default_configs,
			pickers = {
				find_files = {
					-- theme = "dropdown",
				},
			},
			extensions = {},
		})
		require('telescope').load_extension('fzf')
		require('telescope').load_extension('file_browser')
	end,
}
