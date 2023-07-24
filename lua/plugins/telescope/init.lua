local noremap = { noremap = true, silent = true }
local keymaps = require('plugins.telescope.keymaps')

return {
	'nvim-telescope/telescope.nvim',
	lazy = true,
	cmd = 'Telescope',
	dependencies = {
		'nvim-telescope/telescope-fzf-native.nvim',
		'dhruvmanila/browser-bookmarks.nvim',
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
			extensions = { bookmarks = {
				selected_browser = 'chrome',
			} },
		})
		require('telescope').load_extension('fzf')
		require('telescope').load_extension('bookmarks')
	end,
}
