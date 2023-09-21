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
		local fb_actions = require('telescope._extensions.file_browser.actions')

		require('telescope').setup({
			defaults = default_configs,
			pickers = {
				find_files = {
					-- theme = "dropdown",
				},
			},
			extensions = {
				file_browser = {
					hijack_netrw = true,
					grouped = true,
					hidden = { file_browser = false, folder_browser = false },
					display_stat = { date = true, size = true },
					mappings = {
						['i'] = {
							['<End>'] = fb_actions.goto_cwd,
							['<Home>'] = fb_actions.goto_parent_dir,
							['<S-c>'] = fb_actions.create,
							['<S-d>'] = fb_actions.remove,
							['<S-r>'] = fb_actions.rename,
							['<S-m>'] = fb_actions.move,
							['<S-y>'] = fb_actions.copy,
							['<S-h>'] = fb_actions.toggle_hidden,
							['<S-o>'] = fb_actions.toggle_all,
						},
					},
				},
			},
		})
		require('telescope').load_extension('fzf')
		require('telescope').load_extension('file_browser')
	end,
}
