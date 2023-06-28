local noremap = { noremap = true, silent = true }

return {
	'iamcco/markdown-preview.nvim',
	build = 'cd app && npm install',
	lazy = true,
	keys = {
		{ '<leader>mpo', ':MarkdownPreview<CR>', noremap }, -- start markdown preview open
		{ '<leader>mps', ':MarkdownPreviewStop<CR>', noremap }, -- stop markdown preview stop
	},
	config = function()
		local browser_path = '/Applications/Firefox.app'
		-- comment browser_path if you want to use the default browser
		local check_browser_path = vim.fn.findfile(browser_path)
		local custom_browser_path = function()
			local custom_path = nil
			if check_browser_path ~= nil then
				custom_path = browser_path
			end
			return custom_path
		end

		vim.g.mkdp_filetypes = { 'markdown' }
		vim.g.mkdp_browser = custom_browser_path()
	end,
	ft = { 'markdown' },
}
