local cmp_status, cmp = pcall(require, 'cmp')
if not cmp_status then
	return
end

local luasnip_status, luasnip = pcall(require, 'luasnip')
if not luasnip_status then
	return
end

local lspkind_status, lspkind = pcall(require, 'lspkind')
if not lspkind_status then
	return
end

require('luasnip/loaders/from_vscode').lazy_load()

local kind_icons = {
	Text = '',
	Method = 'm',
	Function = '',
	Constructor = '',
	Field = '',
	Variable = '',
	Class = '',
	Interface = '',
	Module = '',
	Property = '',
	Unit = '',
	Value = '',
	Enum = '',
	Keyword = '',
	Snippet = '',
	Color = '',
	File = '',
	Reference = '',
	Folder = '',
	EnumMember = '',
	Constant = '',
	Struct = '',
	Event = '',
	Operator = '',
	TypeParameter = '',
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

-- vim.opt.completeopt = 'menu,menuone,noselect'

cmp.setup({
	performance = {
		trigger_debounce_time = 800,
		throttle = 850,
		fetching_timeout = 150,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
		['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
		['<C-e>'] = cmp.mapping.abort(), -- close completion window
		['<CR>'] = cmp.mapping.confirm({ select = false }),
	}),
	completion = { keyword_length = 3, autocomplete = true },
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = 'nvim_lsp', keyword_length = 2, group_index = 1, max_item_count = 30 }, -- lsp
		{ name = 'luasnip', keyword_length = 3, max_item_count = 30 }, -- snippets
		{ name = 'buffer', keyword_length = 3, max_item_count = 20 }, -- text within current buffer
		{ name = 'path' }, -- file system paths
	}),
	-- configure lspkind for vs-code like icons
	formatting = {
		fields = { 'kind', 'abbr', 'menu' },
		maxwidth = 50,
		ellipsis_char = '...',
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
			vim_item.menu = ({
				nvim_lsp = '[LSP]',
				luasnip = '[SNIP]',
				buffer = '[BUF]',
				path = '[PATH]',
			})[entry.source.name]
			return vim_item
		end,
	},
})
