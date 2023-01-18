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
		'jose-elias-alvarez/typescript.nvim',
	},
	config = function()
		local lspconfig = require('lspconfig')
		local typescript = require('typescript')
		local cmp_nvim_lsp = require('cmp_nvim_lsp')
		----------------------
		-- ltex custom path --
		----------------------
		-- you need to create the custom path if you wish to save dictionary in one place
		local dictionary_path = vim.fn.finddir('~/.config/langs/ltex') -- optionl
		-- if custom path does not exist it will create a dictionary in cwd (this will lead to save dictionary for each workspace)
		local dictionary_custom_path = function() -- optional
			local custom_path = nil
			if dictionary_path ~= '' then
				custom_path = dictionary_path
			end
			return custom_path
		end

		---------------------
		-- keymap setting ---
		---------------------
		local keymap = vim.keymap -- for conciseness

		local keybinds = function()
			local opts = { noremap = true, silent = true, buffer = bufnr }
			-- set keybinds
			keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opts) -- show definition, references
			keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts) -- got to declaration
			keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts) -- see definition and make edits in window
			keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- go to implementation
			keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts) -- see available code actions
			keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts) -- smart rename
			keymap.set('n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<CR>', opts) -- show  diagnostics for line
			keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts) -- show diagnostics for cursor
			keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts) -- jump to previous diagnostic in buffer
			keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts) -- jump to next diagnostic in buffer
			keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts) -- show documentation for what is under cursor
			keymap.set('n', '<leader>o', '<cmd>LSoutlineToggle<CR>', opts) -- see outline on right hand side
			keymap.set('n', '<space>wa', '<cmd>add_workspace_folder<CR>', opts)
		end

		local on_attach = function(client, bufnr)
			keybinds()
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local on_attach_ltex_extra = function(client, bufnr)
			require('ltex_extra').setup({
				load_langs = { 'en-US' },
				init_check = true,
				path = dictionary_custom_path(),
				log_level = 'none',
			})
			keybinds()
			keymap.set('n', '<leader><cr><cr>', '<cmd>lua require("ltex_extra").reload()<CR>')
		end

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = ' ', Warn = ' ', Hint = 'ﴞ ', Info = ' ' }
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
				command = '_typescript.organizeImports',
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
			on_attach = on_attach,
		})

		-- ltex
		-- equipped with ltex-extra plugin
		lspconfig['ltex'].setup({
			capabilities = capabilities,
			on_attach = on_attach_ltex_extra,
			settings = {
				-- more info on setting: https://valentjn.github.io/ltex/settings.html
				ltex = {
					additionalRules = {
						enablePickyRules = true,
						motherTongue = 'en',
						-- download n-gram: https://dev.languagetool.org/finding-errors-using-n-gram-data.html
						-- please read before download n-gram data, it is 8.3GB for just English.
						languageModel = '~/.language-models/ngram',
						-- download word2vec: https://languagetool.org/download/word2vec/
						-- please read before download word2Vec: https://github.com/languagetool-org/languagetool/blob/master/languagetool-standalone/CHANGES.md#word2vec
						word2VecModel = '~/.language-models/word2VecModel',
					},
					checkFrequency = 'edit', -- save or manual if performance has an issue
					diagnosticSeverity = 'hint',
				},
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
		})

		lspconfig['emmet_ls'].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
		})

		lspconfig['sumneko_lua'].setup({
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
