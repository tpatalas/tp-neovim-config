vim.api.nvim_create_autocmd({ 'BufEnter', 'BufRead', 'BufWinEnter', 'TextChanged', 'InsertLeave' }, {
	pattern = '*.md',
	callback = function()
		vim.defer_fn(function()
			local bufnr = vim.api.nvim_get_current_buf()
			local total_lines = vim.api.nvim_buf_line_count(bufnr)
			local namespace = vim.api.nvim_create_namespace('markdown_heading_underline')
			local win_width = vim.api.nvim_win_get_width(0)

			vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1)

			for i = 1, total_lines do
				local line = vim.api.nvim_buf_get_lines(bufnr, i - 1, i, false)[1]

				if line:match('^#%s') or line:match('^##%s') then
					local underline_line_num = i
					local unicode_line = string.rep('─', win_width)

					vim.api.nvim_buf_set_extmark(bufnr, namespace, underline_line_num, 0, {
						virt_text = { { unicode_line, 'CustomMarkdownHeadingUnderline' } },
						virt_text_pos = 'overlay',
						hl_mode = 'combine',
					})
				end
			end
		end, 0)
	end,
})
