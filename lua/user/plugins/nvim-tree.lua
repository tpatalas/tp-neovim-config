-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, 'nvim-tree')
if not setup then
	return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

nvimtree.setup({
	view = {
		adaptive_size = true,
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = false,
				git = true,
			},
		},
		indent_markers = {
			enable = true, -- press <s-i> toggle on/off
		},
	},
	git = {
		ignore = true,
	},
	filters = {
		exclude = {
			'.http',
			'.md',
		},
	},

	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
