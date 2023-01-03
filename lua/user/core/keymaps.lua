local keymap = vim.keymap -- for conciseness
local noremap = { noremap = true }

-- set leader key to space
keymap.set('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.maplocalleader = ' '
vim.g.mapleader = ' '
vim.g.VM_default_mappings = 0 -- disable the visual-multi default key mapping

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--
---------------------------------
-- General Keymaps - Insert Mode
---------------------------------

-- escape insert mode
keymap.set('i', 'jk', '<ESC>l', noremap)

-- delete Word in insert mode
keymap.set('i', '<c-d><c-d>', '<ESC>dawi', noremap)

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
keymap.set('n', '<leader>ss', ':w<CR>', noremap) -- save
keymap.set('n', '<leader>ee', ':e<CR>', noremap) -- save
keymap.set('n', '<leader>EE', ':e!<CR>', noremap) -- save
-- search and  Replace
keymap.set('n', '<leader>RR', ':%s/<c-r><c-w>/<c-r><c-w>', noremap) -- Search and replace the word under current
keymap.set('n', '<leader>rr', '*#cgn', noremap) -- change the current word under the cursor * change > ESC > press `.` to change next
keymap.set('n', '<leader>ll', '<s-v>/\\%V', noremap) -- Search the pattern/word within the highlighted line

----------------
-- formatting --
----------------
-- formatting general
keymap.set('n', '<leader>fma', 'gggqG', noremap) -- apply formatting if any
keymap.set('n', '<leader>fmr', ':TypescriptRenameFile<CR>') -- rename file and update imports
keymap.set('n', '<leader>fmd', ':TypescriptRemoveUnused<CR>') -- remove unused variables
keymap.set('n', '<leader>fmm', ':TypescriptAddMissingImports<CR>') -- add missing imports
keymap.set('n', '<leader>fmo', ':OrganizeImports<CR>') -- Organize Import (Custom: typescript)
-- formatting move lines
keymap.set('n', '<a-up>', ':move -2<CR>', noremap) -- move line upward
keymap.set('n', '<a-down>', ':move +1<CR>', noremap) -- move line downward
-- formatting color
keymap.set('n', '<leader>hio', ':so $VIMRUNTIME/syntax/hitest.vim<CR>', noremap) -- vim highlight group

-- navigation --
-- general navigation
keymap.set('n', '<c-d>', '<c-d>zz', noremap) -- move forward half a screen then center cursor
keymap.set('n', '<c-u>', '<c-u>zz', noremap) -- move backward half a screen then center cursor
keymap.set('n', ']]', ']]zz', noremap) -- go to the end of the line then center cursor
keymap.set('n', '}', '}zz', noremap) -- jump to the next paragraph then center cursor
keymap.set('n', '{', '{zz', noremap) -- jump to the previous paragraph then center cursor
keymap.set('n', '<s-down>', '<s-down>zz', noremap)
keymap.set('n', '<s-up>', '<s-up>zz', noremap)
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
keymap.set('n', '<a-w>', ':bp<bar>sp<bar>bn<bar>bd<CR>', noremap) -- close current buffer
keymap.set('n', '<a-W>', ':%bd|e#|bd#<CR><CR>', noremap) -- close all buffers except current (actual behavior: close all > open last > close [No Name])

-- delete single character without copying into register
keymap.set('n', 'x', '"_x', noremap)

-- Window management --
keymap.set('n', '<leader>wsv', '<C-w>v') -- split window vertically
keymap.set('n', '<leader>wsh', '<C-w>s') -- split window horizontally
keymap.set('n', '<leader>wsc', ':close<CR>') -- close current split window
keymap.set('n', '<c-a-right>', ':vertical resize +5<CR>', noremap) -- increase size vertically
keymap.set('n', '<c-a-left>', ':vertical resize -5<CR>', noremap) -- decrease size vertically
keymap.set('n', '<c-a-up>', ':horizontal resize +5<CR>', noremap) -- increase size horizontally
keymap.set('n', '<c-a-down>', ':horizontal resize -5<CR>', noremap) -- decrease size horizontally
keymap.set('n', '<c-@>', '<C-W>w', noremap) -- ctrl+` is the easier way to switch split window-- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
keymap.set('n', '<leader>=', '<C-W>=', noremap) -- reset resize: press <alt-=>

----------------------
--  Plugin Keybinds --
----------------------

-- toggleTerm
keymap.set('n', '<leader>tto', ':ToggleTerm<CR>', noremap) -- toggle split window maximization or press <c-\>
keymap.set('n', '<leader>ttl', ':lua_LAZYGIT_TOGGLE()<CR>', noremap)

---------------
-- telescope --
---------------
-- telescope find files
keymap.set('n', '<leader>ffo', '<cmd>Telescope find_files<CR>', noremap) -- find files within current working directory, respects gitignore
keymap.set('n', '<leader>ffs', '<cmd>Telescope live_grep<CR>', noremap) -- find string in current working directory as you type
keymap.set('n', '<leader>ffc', '<cmd>Telescope grep_string<CR>', noremap) -- find string under cursor in current working directory
keymap.set('n', '<leader>ffb', '<cmd>Telescope buffers<CR>', noremap) -- list open buffers in current neovim instance
keymap.set('n', '<leader>ffh', '<cmd>Telescope help_tags<CR>', noremap) -- list available help tags
keymap.set('n', '<leader>ffd', '<cmd>Telescope diagnostics<CR>', noremap) -- lists diagnostics for all open buffers
-- telescope git commands
keymap.set('n', '<leader>fgc', '<cmd>Telescope git_commits<CR>', noremap) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set('n', '<leader>fgf', '<cmd>Telescope git_bcommits<CR>', noremap) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set('n', '<leader>fgb', '<cmd>Telescope git_branches<CR>', noremap) -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set('n', '<leader>fgs', '<cmd>Telescope git_status<CR>', noremap) -- list current changes per file with diff preview ["gs" for git status]
-- telescope todo-comments
keymap.set(
	'n',
	'<leader>fto',
	':TodoTelescope keywords=TODO,HACK,NOTE,WARN,PERF,TEST,FIX,FIXME,FIXIT,BUG,ISSUE<CR>',
	noremap
) -- open todo-comments within telescope

------------------------------
-- file explorer nvim-tree ---
------------------------------
keymap.set('n', '<leader>eeo', ':NvimTreeToggle<CR>', noremap) -- toggle file explorer
keymap.set('n', '<leader>eef', ':NvimTreeFindFile<CR>', noremap) --  Move the cursor in the tree for the current buffer, opening folders if needed.
keymap.set('n', '<leader>eec', ':NvimTreeCollapse<CR>', noremap) -- Collapses the nvim-tree recursively.

-- lsp server restart
keymap.set('n', '<leader>lsr', ':LspRestart<CR>', noremap) -- mapping to restart lsp if necessary

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

-- rest nvim
keymap.set('n', '<leader>rno', '<Plug>RestNvim<CR>', noremap) -- run the request under the cursor
keymap.set('n', '<leader>rnl', '<Plug>RestNvimLast<CR>', noremap) -- re-run the last request
