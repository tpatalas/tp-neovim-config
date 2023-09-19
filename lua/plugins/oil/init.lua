local noremap = { noremap = true, silent = true }

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
	opts = {},
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {
		{ '<leader>ef', ':lua vim.cmd(\'Oil \' .. vim.fn.expand(\'%:p:h\'))<CR>', noremap }, -- open the current directory with float
		{ '<leader>eo', ':Oil . <CR>', noremap }, -- open the root
		{ '<leader>ec', ':lua require(\'oil\').discard_all_changes()<CR>', noremap }, -- clear all changes
	},
	config = function()
		require('oil').setup({
			columns = {
				{ 'icon', highlight = 'OilIcons' },
				-- { 'size', highlight = 'OilSize' },
				-- { 'mtime', highlight = 'OilMTime' },
				-- "permissions",
			},
			-- float = {
			-- 	padding = 2,
			-- 	max_width = 100,
			-- 	max_height = 30,
			-- 	border = 'rounded',
			-- 	win_options = {
			-- 		winblend = 0,
			-- 	},
			-- },
			keymaps = {
				['g?'] = 'actions.show_help',
				['<CR>'] = 'actions.select',
				['Y'] = 'actions.select_vsplit',
				['X'] = 'actions.select_split',
				['P'] = 'actions.preview',
				['q'] = 'actions.close',
				['H'] = 'actions.toggle_hidden',
				['<Left>'] = 'actions.parent',
				['<Right>'] = 'actions.open_cwd',
			},
		})
	end,
}
