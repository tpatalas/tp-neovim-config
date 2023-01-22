return {
	'glepnir/lspsaga.nvim',
	event = 'BufRead',
	config = function()
		local saga = require('lspsaga')
		saga.setup({
			move_in_saga = { prev = '<C-k>', next = '<C-j>' },
			finder_action_keys = {
				open = '<CR>',
			},
			definition_action_keys = {
				edit = '<CR>',
			},
			symbol_in_winbar = {
				enable = false,
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
	end,
}
