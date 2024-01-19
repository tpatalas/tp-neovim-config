local actions = require('telescope.actions')
local layouts = require('telescope.actions.layout')

return {
	sorting_strategy = 'ascending',
	-- path_display = { 'smart' },
	-- path_display = { truncate = 6 },
	prompt_prefix = ' 󰍉 ',
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
			preview_height = 0.55,
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
			['<esc>'] = actions.close, -- close
			['<C-p>'] = layouts.toggle_preview, -- toggle preview.
		},
	},
}
