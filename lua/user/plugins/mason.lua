return {
	'williamboman/mason.nvim',
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		'jayp0521/mason-null-ls.nvim',
	},
	config = function()
		local mason = require('mason')
		local mason_lspconfig = require('mason-lspconfig')
		local mason_null_ls = require('mason-null-ls')
		-- enable mason
		mason.setup({
			ui = {
				icons = {
					package_installed = '✓',
					package_pending = '➜',
					package_uninstalled = '✗',
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			-- https://github.com/williamboman/mason-lspconfig.nvim
			ensure_installed = {
				'tsserver',
				'html',
				'bashls',
				'cssls',
				'dockerls',
				'eslint',
				'graphql',
				'jsonls',
				'marksman',
				'yamlls',
				'tailwindcss',
				'sumneko_lua',
				'emmet_ls',
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_null_ls.setup({
			-- list of formatters & linters for mason to install
			ensure_installed = {
				'prettier', -- ts/js formatter
				'stylua', -- lua formatter
				'eslint_d', -- ts/js linter
				'markdownlint', -- markdown linter
			},
			-- auto-install configured formatters & linters (with null-ls)
			automatic_installation = true,
		})
	end,
}
