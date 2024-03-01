local noremap = { noremap = true, silent = true }

return {
	'wallpants/github-preview.nvim',
	cmd = { 'GithubPreviewToggle' },
	keys = { '<leader>mpt' },
	opts = {
		-- config goes here
	},
	config = function()
		local gpreview = require('github-preview')
		gpreview.setup({
			details_tags_open = false,
			cursor_line = {
				disable = true,
				color = '#c86414',
				opacity = 0.2,
			},
		})

		local fns = gpreview.fns
		vim.keymap.set('n', '<leader>mpt', fns.toggle)
		vim.keymap.set('n', '<leader>mps', fns.single_file_toggle)
		vim.keymap.set('n', '<leader>mpd', fns.details_tags_toggle)
	end,
}
