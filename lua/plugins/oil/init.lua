-- open the preview when oil is open
-- vim.api.nvim_create_autocmd('User', {
-- 	pattern = 'OilEnter',
-- 	callback = vim.schedule_wrap(function(args)
-- 		local oil = require('oil')
-- 		if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
-- 			oil.select({ preview = true })
-- 		end
-- 	end),
-- })

return {
	'stevearc/oil.nvim',
	lazy = true,
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = function()
		local noremap = { noremap = true, silent = true }

		return {
			{ '<leader>ef', ':lua require(\'oil\').open(vim.fn.expand(\'%:p:h\'))<CR>', noremap }, -- open the current directory
			{ '<leader>eo', ':Oil . <CR>', noremap }, -- open the root
			{ '<leader>ec', ':lua require(\'oil\').discard_all_changes()<CR>', noremap }, -- clear all changes
		}
	end,
	config = function()
		require('oil').setup({
			-- cleanup_delay_ms = 200,
			columns = {
				'icon',
				-- { 'size', highlight = 'OilSize' },
				-- { 'mtime', highlight = 'OilMTime' },
				-- "permissions",
			},
			keymaps = {
				['g?'] = 'actions.show_help',
				['<CR>'] = 'actions.select',
				['Y'] = 'actions.select_vsplit',
				['X'] = 'actions.select_split',
				['q'] = 'actions.close',
				['H'] = 'actions.toggle_hidden',
				['P'] = 'actions.preview',
				['<Right>'] = 'actions.open_cwd',
				['<Left>'] = 'actions.parent',
				['<Home>'] = '<c-o>zz', -- go to older position
				['<End>'] = '<c-i>zz', -- go to newer position
			},
			view_options = {
				show_hidden = true,
				sort = {
					{ 'type', 'asc' },
					{ 'name', 'asc' },
					{ 'birthtime', 'desc' },
				},
			},
		})
	end,
}
