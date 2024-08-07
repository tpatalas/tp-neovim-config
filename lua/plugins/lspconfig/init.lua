-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local noremap = { noremap = true, silent = true }

vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	update_in_insert = true,
})

return {
	'neovim/nvim-lspconfig',
	lazy = true,
	event = 'VeryLazy',
	dependencies = { 'hrsh7th/cmp-nvim-lsp' },
	keys = {
		{ '<leader>lr', ':LspRestart<CR>', noremap }, -- mapping to restart lsp if necessary
		{ '<leader>ld', ':lua vim.diagnostic.reset()<CR>', noremap }, -- reset diagnostics
		{ '<leader>ls', ':LspStart<CR>', noremap }, -- start lsp
		{ '<leader>lx', ':LspStop<CR>', noremap }, -- stop lsp
		{ '<leader>li', ':LspInfo<CR>', noremap }, -- lsp info
		{ '<leader>fd', ':OrganizeImport<CR>', noremap }, -- tsserver remove unused imports
		{ '<leader>fm', ':AddMissingImports<CR>', noremap }, -- tsserver remove unused imports
	},
	config = function()
		local global_icons = require('utils.global_icons')
		local lspconfig = require('lspconfig')
		local server = require('plugins.lspconfig.servers')
		local signs = {
			Error = global_icons.error,
			Warn = global_icons.warn,
			Info = global_icons.info,
			Hint = global_icons.hint,
		}
		for type, icon in pairs(signs) do
			local hl = 'DiagnosticSign' .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
		end

		-- Servers Enabled -------------------------------------------------------
		lspconfig.eslint.setup(server.eslint)
		lspconfig.html.setup(server.html)
		lspconfig.dockerls.setup(server.dockerls)
		lspconfig.jsonls.setup(server.jsonls)
		lspconfig.cssls.setup(server.cssls)
		lspconfig.cssmodules_ls.setup(server.cssmodules_ls)
		lspconfig.tailwindcss.setup(server.tailwindcss)
		lspconfig.emmet_ls.setup(server.emmet_ls)
		lspconfig.lua_ls.setup(server.lua_ls)
		lspconfig.taplo.setup(server.taplo)
		lspconfig.harper_ls.setup(server.harper_ls)
		-- Servers Disabled ------------------------------------------------------
		-- lspconfig.tsserver.setup(server.tsserver)
	end,
}
