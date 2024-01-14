-- https://github.com/nvim-neorg/neorg/wiki/#module-naming-convention
-- https://github.com/nvim-neorg/neorg

local noremap = { noremap = true, silent = true }

vim.wo.foldlevel = 99
vim.wo.conceallevel = 2

return {
	'nvim-neorg/neorg',
	build = ':Neorg sync-parsers',
	lazy = true,
	ft = 'norg',
	cmd = 'Neorg',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-cmp',
		'nvim-lua/plenary.nvim',
		'nvim-neorg/neorg-telescope',
	},
	keys = function()
		local noremap = { noremap = true, silent = true }
		return {
			{ '<leader>nt', '<cmd>Neorg toc<CR>', noremap }, -- open table of contents
			{ '<leader>ns', '<cmd>Neorg generate-workspace-summary<CR>', noremap },
			{ '<leader>ni', '<cmd>Neorg index<CR>', noremap }, -- go to index
		}
	end,
	config = function()
		vim.keymap.set('n', '@', '/@code<CR>', noremap) -- find code blockl
		vim.keymap.set('n', '<leader>yy', 'jV/@<CR>ky', noremap) -- yank code block

		require('neorg').setup({
			load = {
				['core.defaults'] = {},
				['core.summary'] = {},
				['core.esupports.metagen'] = {
					config = {
						type = 'auto',
						update_date = true,
						template = {
							{
								'title',
								function()
									return vim.fn.expand('%:t:r')
								end,
							},
							{ 'description', '' },
							{ 'author', 'tpAtalas' },
							{ 'categories', '' },
							{
								'created',
								function()
									return os.date('%d %b %Y %H:%M')
								end,
							},
							{
								'updated',
								function()
									return os.date('%d %b %Y %H:%M')
								end,
							},
							{ 'version', require('neorg').norg_version },
						},
					},
				},
				['core.completion'] = { config = { engine = 'nvim-cmp', name = '[Norg]' } },
				['core.integrations.nvim-cmp'] = {},
				['core.integrations.treesitter'] = {},
				['core.integrations.telescope'] = {},
				['core.syntax'] = {},
				['core.autocommands'] = {},
				['core.concealer'] = {
					config = {
						icons = {
							code_block = {
								conceal = true,
								highlight = 'NeorgCodeBlock',
							},
						},
					},
				},
				['core.dirman'] = {
					config = {
						workspaces = {
							notes = '~/.dev/neorg',
						},
						default_workspace = 'notes',
					},
				},
			},
		})
		-- Set up Neorg telescope keybindings
		local neorg_callbacks = require('neorg.core.callbacks')
	end,
}
