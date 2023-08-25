local noremap = { noremap = true, silent = true }

return {
	'Vigemus/iron.nvim',
	lazy = true,
	keys = {
		{ '<leader>wo', '<cmd>IronRepl<CR>', noremap },
		{ '<leader>wx', '<cmd>IronHide<CR>', noremap },
	},

	config = function()
		require('iron.core').setup({
			config = {
				repl_definition = {
					sh = {
						command = { 'zsh' },
					},
					typescript = {
						command = { 'ts-node' },
					},
					javascript = {
						command = { 'node' },
					},
					typescriptReact = {
						command = { 'ts-node' },
					},
					javscriptReact = {
						command = { 'node' },
					},
				},
				repl_open_cmd = require('iron.view').split.botright(0.5),
			},
			keymaps = {
				send_line = '<leader>wl',
				visual_send = '<leader>wv',
				send_file = '<leader>wf',
				clear = '<leader>wc',
				exit = '<leader>wq',
			},
		})
	end,
}
