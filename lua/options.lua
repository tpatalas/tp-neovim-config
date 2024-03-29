local opt = vim.opt -- for conciseness

opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.pumheight = 5
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
-- opt.colorcolumn = '80'
opt.textwidth = 0
opt.undofile = true -- undo file after ':wpq'
opt.linebreak = true
opt.breakindent = true
opt.lazyredraw = false
-- opt.foldcolumn = '1'
opt.signcolumn = 'yes' -- show sign column so that text doesn't shift
opt.wrap = false
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = false -- highlight all matches
opt.incsearch = true
opt.cursorline = true -- highlight the current cursor line
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.termguicolors = true
opt.updatetime = 500
opt.timeoutlen = 500
opt.background = 'dark' -- colorschemes that can be light or dark will be made dark
opt.backspace = 'indent,eol,start' -- allow backspacr on indent, end of line or insert mode start position
opt.clipboard:append('unnamedplus') -- use system clipboard as default register
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
opt.hidden = false
opt.iskeyword:append('-') -- consider string-string as whole word
opt.backup = false -- creates a backup file
opt.cmdheight = 0 -- more space in the neovim command line for displaying messages
opt.conceallevel = 2 -- so that `` is visible in markdown files
opt.fileencoding = 'utf-8' -- the encoding written to a file
opt.mouse = 'a' -- allow the mouse to be used in neovim
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
-- opt.showtabline = 2 -- always show tabs
opt.smartindent = true -- make indenting smarter again
opt.swapfile = false -- disable/enable the swapFile
opt.shortmess = vim.o.shortmess .. 'aoOstTWFAIc'
opt.splitright = true
opt.fillchars = { eob = ' ' } -- hide end of buffer characters
-- opt.statuscolumn = '%C%@SignCb@%=%T%@NumCb@%r%s'
