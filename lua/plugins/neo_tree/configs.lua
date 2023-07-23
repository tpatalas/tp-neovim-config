return {
	close_if_last_window = true,
	window = {
		position = 'right',
		width = 45,
	},
	filesystem = {
		filtered_items = {
			hide_gitignored = true,
			hide_dotfiles = false,
			hide_by_name = {
				'.gitignore',
				'.git',
				'.husky',
				'.swc',
			},
		},
		follow_current_file = {
			enabled = true,
		},
		never_show = {
			'.DS_Store',
			'thumbs.db',
		},
		group_empty_dirs = false,
	},
	use_libuv_file_watcher = true,
	default_component_configs = {
		indent = {
			padding = 0,
		},
	},
	source_selector = {
		winbar = false,
		statusline = true,
	},
}
