-- https://github.com/folke/lazy.nvim

return {
	'nvim-lua/plenary.nvim', -- lua functions that many plugins use
	'tpope/vim-surround', -- add, delete, change surroundings (it's awesome)
	'vim-scripts/ReplaceWithRegister', -- replace with register contents using motion (gr + motion)
	'numToStr/Comment.nvim',
	'JoosepAlviste/nvim-ts-context-commentstring',
	'nvim-tree/nvim-web-devicons',
	{
		'andymass/vim-matchup',
		lazy = true,
		config = function()
			vim.g.matchup_matchparen_offscreen = ''
		end,
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		event = 'BufRead',
		config = function()
			require('indent_blankline').setup({
				space_char_blankline = ' ',
				show_current_context = true,
				show_current_context_start = false,
				char_highlight_list = {
					'IndentBlankLineIndent',
				},
			})
		end,
	},
}
