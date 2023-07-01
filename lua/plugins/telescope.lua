local noremap = { noremap = true, silent = true }

return {
	'nvim-telescope/telescope.nvim',
	lazy = true,
	cmd = 'Telescope',
	dependencies = {
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
	},
	keys = {
		{ '<leader>so', '<cmd>Telescope find_files previewer=true<CR>', noremap }, -- find files within current working directory, respects gitignore
		{ '<leader>sl', '<cmd>Telescope live_grep previewer=true<CR>', noremap }, -- find string in current working directory as you type
		{ '<leader>sc', '<cmd>Telescope grep_string<CR>', noremap }, -- find string under cursor in current working directory
		{ '<leader>sb', '<cmd>Telescope buffers previewer=true<CR>', noremap }, -- list open buffers in current neovim instance
		{ '<leader>sh', '<cmd>Telescope help_tags previewer=true<CR>', noremap }, -- list available help tags
		{ '<leader>sd', '<cmd>Telescope diagnostics<CR>', noremap }, -- lists diagnostics for all open buffers
		-- telescope git commands
		{ '<leader>sgc', '<cmd>Telescope git_commits previewer=true<CR>', noremap }, -- list all git commits (use <cr> to checkout) ["gc" for git commits]
		{ '<leader>sgf', '<cmd>Telescope git_bcommits previewer=true<CR>', noremap }, -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
		{ '<leader>sgb', '<cmd>Telescope git_branches previewer=true<CR>', noremap }, -- list git branches (use <cr> to checkout) ["gb" for git branch]
		{ '<leader>sgs', '<cmd>Telescope git_status<CR>', noremap }, -- list current changes per file with diff preview ["gs" for git status]
		-- telescope todo-comments
		{ '<leader>st', ':TodoTelescope keywords=TODO,HACK,NOTE,WARN,PERF,TEST,FIX,FIXME,FIXIT,BUG,ISSUE<CR>', noremap }, -- open todo-comments within telescope
	},
	config = function()
		local actions = require('telescope.actions')
		local layouts = require('telescope.actions.layout')
		require('telescope').setup({
			defaults = {
				sorting_strategy = 'ascending',
				-- path_display = { 'smart' },
				-- path_display = { truncate = 6 },
				prompt_prefix = '  ',
				layout_strategy = 'vertical',
				layout_config = {
					bottom_pane = {
						height = 25,
						preview_cutoff = 120,
						prompt_position = 'top',
					},
					center = {
						height = 0.99,
						preview_cutoff = 0,
						prompt_position = 'top',
						width = 0.85,
						anchor = 'N',
						mirror = true,
					},
					cursor = {
						height = 0.9,
						preview_cutoff = 40,
						width = 0.8,
					},
					horizontal = {
						height = 0.97,
						preview_cutoff = 0,
						prompt_position = 'top',
						width = 0.99,
						preview_width = 0.55,
					},
					vertical = {
						height = 0.99,
						preview_cutoff = 0,
						prompt_position = 'top',
						width = 0.85,
						preview_height = 0.55,
						anchor = 'N',
						mirror = true,
					},
				},
				dynamic_preview_title = true,
				mappings = {
					i = {
						['<C-k>'] = actions.move_selection_previous, -- move to prev result
						['<C-j>'] = actions.move_selection_next, -- move to next result
						['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickFixList
						['<esc>'] = actions.close, -- close
						['<C-p>'] = layouts.toggle_preview, -- toggle preview.
					},
				},
			},
			pickers = {
				find_files = {
					-- theme = "dropdown",
				},
			},
			extensions = {},
		})
		require('telescope').load_extension('fzf')
	end,
}
