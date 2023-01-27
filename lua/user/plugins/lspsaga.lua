-- https://github.com/glepnir/lspsaga.nvim
-- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua

return {
	'glepnir/lspsaga.nvim',
	-- event = 'BufRead',
	config = function()
		local colors = require('tokyonight.colors').setup()
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
				enable = true,
				separator = '  ',
				color_mode = false,
			},
			ui = {
				-- currently only round theme
				theme = 'round',
				-- border type can be single,double,rounded,solid,shadow.
				border = '',
				winblend = 0,
				expand = '',
				collapse = '',
				preview = ' ',
				code_action = '💡',
				diagnostic = '🐞',
				incoming = ' ',
				outgoing = ' ',
				colors = {
					-- highlights.LspSagaWinbarFolderName =  -- in the colorScheme
					normal_bg = '',
					red = colors.fg_dark,
					orange = colors.orange,
					white = colors.fg_dark,
				},
				kind = {
					Folder = '',
				},
			},
		})
	end,
}
