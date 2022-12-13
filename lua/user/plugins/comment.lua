-- import comment plugin safely
local setup, comment = pcall(require, 'Comment')
if not setup then
	return
end

-- enable comment
comment.setup({
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
	toggler = {
		---Line-comment toggle keymap
		line = '?',
		-- line = "<leader><space><space>",
	},
	---LHS of operator-pending mappings in NORMAL and VISUAL mode
	opleader = {
		---Line-comment keymap
		line = '?',
	},
})
