return {
	'windwp/nvim-autopairs',
	lazy = true,
	event = { 'CursorMoved', 'CursorMovedI' },
	config = function()
		require('nvim-autopairs').setup({
			check_ts = true, -- enable treesitter
			ts_config = {
				lua = { 'string' }, -- don't add pairs in lua string treesitter nodes
				javascript = { 'template_string' }, -- don't add pairs in javascript template_string treesitter nodes
				java = false, -- don't check treesitter on java
			},
		})

		local cmp_autopairs_setup, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
		if not cmp_autopairs_setup then
			return
		end

		local cmp_setup, cmp = pcall(require, 'cmp')
		if not cmp_setup then
			return
		end

		cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
	end,
}
