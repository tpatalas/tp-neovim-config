vim.api.nvim_create_autocmd({ 'BufEnter', 'BufRead', 'BufWinEnter', 'TextChanged', 'InsertLeave' }, {
	pattern = '*.md',
	callback = function()
		vim.defer_fn(function()
			local bufnr = vim.api.nvim_get_current_buf()
			local start_line = vim.fn.line('w0')
			local end_line = vim.fn.line('w$')
			local namespace = vim.api.nvim_create_namespace('markdown_heading_underline')
			local win_width = vim.api.nvim_win_get_width(0)

			vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1)

			for i, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, start_line - 1, end_line, false)) do
				-- Check if the line is a level 1 or level 2 heading
				if line:match('^#%s') or line:match('^##%s') then
					local adjusted_line_num = start_line + i - 1
					local unicode_line = string.rep('─', win_width) -- Using thinnest horizontal line

					vim.api.nvim_buf_set_extmark(bufnr, namespace, adjusted_line_num, 0, {
						virt_text = { { unicode_line, 'CustomMarkdownHeadingUnderline' } },
						virt_text_pos = 'overlay',
						hl_mode = 'combine',
					})
				end
			end
		end, 0)
	end,
})
