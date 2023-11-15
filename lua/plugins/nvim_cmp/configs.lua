local M = {}

M.default_configs = function(cmp, icons)
	return {
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered({ winhighlight = 'NormalFloat:CmpPmenu' }),
			documentation = cmp.config.window.bordered({ winhighlight = 'NormalFloat:CmpPmenu' }),
		},
		mapping = cmp.mapping.preset.insert({
			['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
			['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
			['<Tab>'] = cmp.mapping.select_next_item(), -- next suggestion
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
			['<C-e>'] = cmp.mapping.abort(), -- close completion window
			['<CR>'] = cmp.mapping.confirm({ select = true }),
		}),
		completion = { keyword_length = 2 },
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' }, -- lsp
			{ name = 'luasnip' }, -- snippets
			{ name = 'buffer' }, -- text within current buffer
			{ name = 'path' }, -- file system paths
		}),
		-- configure lspkind for vs-code like icons
		formatting = {
			fields = { 'abbr', 'kind', 'menu' },
			maxwidth = 50,
			ellipsis_char = '...',
			format = function(entry, vim_item)
				-- Kind icons
				vim_item.kind = string.format('%s', icons[vim_item.kind])
				vim_item.menu = ({
					nvim_lsp = '[LSP]',
					luasnip = '[SNIP]',
					buffer = '[BUF]',
					path = '[PATH]',
				})[entry.source.name]
				return vim_item
			end,
		},
	}
end

M.gitcommit = function(cmp)
	return {
		sources = cmp.config.sources({
			{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
		}, {
			{ name = 'buffer' },
		}),
	}
end

M.cmdline = function(cmp)
	return {
		default = {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' },
			}, {
				{ name = 'cmdline' },
			}),
		},
		search = {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer' },
			},
		},
	}
end

return M
