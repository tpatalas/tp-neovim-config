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
keymap.set('n', '<leader>ss', '<cmd>silent! w<CR>', noremap) -- save
keymap.set('n', '<leader>ee', '<cmd>e<CR>', noremap) -- save
keymap.set('n', '<leader>EE', '<cmd>e!<CR>', noremap) -- save
-- search and
keymap.set('n', '<leader>RR', ':%s/<c-r><c-w>/<c-r><c-w>', noremap) -- Search and replace the word under current
keymap.set('n', '<leader>rr', ':let @/ = "\\\\<" . expand(\'<cword>\') . "\\\\>"<CR>:set hlsearch<CR>cgn', noremap) -- Search for the word under the cursor. cgn is removed for versatile usage.

-- keymap.set(
-- 	'n',
-- 	'<leader>rr',
-- 	':let @/ = substitute(expand("<cword>"), "\\\\<\\\\>", "", "g")<CR>:set hlsearch<CR>cgn',
-- 	noremap
-- ) -- Search for the word under the cursor. cgn is removed for versatile usage.

keymap.set('n', '<leader>ll', '<s-v>/\\%V', noremap) -- Search the pattern/word within the highlighted line
keymap.set('n', 'n', 'nzz', noremap) -- center search result
keymap.set('n', 'N', 'Nzz', noremap) -- center search result

----------------
-- formatting --
----------------
-- formatting move lines
keymap.set('n', '<a-up>', ':move -2<CR>', noremap) -- move line upward
keymap.set('n', '<a-down>', ':move +1<CR>', noremap) -- move line downward
-- formatting color
keymap.set('n', '<leader>hio', ':so $VIMRUNTIME/syntax/hitest.vim<CR>', noremap) -- vim highlight group
-- formatting search
keymap.set('n', '<ESC>', ':noh<CR>', noremap) -- exit search highlight

-- general navigation
-- navigation --
keymap.set('n', 'G', 'Gzz', noremap) -- go to the end of the line then center cursor
keymap.set('n', '<s-down>', '<s-down>zz', noremap)
keymap.set('n', '<s-up>', '<s-up>zz', noremap)
keymap.set('n', '<c-d>', '7<down>', noremap) -- move 7 lines down
keymap.set('n', '<PageDown>', '7<down>', noremap) -- move 7 lines down
keymap.set('n', '<c-u>', '7<up>', noremap) -- move 7 lines up
keymap.set('n', '<PageUp>', '7<up>', noremap) -- move 7 lines up
keymap.set('n', '<c-i>', '<c-i>zz', noremap) -- go newer position and center the cursor
keymap.set('n', '<End>', '<c-i>zz', noremap) -- go newer position and center the cursor
keymap.set('n', '<c-o>', '<c-o>zz', noremap) -- go older position and center the cursor
keymap.set('n', '<Home>', '<c-o>zz', noremap) -- go older position and center the cursor

-- undo & redo
keymap.set('n', '=', '<cmd>redo<CR>', noremap)

-- character navigation forward
keymap.set('n', '}', '/}<CR>', noremap)
keymap.set('n', '{', '/{<CR>', noremap)
keymap.set('n', '(', '/(<CR>', noremap)
keymap.set('n', ')', '/)<CR>', noremap)
keymap.set('n', '[', '/[<CR>', noremap)
keymap.set('n', ']', '/]<CR>', noremap)
keymap.set('n', '<', '/<<CR>', noremap)
keymap.set('n', '>', '/><CR>', noremap)
-- character navigation backward
keymap.set('n', '<a-}>', '?}<CR>', noremap)
keymap.set('n', '<a-{>', '?{<CR>', noremap)
keymap.set('n', '<a-(>', '?(<CR>', noremap)
keymap.set('n', '<a-)>', '?)<CR>', noremap)
keymap.set('n', '<a-[>', '?[<CR>', noremap)
keymap.set('n', '<a-]>', '?]<CR>', noremap)
keymap.set('n', '<a-<>', '?<<CR>', noremap)
keymap.set('n', '<a->>', '?><CR>', noremap)

-- buffers navigation
keymap.set('n', '<a-s-right>', ':bn<CR>', noremap) -- go to the next buffer
keymap.set('n', '<a-s-left>', ':bp<CR>', noremap) -- go to the previous buffer
-- buffers action
--[[ keymap.set('n', '<leader>ww', ':silent! bd<CR>', noremap) -- close current buffer ]]
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
keymap.set('n', '<c-@>', '<c-W>w', noremap) -- ctrl+` is the easier way to switch split window-- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
keymap.set('n', '-', '<c-w>w', noremap) -- switch window
keymap.set('n', '<leader>=', '<c-W>=', noremap) -- reset resize: press < alt-= >

-- lazy.nvim
keymap.set('n', 'H', '<cmd>Lazy<CR>', noremap) -- open lazy.nvim

--------------
-- markdown --
--------------
vim.keymap.set('n', '@', '/\\v```\\S+<CR>', noremap) -- jump to code block delimiter
vim.keymap.set('n', '<leader>yy', 'jV/```<CR>ky', noremap) -- copy code code block. (Cursor must be place at the start of code block delimiter)
vim.keymap.set('n', '<leader>@', '/\\v```\\S+<CR>jV/```<CR>ky', noremap) -- jump and copy code code block.
