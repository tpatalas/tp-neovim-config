return {
	'mfussenegger/nvim-lint',
	config = function()
		local lint = require('lint')
		local linters_all_ft = {
			{ linter = 'codespell', exclude_ft = {}, exclude_file_name = {} },
		}

		lint.linters_by_ft = {
			javascript = {
				'eslint_d',
			},
			javascriptreact = {
				'eslint_d',
			},
			typescript = {
				'eslint_d',
			},
			typescriptreact = {
				'eslint_d',
			},
			markdown = {
				'markdownlint',
			},
			yaml = {
				'actionlint',
			},
		}

		vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost', 'InsertLeave' }, {
			callback = function()
				local ft = vim.bo.filetype
				local filename = vim.fn.expand('%:t')

				require('lint').try_lint()
				for _, linter_config in ipairs(linters_all_ft) do
					if
						not vim.tbl_contains(linter_config.exclude_ft, ft)
						and not vim.tbl_contains(linter_config.exclude_file_name, filename)
					then
						require('lint').try_lint({ linter_config.linter })
					end
				end
			end,
		})
	end,
}
