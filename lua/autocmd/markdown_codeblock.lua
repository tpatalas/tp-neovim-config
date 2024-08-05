vim.api.nvim_create_autocmd({ 'BufEnter', 'BufRead', 'BufWinEnter', 'TextChanged', 'TextChangedI' }, {
	pattern = '*.md',
	callback = function()
		vim.defer_fn(function() -- Delay execution to ensure window is ready
			local bufnr = vim.api.nvim_get_current_buf()
			local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
			local in_code_block = false
			local namespace = vim.api.nvim_create_namespace('markdown_code_block')
			local win_width = vim.api.nvim_win_get_width(0)

			-- Clear existing highlights
			vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1)

			for i, line in ipairs(lines) do
				if line:match('^```') then
					in_code_block = not in_code_block
					if in_code_block then
						-- Add virtual text to indicate the type of code block
						local code_type = line:match('^```(.*)') or ''
						vim.api.nvim_buf_set_extmark(bufnr, namespace, i - 1, #line, {
							virt_text = { { code_type, 'Comment' } },
							virt_text_pos = 'eol',
							hl_mode = 'combine',
						})
						goto continue
					end
				end

				if in_code_block then
					vim.api.nvim_buf_add_highlight(bufnr, namespace, 'CustomMarkdownCodeBlock', i - 1, 0, -1)
					local fill_width = math.max(0, win_width)
					local fill_text = string.rep(' ', fill_width)

					vim.api.nvim_buf_set_extmark(bufnr, namespace, i - 1, #line, {
						virt_text = { { fill_text, 'CustomMarkdownCodeBlock' } },
						virt_text_pos = 'overlay',
						hl_mode = 'combine',
					})
				end

				::continue::
			end
		end, 50) -- 50ms delay, adjust as needed
	end,
})
