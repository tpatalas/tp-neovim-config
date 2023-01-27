return {
	'nvim-telescope/telescope.nvim',
	lazy = true,
	cmd = 'Telescope',
	branch = '0.1.x', -- fuzzy finder
	dependencies = {
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
	},
	config = function()
		local actions = require('telescope.actions')
		local layouts = require('telescope.actions.layout')
		require('telescope').setup({
			defaults = {
				sorting_strategy = 'ascending',
				-- path_display = { 'smart' },
				-- path_display = { truncate = 6 },
				prompt_prefix = '  ',
				layout_strategy = 'vertical',
				layout_config = {
					bottom_pane = {
						height = 25,
						preview_cutoff = 120,
						prompt_position = 'top',
					},
					center = {
						height = 0.99,
						preview_cutoff = 0,
						prompt_position = 'top',
						width = 0.85,
						anchor = 'N',
						mirror = true,
					},
					cursor = {
						height = 0.9,
						preview_cutoff = 40,
						width = 0.8,
					},
					horizontal = {
						height = 0.97,
						preview_cutoff = 0,
						prompt_position = 'top',
						width = 0.99,
						preview_width = 0.55,
					},
					vertical = {
						height = 0.99,
						preview_cutoff = 0,
						prompt_position = 'top',
						width = 0.85,
						preview_height = 0.73,
						anchor = 'N',
						mirror = true,
					},
				},
				dynamic_preview_title = true,
				mappings = {
					i = {
						['<C-k>'] = actions.move_selection_previous, -- move to prev result
						['<C-j>'] = actions.move_selection_next, -- move to next result
						['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickFixList
						['<C-p>'] = layouts.toggle_preview, -- toggle preview.
					},
				},
			},
			pickers = {
				find_files = {
					-- theme = "dropdown",
				},
			},
			extensions = {},
		})
		require('telescope').load_extension('fzf')
	end,
}
