-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, 'nvim-tree')
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- configure nvim-tree
nvimtree.setup({
	view = {
		adaptive_size = true,
	},
	-- change folder arrow icons
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
		ignore = true, -- hide files listed in .gitignore
	},
	filters = {
		exclude = {
			'.http', -- more info: :help nvim-tree.filters.exclude
		},
	},

	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
