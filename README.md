# Neovim Configuration

> [Neovim](https://neovim.io/charter/) is a refactor, and sometimes redactor, in the
> tradition of Vim (which itself derives from Stevie). It is not a rewrite but a
> continuation and extension of Vim. Many clones and derivatives exist, some very
> clever but none are Vim. Neovim is built for users who want the good parts of Vim, and
> more.

![image](https://github.com/tpAtalas/tp-nvim-lua-config/blob/assets/image.png?raw=true)
colorscheme: [Tokyonight](https://github.com/folke/tokyonight.nvim)

## Table of contents

<!-- vim-markdown-toc GFM -->

* [Installation (Homebrew)](#installation-homebrew)
  * [Install Neovim](#install-neovim)
  * [Install Lazygit](#install-lazygit)
* [Major Keymaps](#major-keymaps)
  * [General Keymaps (Normal Mode)](#general-keymaps-normal-mode)
    * [Formatting](#formatting)
    * [Buffers](#buffers)
    * [Window Management](#window-management)
* [Installed Plugins](#installed-plugins)
  * [Plugin Manager](#plugin-manager)
  * [Essential Lua Functions for other plugins](#essential-lua-functions-for-other-plugins)
  * [Themes](#themes)
  * [Windows and terminal Manager](#windows-and-terminal-manager)
  * [Essential plugins](#essential-plugins)
  * [Search, find, and navigation](#search-find-and-navigation)
  * [Autocompletion and snippets](#autocompletion-and-snippets)
  * [LSP Configuration](#lsp-configuration)
  * [Formatting and linting](#formatting-and-linting)
  * [Syntax highlight and auto-closing](#syntax-highlight-and-auto-closing)
  * [Git integration](#git-integration)
  * [Markdown](#markdown)
  * [Comments](#comments)
* [References](#references)

<!-- vim-markdown-toc -->

This repo is the resource for the initial setup of the Neovim Lua.
The primary purpose of this repo is to help you set up Neovim, and none of
these setups is meant to provide the best practice.

### Installation (Homebrew)

> Reference:
>
> [Homebrew Installation](https://brew.sh/)  
> [Lazygit](https://github.com/jesseduffield/lazygit)  
> [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

#### Install Neovim

> For other installation methods, please visit [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

```bash
brew install neovim
```

#### Install Lazygit

> Lazygit is a simple terminal UI for git commands.
>
> For other installation methods, please visit [Lazygit](https://github.com/jesseduffield/lazygit).

```bash
brew install lazygit
```

### Major Keymaps

> [More keymaps](https://github.com/tpAtalas/tp-nvim-lua-config/blob/master/lua/user/core/keymaps.lua)

#### General Keymaps (Normal Mode)

##### Formatting

| Keymap        | Description                                      | Comment                  |
| ------------- | ------------------------------------------------ | ------------------------ |
| `<leader>fma` | Apply formatting                                 | -                        |
| `<leader>fmo` | Remove unused imports                            | -                        |
|               |                                                  |                          |
| `alt+up`      | Move the current line upward                     | -                        |
| `alt+down`    | Move the current line downward                   | -                        |
|               |                                                  |                          |
| `<leader>RR`  | Search the word under the cursor and replace all | -                        |
| `<leader>rr`  | Replace the current word under the cursor \*     | press `.` to change next |
| `<leader>DD`  | Delete all                                       | -                        |
| `<leader>AA`  | Select all with Visual mode                      |

\* **Replace the current word under the cursor**:  
_1) `<leader>rr` 2) change
word 3)`<ESC>` 4) Press `.` to apply the change next_

##### Buffers

| Keymap            | Description                         | Comment         |
| ----------------- | ----------------------------------- | --------------- |
| `shift+alt+left`  | Go to the previous buffer           | -               |
| `shift+alt+right` | Go to the next buffer               | -               |
|                   |                                     |                 |
| `alt+1`           | Go to the buffer 1                  | Plugin: Lualine |
| `alt+2`           | Go to the buffer 2                  | Plugin: Lualine |
| `alt+3`           | Go to the buffer 3                  | Plugin: Lualine |
| `alt+4`           | Go to the buffer 4                  | Plugin: Lualine |
| `alt+5`           | Go to the buffer 5                  | Plugin: Lualine |
| `alt+6`           | Go to the buffer 6                  | Plugin: Lualine |
| `alt+7`           | Go to the buffer 7                  | Plugin: Lualine |
| `alt+8`           | Go to the buffer 8                  | Plugin: Lualine |
| `alt+9`           | Go to the buffer 9                  | Plugin: Lualine |
| `alt+0`           | Go to the buffer 10                 | Plugin: Lualine |
|                   |                                     |                 |
| `alt+w`           | Close the current buffer            | -               |
| `alt+W`           | Close all except the current buffer | -               |

##### Window Management

| Keymap           | Description                         | Comment |
| ---------------- | ----------------------------------- | ------- |
| `leader+wv`      | Split the window vertically         | -       |
| `leader+wh`      | Split the window horizontally       | -       |
| `leader+wc`      | Close the current split window      | -       |
|                  |                                     |         |
| `ctrl+alt+right` | Increase the vertical window size   | -       |
| `ctrl+alt+left`  | Decrease the vertical window size   | -       |
| `ctrl+alt+up`    | Increase the horizontal window size | -       |
| `ctrl+alt+down`  | Decrease the horizontal window size | -       |
|                  |                                     |         |
| `ctrl+backtick`  | Switch between split windows        | -       |
| `<leader>=`      | Reset window size                   | -       |

### Installed Plugins

> Following plugins are installed for the initial setup

#### Plugin Manager

- [Packer](https://github.com/wbthomason/packer.nvim)

#### Essential Lua Functions for other plugins

- [Plenary](https://github.com/nvim-lua/plenary.nvim)

#### Themes

- [Tokyonight](https://github.com/folke/tokyonight.nvim)
- [Nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

#### Windows and terminal Manager

- [Toggleterm](https://github.com/akinsho/toggleterm.nvim)

#### Essential plugins

- [Vim-surround](https://github.com/tpope/vim-surround)
- [ReplaceWithRegister](https://github.com/vim-scripts/ReplaceWithRegister)
- [Mason](https://github.com/williamboman/mason.nvim)

#### Search, find, and navigation

- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Vim-matchup](https://github.com/andymass/vim-matchup)
- [Nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)

#### Autocompletion and snippets

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

#### LSP Configuration

- [Mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
- [Lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Lspsaga](https://github.com/glepnir/lspsaga.nvim)

#### Formatting and linting

- [Null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [Mason-null-ls](https://github.com/mason-null-ls.nvim)

#### Syntax highlight and auto-closing

- [Tree Sitter](https://github.com/nvim-treesitter.install)
- [AutoPair](https://github.com/nvim-autopairs)

#### Git integration

- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)

#### Markdown

- [Markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
- [Vim-markdown-toc](https://github.com/iamcco/vim-markdown-toc)
- [Vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)

#### Comments

- [Todo-comments](https://github.com/folke/todo-comments.nvim)
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [Nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)

### References

- [LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)
- [Josean-dev/dev-environment-files](https://github.com/josean-dev/dev-environment-files)
- [Homebrew](https://brew.sh/)
- [Jesseduffield/lazygit](https://github.com/jesseduffield/lazygit/)
