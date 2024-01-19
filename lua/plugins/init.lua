-- https://github.com/folke/lazy.nvim

return {
	{
		'nvim-lua/plenary.nvim', -- lua functions that many plugins use
		lazy = true,
		event = 'VeryLazy',
	},
	{
		'andymass/vim-matchup',
		-- lazy load causes issue on this plugin
		lazy = true,
		config = function()
			vim.g.matchup_matchparen_offscreen = ''
		end,
	},
}
