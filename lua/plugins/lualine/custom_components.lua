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
	return cwd:match('([^/]+)$')
end

M.filename_with_icon = function()
	local devicons = require('nvim-web-devicons')
	local extension = vim.fn.expand('%:e')
	local file = vim.fn.expand('%:t')
	local icon = extension ~= '' and devicons.get_icon(file, extension) or ''
	return (icon and (icon .. ' ') or '') .. file
end

M.path_winbar = function()
	local devicons = require('nvim-web-devicons')
	local fullPath = vim.fn.expand('%:p')
	local cwd = vim.fn.getcwd()
	local startIdx = fullPath:find(cwd, 1, true)

	if not startIdx or startIdx <= 0 then
		return fullPath
	end

	local pathBelowCwd = fullPath:sub(startIdx + #cwd + 1)
	local file = pathBelowCwd:match('([^/]+)$')
	local extension = file and file:match('%.([^%.]+)$') or ''

	if not file then
		return fullPath
	end

	local icon = extension ~= '' and devicons.get_icon(file, extension) or ''
	local desiredPath = pathBelowCwd:gsub('/', '  ')
	desiredPath = desiredPath:gsub(file, icon .. ' ' .. file)

	return desiredPath
end

return M
