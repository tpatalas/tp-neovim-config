local noremap = { noremap = true, silent = true }

vim.lsp.handlers['textDocument/publishDiagnostics'] = function(_, result, ctx, ...)
	local client = vim.lsp.get_client_by_id(ctx.client_id)

	if client and client.name == 'tsserver' then
		result.diagnostics = vim.tbl_filter(function(diagnostic)
			return not diagnostic.message:find('File is a CommonJS module; it may be converted to an ES module.')
		end, result.diagnostics)
	end

	return vim.lsp.diagnostic.on_publish_diagnostics(nil, result, ctx, ...)
end

return {
	'jose-elias-alvarez/typescript.nvim',
	dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
	keys = {
		{ '<leader>fr', '<cmd>TypescriptRenameFile<CR>', noremap }, -- rename file and update imports
		{ '<leader>fd', '<cmd>TypescriptRemoveUnused<CR>', noremap }, -- remove unused variables
		{ '<leader>fm', '<cmd>TypescriptAddMissingImports<CR>', noremap }, -- add missing imports
		{ '<leader>fo', '<cmd>TypescriptOrganizeImports<CR>', noremap }, -- Organize Import (Custom: typescript)
	},
	config = function()
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		require('typescript').setup({
			capabilities = capabilities,
			settings = {
				separate_diagnostic_server = true,
				publish_diagnostic_on = 'insert_leave',
				tsserver_max_memory = 'auto',
			},
		})
	end,
}
