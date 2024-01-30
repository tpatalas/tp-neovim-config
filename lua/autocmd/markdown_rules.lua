vim.api.nvim_create_autocmd({ 'BufEnter', 'BufRead', 'BufWinEnter', 'TextChanged', 'InsertLeave' }, {
	pattern = '*.md',
	callback = function()
		vim.defer_fn(function()
			local bufnr = vim.api.nvim_get_current_buf()
			local total_lines = vim.api.nvim_buf_line_count(bufnr)
			local ns_markdown_rule = vim.api.nvim_create_namespace('markdown_rule')
			local win_width = vim.api.nvim_win_get_width(0)
			local found_first_heading = false
			local in_code_block = false -- Flag to track if inside a code block
			local set_markdown_extmark = function(line_num, unicode_line, highlight_group)
				vim.api.nvim_buf_set_extmark(bufnr, ns_markdown_rule, line_num, 0, {
					virt_text = { { unicode_line, highlight_group } },
					virt_text_pos = 'overlay',
					hl_mode = 'combine',
				})
			end

			vim.api.nvim_buf_clear_namespace(bufnr, ns_markdown_rule, 0, -1)

			for i = 1, total_lines do
				local line = vim.api.nvim_buf_get_lines(bufnr, i - 1, i, false)[1]

				-- Toggle the in_code_block flag if a code block delimiter is found
				if line:match('^```') then
					in_code_block = not in_code_block
				end

				if not in_code_block then -- Only apply the following if not in a code block
					-- Horizontal line logic
					if not found_first_heading and line:match('^#%s') then
						found_first_heading = true
					end

					if found_first_heading and line == '---' then
						local unicode_line = string.rep('━', win_width)
						set_markdown_extmark(i - 1, unicode_line, 'CustomMarkdownHorizontalRule')
					end

					-- Heading underline logic with additional space
					local underline_char

					if line:match('^#%s') then
						underline_char = '━'
						local unicode_line = string.rep(underline_char, win_width)
						set_markdown_extmark(i, unicode_line, 'CustomMarkdownHeadingUnderline1')
					elseif line:match('^##%s') then
						underline_char = '─'
						local unicode_line = string.rep(underline_char, win_width)
						set_markdown_extmark(i, unicode_line, 'CustomMarkdownHeadingUnderline2')
					elseif line:match('^###%s') then
						underline_char = '─'
					elseif line:match('^####+%s') then
						underline_char = '·'
						local unicode_line = string.rep(underline_char, win_width)
						set_markdown_extmark(i, unicode_line, 'CustomMarkdownHeadingUnderline3')
					end

					-- Quote conceal logic
					local quote_match = line:match('^%s*(>+)%s*')
					if quote_match then
						local concealed_line = string.rep('┃', #quote_match)
						set_markdown_extmark(i - 1, concealed_line, 'CustomMarkdownQuote')
					end
				end
			end
		end, 0)
	end,
})
