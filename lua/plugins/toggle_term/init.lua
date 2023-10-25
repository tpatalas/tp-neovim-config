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
				-- FloatBorder = {
				-- 	guifg = colors.palette.sumiInk3,
				-- 	guibg = '',
				-- },
			},
			float_opts = {
				border = 'curved',
				width = function()
					return math.floor(vim.o.columns * 1)
				end,
				height = function()
					return math.floor(vim.o.lines * 0.90)
				end,
				winblend = 0,
			},
		})

		function _G.set_terminal_keymaps()
			local opts = { noremap = true }
			-- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
			vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
			vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
			vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
			vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
			vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
		end

		vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

		local Terminal = require('toggleterm.terminal').Terminal

		local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })

		function _REPL_TOGGLE()
			local repl = createRepl()
			repl:toggle()
		end

		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end
	end,
}
