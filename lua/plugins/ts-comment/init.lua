vim.g.skip_ts_context_commentstring_module = true

return {
	'JoosepAlviste/nvim-ts-context-commentstring',
	lazy = true,
	ft = { 'typescriptreact', 'typescript' },
	config = function()
		require('ts_context_commentstring').setup({
			enable_autocmd = false,
		})
	end,
}
