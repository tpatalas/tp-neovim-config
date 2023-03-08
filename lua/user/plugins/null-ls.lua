return {
	'jose-elias-alvarez/null-ls.nvim',
	event = 'BufRead',
	config = function()
		local null_ls = require('null-ls')

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local codeactions = null_ls.builtins.code_actions
		local completion = null_ls.builtins.completion

		local eslint = {
			condition = function(utils)
				return utils.root_has_file('.eslintrc.json')
			end,
		}

		local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

		-- Built-in sources:
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
		local source = {
			diagnostics.tsc,
			-- WARNING: diagnostics listed below do not support workspace level diagnostics
			formatting.markdownlint,
			formatting.stylua,
			formatting.prettierd,
			codeactions.eslint_d.with(eslint),
			diagnostics.eslint_d.with(eslint),
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
			float = false,
			virtual_text = true,
			signs = true,
			severity_sort = true,
			update_in_insert = true,
			debounce = 350,
		})
	end,
}
