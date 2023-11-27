return {
	'williamboman/mason.nvim',
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
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
				border = 'rounded',
				height = 0.8,
				weight = 0.8,
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				'html',
				'bashls',
				'cssls',
				'dockerls',
				'eslint',
				'jsonls',
				'marksman',
				'yamlls',
				'tailwindcss',
				'lua_ls',
				'emmet_ls',
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})
	end,
}
