return {
	-- plugin manager
	'nvim-lua/plenary.nvim', -- lua functions that many plugins use

	-- colors
	'norcalli/nvim-colorizer.lua', -- colorizer

	-- essential plugins
	'tpope/vim-surround', -- add, delete, change surroundings (it's awesome)
	'vim-scripts/ReplaceWithRegister', -- replace with register contents using motion (gr + motion)

	-- commenting
	'numToStr/Comment.nvim',
	'JoosepAlviste/nvim-ts-context-commentstring',

	-- search and finder
	{
		'andymass/vim-matchup',
		init = function()
			-- may set any options here
			vim.g.matchup_matchparen_offscreen = { method = 'popup' }
		end,
	},

	-- vscode like icon
	'nvim-tree/nvim-web-devicons',

	-- markdown
	{
		'iamcco/markdown-preview.nvim',
		build = 'cd app && npm install',
		init = function()
			vim.g.mkdp_filetypes = { 'markdown' }
		end,
		ft = { 'markdown' },
	}, -- markdown preview
	'dhruvasagar/vim-table-mode', -- markdown table
	'mzlogin/vim-markdown-toc', -- toc generator

	'barreiroleo/ltex-extra.nvim',
}
