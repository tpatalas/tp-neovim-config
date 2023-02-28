-- https://github.com/folke/lazy.nvim
return {
	-- plugin manager
	'nvim-lua/plenary.nvim', -- lua functions that many plugins use

	-- colors
	'norcalli/nvim-colorizer.lua', -- colorizer

	-- essential plugins
	'tpope/vim-surround', -- add, delete, change surroundings (it's awesome)
	'vim-scripts/ReplaceWithRegister', -- replace with register contents using motion (gr + motion)

	-- commenting
	{ 'numToStr/Comment.nvim' },
	{ 'JoosepAlviste/nvim-ts-context-commentstring' },

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
			local browser_path = '/Applications/Firefox.app'
			-- comment browser_path if you want to use the default browser
			local check_browser_path = vim.fn.findfile(browser_path)
			local custom_browser_path = function()
				local custom_path = nil
				if check_browser_path ~= nil then
					custom_path = browser_path
				end
				return custom_path
			end

			vim.g.mkdp_filetypes = { 'markdown' }
			vim.g.mkdp_browser = custom_browser_path()
		end,
		ft = { 'markdown' },
	}, -- markdown preview
	{
		'dhruvasagar/vim-table-mode',
		lazy = true,
		ft = { 'markdown' },
	}, -- markdown table
	{
		'mzlogin/vim-markdown-toc',
		lazy = true,
		ft = { 'markdown' },
	}, -- toc generator
	{
		'ggandor/leap.nvim',
		dependencies = {
			'tpope/vim-repeat',
			config = function()
				require('leap').add_default_mappings()
			end,
		},
	},
	'takac/vim-hardtime',
}
