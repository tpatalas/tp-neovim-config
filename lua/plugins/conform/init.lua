return {
	'stevearc/conform.nvim',
	config = function()
		require('conform').setup({
			formatters_by_ft = {
				['_'] = {
					'trim_whitespace',
					'trim_newlines',
				},
				['*'] = {
					'codespell',
					'typos',
				},
				markdown = {
					'markdownlint',
				},
				lua = {
					'stylua',
				},
				javascript = {
					'eslint_d',
					'rustywind',
					{ 'prettierd', 'prettier' },
				},
				javascriptreact = {
					'eslint_d',
					'rustywind',
					{ 'prettierd', 'prettier' },
				},
				typescript = {
					'eslint_d',
					'rustywind',
					{ 'prettierd', 'prettier' },
				},
				typescriptreact = {
					'eslint_d',
					'rustywind',
					{ 'prettierd', 'prettier' },
				},
				html = {
					'rustywind',
				},
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
			},
		})
	end,
}
