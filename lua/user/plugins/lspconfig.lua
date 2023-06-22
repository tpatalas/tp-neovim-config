-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	update_in_insert = true,
})

return {
	'neovim/nvim-lspconfig',
	event = 'BufReadPre',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'pmizio/typescript-tools.nvim',
	},
	config = function()
		local lspconfig = require('lspconfig')
		local typescript = require('typescript-tools')
		local cmp_nvim_lsp = require('cmp_nvim_lsp')
		---------------------
		-- keymap setting ---
		---------------------
		local keymap = vim.keymap -- for conciseness

		local keybinds = function()
			local opts = { noremap = true, silent = true, buffer = bufnr }
			-- set keybinds
			keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts) -- got to declaration
			keymap.set('n', '<space>wa', '<cmd>add_workspace_folder<CR>', opts)
		end

		local on_attach = function(client, bufnr)
			keybinds()
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = ' ', Warn = ' ', Info = ' ', Hint = 'ﴞ ' }
		for type, icon in pairs(signs) do
			local hl = 'DiagnosticSign' .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
		end

		-----------
		-- utils --
		-----------
		-- tsserver organize import
		local function organize_imports()
			local params = {
				command = 'TSToolsOrganizeImports',
				arguments = { vim.api.nvim_buf_get_name(0) },
				title = '',
			}
			vim.lsp.buf.execute_command(params)
		end

		-- disable following diagnostics
		vim.lsp.handlers['textDocument/publishDiagnostics'] = function(_, result, ctx, ...)
			local client = vim.lsp.get_client_by_id(ctx.client_id)

			if client and client.name == 'tsserver' then
				result.diagnostics = vim.tbl_filter(function(diagnostic)
					return not diagnostic.message:find('File is a CommonJS module; it may be converted to an ES module.')
				end, result.diagnostics)
			end

			return vim.lsp.diagnostic.on_publish_diagnostics(nil, result, ctx, ...)
		end

		-------------
		-- Servers --
		-------------
		-- html
		lspconfig['html'].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				separate_diagnostic_server = true,
				publish_diagnostic_on = 'insert_leave',
			},
		})

		-- typescript
		-- Currently typescript.nvim plugin gives better functionality
		typescript.setup({
			capabilities = capabilities,
			server = {
				on_attach = on_attach,
				commands = {
					OrganizeImports = {
						organize_imports,
						description = 'Organize Imports',
					},
				},
			},
		})

		lspconfig['dockerls'].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig['jsonls'].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig['cssls'].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				scss = {
					lint = {
						unknownAtRules = 'ignore',
					},
				},
				css = {
					lint = {
						unknownAtRules = 'ignore',
					},
				},
				less = {
					lint = {
						unknownAtRules = 'ignore',
					},
				},
			},
		})

		lspconfig['cssmodules_ls'].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig['tailwindcss'].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				'html',
				'typescriptreact',
				'typescript',
				'javascriptreact',
				'javascript',
				'css',
				'sass',
				'scss',
				'less',
				'svelte',
			},
		})

		lspconfig['emmet_ls'].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
		})

		lspconfig['lua_ls'].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { 'vim' },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand('$VIMRUNTIME/lua')] = true,
							[vim.fn.stdpath('config') .. '/lua'] = true,
						},
					},
				},
			},
		})
	end,
}
