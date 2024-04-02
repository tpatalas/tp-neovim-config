return {
	'echasnovski/mini.indentscope',
	lazy = true,
	event = 'VeryLazy',
	init = function()
		vim.api.nvim_create_autocmd('FileType', {
			pattern = {
				'norg',
				'help',
				'oil',
				'oil_preview',
				'alpha',
				'dashboard',
				'neo-tree',
				'Trouble',
				'trouble',
				'lazy',
				'mason',
				'notify',
				'toggleterm',
				'lazyterm',
				'markdown',
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
	config = function()
		require('mini.indentscope').setup({
			symbol = '│',
			options = { try_as_border = true },
			draw = {
				delay = 100,
				animation = require('mini.indentscope').gen_animation.none(),
				-- animation = require('mini.indentscope').gen_animation.linear({
				-- 	duration = 0, -- Shorter duration (in ms) for faster animation
				-- 	unit = 'step',
				-- }),
			},
			priority = 1,
		})
	end,
}
