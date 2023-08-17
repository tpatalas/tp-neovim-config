local M = {}

M.total_lines_file = function()
	return vim.fn.line('$')
end

M.anchor = function()
	return '%='
end

M.search_count = function()
	local res = vim.fn.searchcount({ maxcount = 1000, timeout = 500 })

	if res.total > 0 then
		return string.format('%s/%d %s', res.current, res.total, vim.fn.getreg('/'))
	else
		return palette.highlight_high
	end
end

M.cwd_folder_name = function()
  local cwd = vim.fn.getcwd()
  return cwd:match("([^/]+)$")
end

return M
