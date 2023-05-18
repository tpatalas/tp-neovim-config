local keymap = vim.keymap -- for conciseness
local noremap = { noremap = true, silent = true }
-- set leader key to space
keymap.set('', '<Space>', '<Nop>', noremap)
-- disable default help key
keymap.set('', '<F1>', '<Nop>', noremap)
keymap.set('i', '<F1>', '<Nop>', noremap)
vim.g.maplocalleader = ' '
vim.g.mapleader = ' '

-- Modes
--   visual_block_mode = "x",
--   visual_mode = "v",
--   normal_mode = "n",
--   insert_mode = "i",
--   term_mode = "t",
--   command_mode = "c",
--
---------------------------------
-- General Keymaps - Insert Mode
---------------------------------

-- escape insert mode
keymap.set('i', 'jk', '<ESC>', noremap)

-- delete Word in insert mode
keymap.set('i', '<c-d><c-d>', '<ESC>dawi', noremap)

-----------------------------------
-- General Keymaps - Visual Mode --
-----------------------------------
----------------
-- Formatting --
----------------
-- NOTE: moving highlighted lines are usually composed as `:move \'<-2<CR>gv=gv`
-- with single <CR>. However, due to interference of message if there is more than
-- 3 lines of operation, the additional <CR> is added to clear out the message.
keymap.set('v', '<a-up>', ':move \'<-2<CR><CR>gv=gv', noremap) -- move highlighted lines up
keymap.set('v', '<a-down>', ':move \'>+1<CR><CR>gv=gv', noremap) -- move highlighted lines down
keymap.set('v', '<a-right>', '>gv', noremap) -- insert tab
keymap.set('v', '<a-left>', '<gv', noremap) -- remove tab

-----------------------------------
-- General Keymaps - Normal Mode --
-----------------------------------

-------------
-- Global ---
-------------
-- deleting
keymap.set('n', '<leader>DD', ':%d<CR>', noremap) -- delete everything
-- select
keymap.set('n', '<leader>AA', 'ggVG<CR>', noremap) -- select everything in visual mode
-- exiting
keymap.set('n', '<leader>QQ', ':q!<CR>', noremap) -- quit without saving
keymap.set('n', '<leader>qq', ':q<CR>', noremap) -- quit
-- save & edit
keymap.set('n', '<leader>ss', ':silent w<CR>', noremap) -- save
keymap.set('n', '<leader>ee', ':e<CR>', noremap) -- save
keymap.set('n', '<leader>EE', ':e!<CR>', noremap) -- save
-- search and  Replace
keymap.set('n', '<leader>RR', ':%s/<c-r><c-w>/<c-r><c-w>', noremap) -- Search and replace the word under current
keymap.set('n', '<leader>rr', '/\\<<C-R>=expand(\'<cword>\')<CR>\\>\\C<CR>``cgn', noremap) -- search for the current word under the cursor surrounded by angle brackets and perform
keymap.set('n', '<leader>ll', '<s-v>/\\%V', noremap) -- Search the pattern/word within the highlighted line
keymap.set('n', 'n', 'nzz', noremap) -- center search result
keymap.set('n', 'N', 'Nzz', noremap) -- center search result

----------------
-- formatting --
----------------
-- formatting general
keymap.set('n', '<leader>fa', 'gggqG', noremap) -- apply formatting if any
keymap.set('n', '<leader>fr', '<cmd>TypescriptRenameFile<CR>', noremap) -- rename file and update imports
keymap.set('n', '<leader>fd', '<cmd>TypescriptRemoveUnused<CR>', noremap) -- remove unused variables
keymap.set('n', '<leader>fm', '<cmd>TypescriptAddMissingImports<CR>', noremap) -- add missing imports
keymap.set('n', '<leader>fi', '<cmd>OrganizeImports<CR>', noremap) -- Organize Import (Custom: typescript)
-- formatting move lines
keymap.set('n', '<a-up>', ':move -2<CR>', noremap) -- move line upward
keymap.set('n', '<a-down>', ':move +1<CR>', noremap) -- move line downward
-- formatting color
keymap.set('n', '<leader>hio', ':so $VIMRUNTIME/syntax/hitest.vim<CR>', noremap) -- vim highlight group

-- navigation --
-- general navigation
keymap.set('n', 'G', 'Gzz', noremap) -- go to the end of the line then center cursor
keymap.set('n', '<s-down>', '<s-down>zz', noremap)
keymap.set('n', '<s-up>', '<s-up>zz', noremap)
keymap.set('n', '<c-d>', '5<down>', noremap) -- move 5 lines down
keymap.set('n', '<c-u>', '5<up>', noremap) -- move 5 lines up
keymap.set('n', '<c-i>', '<c-i>zz', noremap) -- go newer position and center the cursor
keymap.set('n', '<c-o>', '<c-o>zz', noremap) -- go older position and center the cursor
-- character navigation forward
keymap.set('n', '}', '/}<CR>', noremap)
keymap.set('n', '{', '/{<CR>', noremap)
keymap.set('n', '(', '/(<CR>', noremap)
keymap.set('n', ')', '/)<CR>', noremap)
keymap.set('n', '[', '/[<CR>', noremap)
keymap.set('n', ']', '/]<CR>', noremap)
keymap.set('n', ',', '/,<CR>', noremap)
keymap.set('n', '=', '/=<CR>', noremap)
keymap.set('n', '\'', '/\'<CR>', noremap)
-- character navigation backward
keymap.set('n', '<a-}>', '?}<CR>', noremap)
keymap.set('n', '<a-{>', '?{<CR>', noremap)
keymap.set('n', '<a-(>', '?(<CR>', noremap)
keymap.set('n', '<a-)>', '?)<CR>', noremap)
keymap.set('n', '<a-[>', '?[<CR>', noremap)
keymap.set('n', '<a-]>', '?]<CR>', noremap)
keymap.set('n', '<a-,>', '?,<CR>', noremap)
keymap.set('n', '<a-=>', '?=<CR>', noremap)
keymap.set('n', '<a-\'>', '?\'<CR>', noremap)

-- buffers navigation
keymap.set('n', '<a-s-right>', ':bn<CR>', noremap) -- go to the next buffer
keymap.set('n', '<a-s-left>', ':bp<CR>', noremap) -- go to the previous buffer
-- buffers jump by index
keymap.set('n', '<a-1>', ':LualineBuffersJump 1<CR>', noremap)
keymap.set('n', '<a-2>', ':LualineBuffersJump 2<CR>', noremap)
keymap.set('n', '<a-3>', ':LualineBuffersJump 3<CR>', noremap)
keymap.set('n', '<a-4>', ':LualineBuffersJump 4<CR>', noremap)
keymap.set('n', '<a-5>', ':LualineBuffersJump 5<CR>', noremap)
keymap.set('n', '<a-6>', ':LualineBuffersJump 6<CR>', noremap)
keymap.set('n', '<a-7>', ':LualineBuffersJump 7<CR>', noremap)
keymap.set('n', '<a-8>', ':LualineBuffersJump 8<CR>', noremap)
keymap.set('n', '<a-9>', ':LualineBuffersJump 9<CR>', noremap)
keymap.set('n', '<a-10>', ':LualineBuffersJump 10<CR>', noremap)
-- buffers action
keymap.set('n', '<leader>ww', ':silent! bd<CR>', noremap) -- close current buffer
keymap.set('n', '<leader>WW', ':silent! %bd|e#|normal`"<CR>', noremap) -- close all buffers except current (actual behavior: close all > open last > close [No Name])

-- delete single character without copying into register
keymap.set('n', 'x', '"_x', noremap)

-- Window management --
keymap.set('n', '<leader>wv', '<C-w>v') -- split window vertically
keymap.set('n', '<leader>wh', '<C-w>s') -- split window horizontally
keymap.set('n', '<leader>wc', ':close<CR>') -- close current split window
keymap.set('n', '<c-a-right>', ':vertical resize -5<CR>', noremap) -- increase size vertically
keymap.set('n', '<c-a-left>', ':vertical resize +5<CR>', noremap) -- decrease size vertically
keymap.set('n', '<c-a-up>', ':horizontal resize +5<CR>', noremap) -- increase size horizontally
keymap.set('n', '<c-a-down>', ':horizontal resize -5<CR>', noremap) -- decrease size horizontally
keymap.set('n', '<c-@>', '<C-W>w', noremap) -- ctrl+` is the easier way to switch split window-- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
keymap.set('n', '<leader>=', '<C-W>=', noremap) -- reset resize: press < alt-= >

----------------------
--  Plugin Keybinds --
----------------------

-- toggleTerm
keymap.set('n', '<leader>tt', ':ToggleTerm<CR>', noremap) -- toggle split window maximization or press <c-\>
keymap.set('n', '<leader>tl', ':lua_LAZYGIT_TOGGLE()<CR>', noremap)

---------------
-- telescope --
---------------
-- toggle previewer by <C-p>
-- telescope find files
keymap.set('n', '<leader>to', '<cmd>Telescope find_files previewer=false<CR>', noremap) -- find files within current working directory, respects gitignore
keymap.set('n', '<leader>ts', '<cmd>Telescope live_grep previewer=false<CR>', noremap) -- find string in current working directory as you type
keymap.set('n', '<leader>tc', '<cmd>Telescope grep_string<CR>', noremap) -- find string under cursor in current working directory
keymap.set('n', '<leader>tb', '<cmd>Telescope buffers<CR> previewer=false', noremap) -- list open buffers in current neovim instance
keymap.set('n', '<leader>th', '<cmd>Telescope help_tags previewer=false<CR>', noremap) -- list available help tags
keymap.set('n', '<leader>td', '<cmd>Telescope diagnostics<CR>', noremap) -- lists diagnostics for all open buffers
-- telescope git commands
keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits previewer=false<CR>', noremap) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set('n', '<leader>gf', '<cmd>Telescope git_bcommits<CR> previewer=false', noremap) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches previewer=false<CR>', noremap) -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<CR>', noremap) -- list current changes per file with diff preview ["gs" for git status]
-- telescope todo-comments
keymap.set(
	'n',
	'<leader>tn',
	':TodoTelescope keywords=TODO,HACK,NOTE,WARN,PERF,TEST,FIX,FIXME,FIXIT,BUG,ISSUE<CR>',
	noremap
) -- open todo-comments within telescope

------------------------------
-- file explorer Neotree ---
------------------------------
keymap.set('n', '<leader>eo', ':Neotree toggle<CR>', noremap) -- toggle file explorer
keymap.set('n', '<leader>ef', ':Neotree reveal_force_cwd<CR>', noremap)

------------------------
-- lsp server restart --
------------------------
keymap.set('n', '<leader>lr', ':LspRestart<CR>', noremap) -- mapping to restart lsp if necessary
keymap.set('n', '<leader>ld', ':lua vim.diagnostic.reset()<CR>', noremap) -- reset diagnostics
keymap.set('n', '<leader>ls', ':LspStart<CR>', noremap) -- start lsp
keymap.set('n', '<leader>lx', ':LspStop<CR>', noremap) -- stop lsp
keymap.set('n', '<leader>li', ':LspInfo<CR>', noremap) -- lsp info

-- markdown preview
keymap.set('n', '<leader>mpo', ':MarkdownPreview<CR>', noremap) -- start markdown preview open
keymap.set('n', '<leader>mps', ':MarkdownPreviewStop<CR>', noremap) -- stop markdown preview stop

-- markdown toc
keymap.set('n', '<leader>mco', ':GenTocGFM<CR>', noremap) -- generate markdown toc
keymap.set('n', '<leader>mcu', ':UpdateToc<CR>', noremap) -- update markdown toc
keymap.set('n', '<leader>mcd', ':RemoveToc<CR>', noremap) -- delete markdown toc

-- vim table mode
keymap.set('n', '<leader>mto', ':TableModeToggle<CR>', noremap) -- toggle markdown table

-- colorizer
keymap.set('n', '<leader>cro', ':ColorizerToggle<CR>', noremap) -- toggle colorizer

-------------
-- harpoon --
-------------
keymap.set('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>', noremap) -- add file
keymap.set('n', '<leader>hd', ':lua require("harpoon.mark").rm_file()<CR>', noremap) -- remove file
keymap.set('n', '<leader>hc', ':lua require("harpoon.mark").clear_all()<CR>', noremap) -- clear all files
keymap.set('n', '<leader>hq', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', noremap) -- quick menu
keymap.set('n', '<leader>o', ':lua require("harpoon.ui").nav_next()<CR>zz', noremap) -- navigate to next mark
keymap.set('n', '<leader>i', ':lua require("harpoon.ui").nav_prev()<CR>zz', noremap) -- navigate to prev mark
