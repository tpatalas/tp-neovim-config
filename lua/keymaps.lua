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
-- search and Replace
keymap.set('n', '<leader>RR', ':%s/<c-r><c-w>/<c-r><c-w>', noremap) -- Search and replace the word under current
keymap.set('n', '<leader>rr', ':let @/ = "\\\\<" . expand(\'<cword>\') . "\\\\>"<CR>:set hlsearch<CR>cgn', noremap) -- Search for the word under the cursor. cgn is removed for versatile usage.
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

-- typescript
keymap.set('n', '<leader>fr', '<cmd>TypescriptRenameFile<CR>', noremap) -- rename file and update imports                                   █│
keymap.set('n', '<leader>fd', '<cmd>TypescriptRemoveUnused<CR>', noremap) -- remove unused variables                                        █│
keymap.set('n', '<leader>fm', '<cmd>TypescriptAddMissingImports<CR>', noremap) -- add missing imports                                       █│
keymap.set('n', '<leader>fo', '<cmd>TypescriptOrganizeImports<CR>', noremap) -- Organize Import (Custom: typescript)

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
