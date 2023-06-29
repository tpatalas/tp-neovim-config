-- https://github.com/nvim-neotest/neotest

local noremap = { noremap = true, silent = true }

return {
	'nvim-neotest/neotest',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		'haydenmeade/neotest-jest',
	},
	keys = {
		{ '<leader>to', '<cmd>lua require("neotest").run.run()<CR>', noremap },
		{ '<leader>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', noremap },
		{ '<leader>tl', '<cmd>lua require("neotest").run.run_last()<CR>', noremap },
		{ '<leader>tx', '<cmd>lua require("neotest").run.stop()<CR>', noremap },
		{ '<leader>ta', '<cmd>lua require("neotest").run.attach()<CR>', noremap },
		{ '<leader>ts', '<cmd>lua require("neotest").summary.toggle()<CR>', noremap },
	},
	config = function()
		require('neotest').setup({
			quickfix = {
				enabled = false,
				open = false,
			},
			output = {
				enabled = false,
			},
			adapters = {
				require('neotest-jest')({
					jestCommand = 'npm test --',
					jestConfigFile = 'jest.config.*',
					env = { CI = true },
					cwd = function()
						return vim.fn.getcwd()
					end,
				}),
			},
		})
	end,
}