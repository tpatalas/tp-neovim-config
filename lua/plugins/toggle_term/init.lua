-- local colors = require('catppuccin.palettes').get_palette('mocha')
local colors = require('kanagawa.colors').setup({ theme = 'wave' })

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
			size = 70,
			open_mapping = [[<C-\>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = false,
			shading_factor = 1,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = 'tab', -- 'vertical' | 'horizontal' | 'tab' | 'float',
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
			local opts = { buffer = 0 }
			vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
			vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
			vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
		end

		vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

		local Terminal = require('toggleterm.terminal').Terminal

		local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })

		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end
	end,
}
