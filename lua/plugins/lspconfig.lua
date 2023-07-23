-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local noremap = { noremap = true, silent = true }

vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	update_in_insert = true,
})

return {
	'neovim/nvim-lspconfig',
	event = 'BufReadPre',
	dependencies = { 'hrsh7th/cmp-nvim-lsp' },
	keys = {
		{ '<leader>lr', ':LspRestart<CR>', noremap }, -- mapping to restart lsp if necessary
		{ '<leader>ld', ':lua vim.diagnostic.reset()<CR>', noremap }, -- reset diagnostics
		{ '<leader>ls', ':LspStart<CR>', noremap }, -- start lsp
		{ '<leader>lx', ':LspStop<CR>', noremap }, -- stop lsp
		{ '<leader>li', ':LspInfo<CR>', noremap }, -- lsp info
	},
	config = function()
		local lspconfig = require('lspconfig')
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
