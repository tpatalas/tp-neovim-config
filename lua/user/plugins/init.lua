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
		'utilyre/barbecue.nvim',
		name = 'barbecue',
		version = '*',
		dependencies = {
			'SmiteshP/nvim-navic',
		},
		theme = 'tokyonight',
		opts = {
			show_navic = false,
		},
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		event = 'BufRead',
		config = function()
			require('indent_blankline').setup({
				space_char_blankline = ' ',
				show_current_context = true,
				show_current_context_start = false,
			})
		end,
	},
	{
		'rmagatti/auto-session',
		config = function()
			require('auto-session').setup({
				log_level = 'error',
				auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
			})
		end,
	},
	{
		'ThePrimeagen/harpoon',
	},
}
