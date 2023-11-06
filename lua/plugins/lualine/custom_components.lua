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

	if not file then
		file = pathBelowCwd:match('([^/]+)/?$')
		pathBelowCwd = pathBelowCwd:gsub('/$', '')
	end

	local extension = file and file:match('%.([^%.]+)$') or ''

	local pathComponents = {}
	for w in pathBelowCwd:gmatch('([^/]+)') do
		table.insert(pathComponents, w)
	end

	local icon = ''
	if #pathComponents > 1 then
		if extension ~= '' then
			icon = devicons.get_icon(file, extension) or ''
		else
			icon = ''
		end
	elseif #pathComponents == 1 then
		icon = ''
	end

	if #pathComponents >= 6 then
		local truncatedComponents = {
			pathComponents[1],
			pathComponents[2],
			'...',
			pathComponents[#pathComponents - 1],
			pathComponents[#pathComponents],
		}
		pathBelowCwd = table.concat(truncatedComponents, '/')
	end

	local desiredPath = pathBelowCwd:gsub('/', '  ')
	desiredPath = desiredPath:gsub(file, icon .. ' ' .. file)

	return desiredPath
end

return M
