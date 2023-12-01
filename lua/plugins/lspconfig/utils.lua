local M = {}

local function organize_imports()
	local params = {
		command = '_typescript.organizeImports',
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = '',
	}
	vim.lsp.buf.execute_command(params)
end

local function add_missing_imports()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.buf_get_clients(bufnr)

	if not next(clients) then
		return
	end

	local client = select(2, next(clients))
	local offset_encoding = client.offset_encoding or 'utf-16'

	local params = vim.lsp.util.make_range_params()
	params.context = { only = { 'source.addMissingImports.ts' } }
	params.context.offset_encoding = offset_encoding

	vim.lsp.buf_request(bufnr, 'textDocument/codeAction', params, function(err, result, ctx)
		if err then
			print('Error:', err)
			return
		end
		for _, action in pairs(result or {}) do
			if action.edit then
				vim.lsp.util.apply_workspace_edit(action.edit, offset_encoding)
			elseif action.command then
				local command = type(action.command) == 'table' and action.command or action
				vim.lsp.buf.execute_command(command)
			end
		end
	end)
end

M.organize_imports = organize_imports
M.add_missing_imports = add_missing_imports

return M
