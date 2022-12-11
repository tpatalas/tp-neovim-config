vim.g.coq_settings = {
	auto_start = 'shut-up',
	display = {
		pum = {
			-- Helps prevent flickering at the risk of having stale results.
			fast_close = false,
		},
    icons = {
      mode = 'long'
  },

	},
	limits = {
		completion_auto_timeout = 300,
	},
}

local coq = require('coq')
