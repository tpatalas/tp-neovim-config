-- https://github.com/mzlogin/vim-markdown-toc

local noremap = { noremap = true, silent = true }

return {
	'mzlogin/vim-markdown-toc',
	lazy = true,
	ft = { 'markdown' },
	keys = {
		{ '<leader>mco', ':GenTocGFM<CR>', noremap }, -- generate markdown table of contents
		{ '<leader>mcu', ':UpdateToc<CR>', noremap }, -- update markdown table of contents
		{ '<leader>mcd', ':RemoveToc<CR>', noremap }, -- delete markdown table of contents
	},
}
