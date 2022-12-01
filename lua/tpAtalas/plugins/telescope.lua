local telescope_setup, telescope = pcall(require, 'telescope')
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, 'telescope.actions')
if not actions_setup then
	return
end

-- configure telescope
telescope.setup({
	-- configure custom mappings
	defaults = {
		sorting_strategy = 'ascending',
		layout_strategy = 'horizontal',
		prompt_prefix = '> ',
		layout_config = {
			prompt_position = 'top',
			horizontal = {
				width = 0.90,
				height = 0.97,
				preview_width = 0.5,
			},
		},
		mappings = {
			i = {
				['<C-k>'] = actions.move_selection_previous, -- move to prev result
				['<C-j>'] = actions.move_selection_next, -- move to next result
				['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
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
