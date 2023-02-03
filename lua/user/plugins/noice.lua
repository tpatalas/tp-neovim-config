-- https://github.com/folke/noice.nvim/blob/main/lua/noice/config/views.lua
return {
	{
		'folke/noice.nvim',
		config = function()
			require('noice').setup({
				cmdline = {
					enabled = true,
					-- view = 'cmdline',
					format = {
						cmdline = { pattern = '^:', icon = '', lang = 'vim' },
					},
				},
				messages = {
					-- popup: powered by nui.nvim
					-- split: powered by nui.nvim
					-- notify: powered by nvim-notify
					-- virtualtext: shows the message as virtualtext (for example for search_count)
					-- mini: similar to notifier.nvim & fidget.nvim
					-- notify_send: generate a desktop notification
					enabled = true, -- enables the Noice messages UI
					view = 'mini', -- default view for messages
					view_error = 'mini', -- view for errors
					view_warn = 'mini', -- view for warnings
					view_history = 'messages', -- view for :messages
					view_search = 'virtualtext', -- view for search count messages. Set to `false` to disable
				},
				commands = {
					history = {
						view = 'split',
						opts = { enter = true, format = 'details' },
						filter = {
							any = {
								{ event = 'notify' },
								{ error = true },
								{ warning = true },
								{ event = 'msg_show', kind = { '' } },
								{ event = 'lsp', kind = 'message' },
							},
						},
					},
					last = {
						view = 'popup',
						opts = { enter = true, format = 'details' },
						filter = {
							any = {
								{ event = 'mini' },
								{ error = true },
								{ warning = true },
								{ event = 'msg_show', kind = { '' } },
								{ event = 'lsp', kind = 'message' },
							},
						},
						filter_opts = { count = 1 },
					},
					errors = {
						view = 'popup',
						opts = { enter = true, format = 'details' },
						filter = { error = true },
						filter_opts = { reverse = true },
					},
				},
				notify = {
					enabled = true,
					view = 'mini',
				},
				lsp = {
					progress = {
						enabled = false,
					},
					override = {
						['vim.lsp.util.convert_input_to_markdown_lines'] = true,
						['vim.lsp.util.stylize_markdown'] = true,
						['cmp.entry.get_documentation'] = true,
					},
					hover = {
						enabled = true,
						view = nil, -- when nil, use defaults from documentation
						opts = {}, -- merged with defaults from documentation
					},
					signature = {
						enabled = true,
						auto_open = {
							enabled = true,
							trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
							luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
							throttle = 5000, -- Debounce lsp signature help request by 50ms
						},
						view = nil, -- when nil, use defaults from documentation
						opts = {}, -- merged with defaults from documentation
					},
					message = {
						enabled = true,
						view = 'virtualtext',
						opts = {},
					},
					documentation = {
						view = 'hover',
						opts = {
							lang = 'markdown',
							replace = true,
							render = 'plain',
							format = { '{message}' },
							win_options = { concealcursor = 'n', conceallevel = 3 },
						},
					},
				},
				markdown = {
					hover = {
						['|(%S-)|'] = vim.cmd.help, -- vim help links
						['%[.-%]%((%S-)%)'] = require('noice.util').open, -- markdown links
					},
					highlights = {
						['|%S-|'] = '@text.reference',
						['@%S+'] = '@parameter',
						['^%s*(Parameters:)'] = '@text.title',
						['^%s*(Return:)'] = '@text.title',
						['^%s*(See also:)'] = '@text.title',
						['{%S-}'] = '@parameter',
					},
				},
				health = {
					checker = true, -- Disable if you don't want health checks to run
				},
				smart_move = {
					enabled = true, -- you can disable this behaviour here
					excluded_filetypes = { 'cmp_menu', 'cmp_docs', 'notify' },
				},
				presets = {
					bottom_search = false, -- use a classic bottom cmdline for search
					command_palette = false, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
				views = {
					mini = {
						timeout = 3000,
						win_options = {
							winblend = 0,
							winhighlight = {
								Normal = 'NoiceMini',
								IncSearch = '',
								Search = '',
							},
						},
					},
					cmdline_popup = {
						position = {
							row = 8,
							col = '50%',
						},
						size = {
							width = 65,
							height = 'auto',
						},
					},
					popupmenu = {
						relative = 'editor',
						position = {
							row = 8,
							col = '50%',
						},
						size = {
							width = 60,
							height = 10,
						},
						border = {
							style = 'rounded',
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
						},
					},
				}, ---@see section on views
				routes = {}, --- @see section on routes
				status = {}, --- @see section on statusline components
				format = {}, --- @see section on formatting
			})
		end,
		dependencies = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		},
	},
}
