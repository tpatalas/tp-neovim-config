local keymap = vim.keymap -- for conciseness

local noremap = { noremap = true }

-- set leader key to space
keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.maplocalleader = " "
vim.g.mapleader = " "

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

-- Escape insert mode
keymap.set("i", "jk", "<ESC>l", noremap)

-- Delete Word in insert mode
keymap.set("i", "<c-d><c-d>", "<ESC>dawi", noremap)

---------------------------------
-- General Keymaps - Normal Mode
---------------------------------

-- delete while in insertMode
-- keymap.set("i", "<leader>diw", "<ESC>diwi")
-- keymap.set("i", "<leader>dd", "<ESC>ddi")
keymap.set("n", "<leader>DD", ":%d<CR>", noremap)

-- Exiting
keymap.set("n", "QQ", ":q!<CR>", noremap)
keymap.set("n", "qq", ":q<CR>")

-- Search and  Replace
keymap.set("n", "<leader>ra", ":%s/<c-r><c-w>/", noremap) -- Search and replace the word under current
--cursor
keymap.set("n", "<leader>rr", "*#ciw", noremap) -- Search all same words and replace current worrd under cursor
-- keymap.set("n", "<leader><space>", ":noh<CR>") -- Clear Search Hightlight -- currently turned off
-- from setting

-- Save
keymap.set("n", "SS", ":w<CR>", noremap)
keymap.set("n", "<leader><CR><CR>", ":w<CR><cmd>lua ReloadConfig()<CR>", noremap)

-- Delete single character without copying into register
keymap.set("n", "x", '"_x', noremap)

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- inCRement
keymap.set("n", "<leader>-", "<C-x>") -- deCRement

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- toggleTerm
keymap.set("n", "<leader>tto", ":ToggleTerm<CR>", noremap) -- toggle split window maximization
keymap.set("n", "<leader>ttl", ":lua_LAZYGIT_TOGGLE()<CR>", noremap)

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- file explorer nvim-tree
keymap.set("n", "<leader>fee", ":NvimTreeToggle<CR>", noremap) -- toggle file explorer
keymap.set("n", "<leader>fef", ":NvimTreeFindFile<CR>", noremap) --  Move the cursor in the tree for the current buffer, opening folders if needed.
keymap.set("n", "<leader>fec", ":NvimTreeCollapse<CR>", noremap) -- Collapses the nvim-tree recursively.

-- telescope
keymap.set("n", "<leader>tsf", "<cmd>Telescope find_files<CR>", noremap) -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>tss", "<cmd>Telescope live_grep<CR>", noremas) -- find string in current working directory as you type
keymap.set("n", "<leader>tsc", "<cmd>Telescope grep_string<CR>", noremap) -- find string under cursor in current working directory
keymap.set("n", "<leader>tsb", "<cmd>Telescope buffers<CR>", noremap) -- list open buffers in current neovim instance
keymap.set("n", "<leader>tsh", "<cmd>Telescope help_tags<CR>", noremap) -- list available help tags

-- telescope git commands
keymap.set("n", "<leader>tgc", "<cmd>Telescope git_commits<CR>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>tgf", "<cmd>Telescope git_bcommits<CR>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>tgb", "<cmd>Telescope git_branches<CR>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>tgs", "<cmd>Telescope git_status<CR>") -- list current changes per file with diff preview ["gs" for git status]

-- lsp server restart
keymap.set("n", "<leader>lsr", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- markdown preview
keymap.set("n", "<leader>mpo", ":MarkdownPreview<CR>", noremap) -- start markdown preview open
keymap.set("n", "<leader>mps", ":MarkdownPreviewStop<CR>", noremap) -- stop markdown preview stop

-- markdown toc
keymap.set("n", "<leader>mtg", ":GenTocGFM<CR>", noremap) -- generate markdown toc

-- trouble
keymap.set("n", "<leader>tro", ":Trouble<CR>", noremap) -- Open the list
keymap.set("n", "<leader>trc", ":TroubleClose<CR>", noremap) -- Close the list
keymap.set("n", "<leader>trr", ":TroubleRefresh<CR>", noremap) -- Manually refresh the active list

-- colorizer
keymap.set("n", "<leader>cro", ":ColorizerToggle<CR>", noremap) -- toggle colorizer
