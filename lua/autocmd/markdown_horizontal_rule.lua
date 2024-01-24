vim.api.nvim_create_autocmd({ 'BufEnter', 'BufRead', 'BufWinEnter', 'TextChanged', 'InsertLeave' }, {
	pattern = '*.md',
	callback = function()
		vim.defer_fn(function()
			local bufnr = vim.api.nvim_get_current_buf()
			local total_lines = vim.api.nvim_buf_line_count(bufnr)
			local namespace = vim.api.nvim_create_namespace('markdown_horizontal_line')
			local win_width = vim.api.nvim_win_get_width(0)
			local found_first_heading = false

			vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1)

			for i = 1, total_lines do
				local line = vim.api.nvim_buf_get_lines(bufnr, i - 1, i, false)[1]

				if not found_first_heading and line:match('^#%s') then
					found_first_heading = true
				end

				if found_first_heading and line == '---' then
					local unicode_line = string.rep('━', win_width)
					vim.api.nvim_buf_set_extmark(bufnr, namespace, i - 1, 0, {
						virt_text = { { unicode_line, 'CustomMarkdownHorizontalRule' } },
						virt_text_pos = 'overlay',
						hl_mode = 'combine',
					})
				end
			end
		end, 0)
	end,
})
