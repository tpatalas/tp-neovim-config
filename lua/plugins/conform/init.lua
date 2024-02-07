-- https://github.com/stevearc/conform.nvim

return {
	'stevearc/conform.nvim',
	enabled = false,
	lazy = true,
	event = { 'VeryLazy' },
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
				rust = {
					'rustfmt',
				},
				markdown = {
					'markdownlint',
				},
				lua = {
					'stylua',
				},
				toml = {
					'taplo',
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
			notify_on_error = false,
		})
	end,
}
