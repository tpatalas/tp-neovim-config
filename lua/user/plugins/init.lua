return {
	-- plugin manager
	'nvim-lua/plenary.nvim', -- lua functions that many plugins use

	-- colors
	'norcalli/nvim-colorizer.lua', -- colorizer

	-- essential plugins
	'tpope/vim-surround', -- add, delete, change surroundings (it's awesome)
	'vim-scripts/ReplaceWithRegister', -- replace with register contents using motion (gr + motion)

	-- commenting
	{ 'numToStr/Comment.nvim', lazy = true },
	{ 'JoosepAlviste/nvim-ts-context-commentstring', lazy = true },

	-- search and finder
	{
		'andymass/vim-matchup',
		lazy = true,
		config = function()
			vim.g.matchup_matchparen_offscreen = ''
		end,
	},

	-- vscode like icon
	'nvim-tree/nvim-web-devicons',

	-- markdown
	{
		'iamcco/markdown-preview.nvim',
		build = 'cd app && npm install',
		lazy = true,
		config = function()
			vim.g.mkdp_filetypes = { 'markdown' }
		end,
		ft = { 'markdown' },
	}, -- markdown preview
	{ 'dhruvasagar/vim-table-mode', lazy = true }, -- markdown table
	{ 'mzlogin/vim-markdown-toc', lazy = true }, -- toc generator

	{ 'barreiroleo/ltex-extra.nvim', lazy = true },
}
