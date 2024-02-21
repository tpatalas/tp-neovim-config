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

M.quickfix_count = function()
	local qflist = vim.fn.getqflist()
	local count = #qflist

	if count > 0 then
		return string.format('%d', count)
	else
		return ''
	end
end

M.path_winbar = function()
	local devicons = require('nvim-web-devicons')
	local fullPath = vim.fn.expand('%:p')
	local cwd = vim.fn.getcwd()
	local startIdx, endIdx = fullPath:find(cwd, 1, true)
	local pathStart = endIdx + 1

	if not startIdx or startIdx <= 0 then
		return ' ' .. M.cwd_folder_name() .. fullPath
	end

	local pathBelowCwd = fullPath:sub(pathStart)
	local file = pathBelowCwd:match('([^/]+)/?$')
	local extension = file and file:match('%.([^%.]+)$') or ''

	local pathComponents = {}
	for w in pathBelowCwd:gmatch('([^/]+)') do
		pathComponents[#pathComponents + 1] = w
	end

	local icon = #pathComponents > 1 and devicons.get_icon(file, extension) or ''
	local firstPathComponentIcon = ' |  '

	if #pathComponents > 0 then
		pathComponents[1] = firstPathComponentIcon .. pathComponents[1]
	end

	local desiredPath = #pathComponents >= 8
			and table.concat({
				pathComponents[1],
				pathComponents[2],
				pathComponents[3],
				'...',
				pathComponents[#pathComponents - 2],
				pathComponents[#pathComponents - 1],
				pathComponents[#pathComponents],
			}, '  ')
		or table.concat(pathComponents, '  ')

	if icon ~= '' and file then
		desiredPath = desiredPath:gsub(file, icon .. ' ' .. file, 1)
	end

	return ' ' .. M.cwd_folder_name() .. desiredPath
end

return M
