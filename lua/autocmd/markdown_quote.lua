vim.api.nvim_create_autocmd({ 'BufEnter', 'BufRead', 'BufWinEnter', 'TextChanged', 'InsertLeave' }, {
	pattern = '*.md',
	callback = function()
		vim.defer_fn(function()
			local bufnr = vim.api.nvim_get_current_buf()
			local total_lines = vim.api.nvim_buf_line_count(bufnr)
			local namespace = vim.api.nvim_create_namespace('markdown_quote_conceal')

			vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1)

			for i = 1, total_lines do
				local line = vim.api.nvim_buf_get_lines(bufnr, i - 1, i, false)[1]

				local quote_match = line:match('^%s*(>+)%s*')
				if quote_match then
					local quote_length = #quote_match
					local concealed_line = string.rep('┃', quote_length)

					vim.api.nvim_buf_set_extmark(bufnr, namespace, i - 1, 0, {
						virt_text = { { concealed_line, 'CustomMarkdownQuote' } },
						virt_text_pos = 'overlay',
						hl_mode = 'combine',
						virt_text_win_col = 0,
						priority = 150,
					})
				end
			end
		end, 0)
	end,
})
