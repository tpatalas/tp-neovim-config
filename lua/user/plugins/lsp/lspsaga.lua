-- import lspsaga safely
local saga_status, saga = pcall(require, 'lspsaga')
if not saga_status then
	return
end

saga.setup({
	-- keybinds for navigation in lspsaga window
	move_in_saga = { prev = '<C-k>', next = '<C-j>' },
	-- use enter to open file with finder
	finder_action_keys = {
		open = '<CR>',
	},
	-- use enter to open file with definition preview
	definition_action_keys = {
		edit = '<CR>',
	},
	symbol_in_winbar = {
		enable = true,
		separator = ' ',
		hide_keyword = true,
		show_file = true,
		folder_level = 3,
		respect_root = true,
		color_mode = true,
	},
	ui = {
		-- currently only round theme
		theme = 'round',
		-- border type can be single,double,rounded,solid,shadow.
		border = 'double',
		winblend = 0,
		expand = '',
		collapse = '',
		preview = ' ',
		code_action = '💡',
		diagnostic = '🐞',
		incoming = ' ',
		outgoing = ' ',
		colors = {
			--float window normal background color
			normal_bg = '',
			--title background color
			title_bg = '#afd700',
			red = '#e95678',
			magenta = '#b33076',
			orange = '#FF8700',
			yellow = '#f7bb3b',
			green = '#afd700',
			cyan = '#36d0e0',
			blue = '#61afef',
			purple = '#CBA6F7',
			white = '#d1d4cf',
			black = '#1c1c19',
		},
	},
})
