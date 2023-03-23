-- https://github.com/glepnir/lspsaga.nvim
-- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua

return {
	'glepnir/lspsaga.nvim',
	event = 'LspAttach',
	config = function()
		local saga = require('lspsaga')
		saga.setup({
			lightbulb = {
				enable = false,
			},
			diagnostic = {
				on_insert = false,
				on_insert_follow = false,
			},
			move_in_saga = { prev = '<C-k>', next = '<C-j>' },
			finder_action_keys = {
				open = '<CR>',
			},
			definition_action_keys = {
				edit = '<CR>',
			},
			symbol_in_winbar = {
				enable = false,
				separator = '  ',
				color_mode = false,
			},
			ui = {
				-- currently only round theme
				theme = 'round',
				-- border type can be single,double,rounded,solid,shadow.
				border = 'rounded',
				winblend = 0,
				expand = '',
				collapse = '',
				preview = ' ',
				code_action = '💡',
				diagnostic = '🐞',
				incoming = ' ',
				outgoing = ' ',
				kind = {
					Folder = '',
				},
			},
		})
	end,
}
