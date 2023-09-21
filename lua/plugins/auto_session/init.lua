-- https://github.com/rmagatti/auto-session

return {
	'rmagatti/auto-session',
	lazy = false,
	priority = 500,
	config = function()
		require('auto-session').setup({
			bypass_session_save_file_types = { '', 'blank', 'neo-tree', 'noice', 'notify', 'oil' },
			log_level = 'error',
			auto_session_enable_last_session = false,
			auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
		})
	end,
}
