return {
	'MaximilianLloyd/tw-values.nvim',
	lazy = true,
	keys = {
		{ '<leader>sv', '<cmd>TWValues<cr>', desc = 'Show tailwind CSS values' },
	},
	opts = {
		border = 'rounded', -- Valid window border style,
		show_unknown_classes = false, -- Shows the unknown classes popup
	},
}