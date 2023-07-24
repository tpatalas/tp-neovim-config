return {
	'rmagatti/auto-session',
	config = function()
		require('auto-session').setup({
			bypass_session_save_file_types = { '', 'blank', 'neo-tree', 'noice', 'notify', 'oil' },
			log_level = 'error',
			auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
		})
	end,
}
