-- https://github.com/glepnir/lspsaga.nvim
-- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua

return {
	'glepnir/lspsaga.nvim',
	event = 'LspAttach',
	config = function()
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true, buffer = bufnr }

		keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opts) -- show definition, references
		keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts) -- see definition and make edits in window
		keymap.set('n', 'gi', '<cmd>Lspsaga goto_definition<CR>', opts) -- go to implementation
		keymap.set('n', 'gt', '<cmd>Lspsaga goto_type_definition<CR>', opts) -- go to Type definition
		keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts) -- see available code actions
		keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts) -- smart rename
		keymap.set('n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<CR>')
		keymap.set('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts) -- jump to previous diagnostic in buffer
		keymap.set('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts) -- jump to next diagnostic in buffer
		keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR><cmd>Lspsaga code_action<CR>', opts) -- jump to previous diagnostic in buffer
		keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR><cmd>Lspsaga code_action<CR>', opts) -- jump to next diagnostic in buffer
		keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts) -- show documentation for what is under cursor

		local saga = require('lspsaga')
		saga.setup({
			lightbulb = {
				enable = false,
			},
			diagnostic = {
				on_insert = false,
				on_insert_follow = false,
				show_code_action = false,
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
