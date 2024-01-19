local noremap = { noremap = true, silent = true }
local keymap = vim.keymap

return {
	'pmizio/typescript-tools.nvim',
	ft = { 'typescript', 'typescriptreact' },
	dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
	config = function()
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		local api = require('typescript-tools.api')

		keymap.set('n', '<leader>fm', ':TSToolsAddMissingImports<CR>', noremap) -- Add missing imports
		keymap.set('n', '<leader>fr', ':TSToolsRemoveUnused<CR>', noremap) -- remove unused variables
		keymap.set('n', '<leader>fd', ':TSToolsRemoveUnusedImports<CR>', noremap) -- remove unused imports
		keymap.set('n', '<leader>fg', ':TSToolsGoToSourceDefinition<CR>', noremap) -- go to source definition
		keymap.set('n', '<leader>fo', ':TSToolsOrganizeImports<CR>', noremap) -- organize imports
		keymap.set('n', '<leader>fs', ':TSToolsSortImports<CR>', noremap) -- sort imports
		keymap.set('n', '<leader>fa', ':TSToolsFixAll<CR>', noremap) -- fix all

		require('typescript-tools').setup({
			capabilities = capabilities,
			settings = {
				separate_diagnostic_server = true,
				publish_diagnostic_on = 'change',
				expose_as_code_action = { 'fix_all', 'add_missing_imports', 'remove_unused' },
				tsserver_max_memory = 'auto',
			},
			handlers = {
				['textDocument/publishDiagnostics'] = api.filter_diagnostics(
					-- Ignore 'This may be converted to an async function' diagnostics.
					{ 80001 }
				),
			},
		})
	end,
}
