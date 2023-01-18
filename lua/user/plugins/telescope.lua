return {
	'nvim-telescope/telescope-fzf-native.nvim',
	lazy = true,
	cmd = 'Telescope',
	build = 'make',
	dependencies = {
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x', -- fuzzy finder
	},
	config = function()
		local actions = require('telescope.actions')
		require('telescope').setup({
			defaults = {
				sorting_strategy = 'ascending',
				path_display = { 'smart' },
				-- path_display = { truncate = 6 },
				prompt_prefix = '> ',
				layout_strategy = 'horizontal',
				layout_config = {
					bottom_pane = {
						height = 25,
						preview_cutoff = 120,
						prompt_position = 'top',
					},
					center = {
						height = 0.30,
						preview_cutoff = 0,
						prompt_position = 'top',
						width = 0.95,
						anchor = 'N',
						mirror = true,
					},
					cursor = {
						height = 0.9,
						preview_cutoff = 40,
						width = 0.8,
					},
					horizontal = {
						height = 0.99,
						preview_cutoff = 0,
						prompt_position = 'top',
						width = 0.99,
						preview_width = 0.55,
					},
					vertical = {
						height = 0.99,
						preview_cutoff = 0,
						prompt_position = 'top',
						width = 0.90,
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
	end,
}
