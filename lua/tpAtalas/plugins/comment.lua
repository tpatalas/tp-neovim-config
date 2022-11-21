-- import comment plugin safely
local setup, comment = pcall(require, 'Comment')
if not setup then
	return
end

-- enable comment
comment.setup({
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
