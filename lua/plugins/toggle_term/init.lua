vim.api.nvim_create_autocmd('TermOpen', {
	pattern = 'term://*',
	callback = function()
		vim.cmd('startinsert!')
		vim.defer_fn(function()
			vim.cmd([[stopinsert]])
		end, 10)
	end,
})

return {
	'akinsho/toggleterm.nvim',
	lazy = true,
	version = '*',
	keys = {
		{ '<leader>at', ':ToggleTerm<CR>', { noremap = true, silent = true } },
		{ '<leader>al', ':lua_LAZYGIT_TOGGLE()<CR>', { noremap = true, silent = true } },
	},
	config = function()
		require('toggleterm').setup({
			size = 100,
			open_mapping = [[<C-\>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = false,
			shading_factor = 1,
			start_in_insert = false,
			insert_mappings = true,
			persist_size = true,
			direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float',
			close_on_exit = true,
			shell = vim.o.shell,
			highlights = {
				Normal = {
					guibg = '',
				},
				NormalFloat = {
					link = 'Normal',
				},
			},
			float_opts = {
				border = 'none',
				width = function()
					return math.floor(vim.o.columns * 1)
				end,
				height = function()
					return math.floor(vim.o.lines * 1)
				end,
				winblend = 0,
			},
		})

		function _G.set_terminal_keymaps()
			local opts = { noremap = true }
			vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
			vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
			vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
			vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
			vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
			vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
		end

		vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

		local Terminal = require('toggleterm.terminal').Terminal

		-- local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })

		local lazygit = Terminal:new({
			cmd = 'lazygit',
			dir = 'git_dir',
			direction = 'float',
			on_open = function(term)
				vim.cmd('startinsert!')
				vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
			end,
			on_close = function(term)
				vim.cmd('startinsert!')
			end,
		})

		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end
	end,
}
