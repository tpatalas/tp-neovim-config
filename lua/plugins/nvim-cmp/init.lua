return {
	'hrsh7th/nvim-cmp',
	lazy = true,
	event = 'InsertEnter',
	dependencies = {
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
		'rafamadriz/friendly-snippets',
	},
	config = function()
		local cmp = require('cmp')
		local icons = require('plugins.nvim_cmp.icons')
		local configs = require('plugins.nvim_cmp.configs')

		vim.opt.completeopt = 'menu,menuone,noselect'

		cmp.setup(configs.default_configs(cmp, icons))
		cmp.setup.filetype('gitcommit', configs.gitcommit(cmp))
		cmp.setup.cmdline({ '/', '?' }, configs.cmdline(cmp).search)
		cmp.setup.cmdline(':', configs.cmdline(cmp).default)
	end,
}
