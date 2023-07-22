return {
	{ '<leader>so', '<cmd>Telescope find_files previewer=true<CR>', noremap }, -- find files within current working directory, respects gitignore
	{ '<leader>sl', '<cmd>Telescope live_grep previewer=true<CR>', noremap }, -- find string in current working directory as you type
	{ '<leader>sc', '<cmd>Telescope grep_string<CR>', noremap }, -- find string under cursor in current working directory
	{ '<leader>sb', '<cmd>Telescope buffers previewer=true<CR>', noremap }, -- list open buffers in current neovim instance
	{ '<leader>sh', '<cmd>Telescope help_tags previewer=true<CR>', noremap }, -- list available help tags
	{ '<leader>sd', '<cmd>Telescope diagnostics<CR>', noremap }, -- lists diagnostics for all open buffers
	-- telescope git commands
	{ '<leader>sgc', '<cmd>Telescope git_commits previewer=true<CR>', noremap }, -- list all git commits (use <cr> to checkout) ["gc" for git commits]
	{ '<leader>sgf', '<cmd>Telescope git_bcommits previewer=true<CR>', noremap }, -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
	{ '<leader>sgb', '<cmd>Telescope git_branches previewer=true<CR>', noremap }, -- list git branches (use <cr> to checkout) ["gb" for git branch]
	{ '<leader>sgs', '<cmd>Telescope git_status<CR>', noremap }, -- list current changes per file with diff preview ["gs" for git status]
	-- telescope todo-comments
	{ '<leader>st', ':TodoTelescope keywords=TODO,HACK,NOTE,WARN,PERF,TEST,FIX,FIXME,FIXIT,BUG,ISSUE<CR>', noremap }, -- open todo-comments within telescope
}
