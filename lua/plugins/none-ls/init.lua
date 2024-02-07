-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md

return {
	'nvimtools/none-ls.nvim',
	lazy = true,
	event = 'VeryLazy',
	config = function()
		local null_ls = require('null-ls')
		local configs = require('plugins.none-ls.configs')
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local codeactions = null_ls.builtins.code_actions
		local completion = null_ls.builtins.completion

		local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

		-- Built-in sources:
		-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
		local source = {
			diagnostics.tsc,
			-- WARNING: diagnostics listed below do not support workspace level diagnostics
			formatting.markdownlint,
			diagnostics.markdownlint,
			formatting.stylua,
			formatting.rustywind,
			formatting.taplo,
			formatting.prettierd.with(configs.prettier),
			-- diagnostics.cspell.with(configs.cspell),
			-- codeactions.cspell.with(configs.cspell),
			codeactions.eslint_d.with(configs.eslint),
			diagnostics.eslint_d.with(configs.eslint),
		}

		local on_attach = function(current_client, bufnr)
			if current_client.supports_method('textDocument/formatting') then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd('BufWritePre', {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({
							filter = function(client)
								return client.name == 'null-ls'
							end,
							bufnr = bufnr,
						})
					end,
				})
			end
		end

		null_ls.setup({
			sources = source,
			on_attach = on_attach,
			debug = false,
			fallback_severity = vim.diagnostic.severity.WARN,
			update_in_insert = true,
			debounce = 500,
		})
	end,
}
