vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

return {
	'nvim-tree/nvim-tree.lua',
	lazy = true,
	cmd = { 'NvimTreeToggle', 'NvimTreeFindFile' },
	config = function()
		require('nvim-tree').setup({
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
			update_focused_file = {
				enable = true,
				update_root = false,
				ignore_list = {},
			},
		})
	end,
}
