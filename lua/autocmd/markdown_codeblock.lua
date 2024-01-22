vim.api.nvim_create_autocmd({ 'BufEnter', 'BufRead', 'BufWinEnter', 'TextChanged' }, {
	pattern = '*.md',
	callback = function()
		vim.defer_fn(function() -- Defer execution
			local bufnr = vim.api.nvim_get_current_buf()
			local start_line = vim.fn.line('w0') -- Start of visible window
			local end_line = vim.fn.line('w$') -- End of visible window
			local lines = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, end_line, false)
			local in_code_block = false
			local namespace = vim.api.nvim_create_namespace('markdown_code_block')
			local win_width = vim.api.nvim_win_get_width(0)

			for i, line in ipairs(lines) do
				if line:match('^```') then
					in_code_block = not in_code_block
					if in_code_block then
						goto continue
					end
				end

				if in_code_block then
					local adjusted_line_num = start_line + i - 2 -- Adjust line number for visible range
					vim.api.nvim_buf_add_highlight(bufnr, namespace, 'MarkdownCodeBlock', adjusted_line_num, 0, #line)
					local fill_width = win_width - #line
					local fill_text = string.rep(' ', fill_width)

					vim.api.nvim_buf_set_extmark(bufnr, namespace, adjusted_line_num, #line, {
						virt_text = { { fill_text, 'MarkdownCodeBlock' } },
						virt_text_pos = 'overlay',
						hl_mode = 'combine',
					})
				end

				::continue::
			end
		end, 0)
	end,
})
