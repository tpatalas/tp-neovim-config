<!-- # Neovim configuration -->

![image](https://github.com/tpAtalas/tp-nvim-lua-config/blob/assets/image.png?raw=true)
colorscheme: [nightfox](https://github.com/EdenEast/nightfox.nvim)

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
  * [Windows/terminal Manager](#windowsterminal-manager)
  * [Essential plugins](#essential-plugins)
  * [Search/find/navigation](#searchfindnavigation)
  * [Autocompletion/snippets](#autocompletionsnippets)
  * [LSP Configuration](#lsp-configuration)
  * [Formatting and linting](#formatting-and-linting)
  * [Syntax highlight and auto-closing](#syntax-highlight-and-auto-closing)
  * [Optimizer](#optimizer)
  * [Git integration](#git-integration)
  * [Markdown](#markdown)
  * [Http client](#http-client)
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
| `<leader>fmf` | Rename files and update imports                  | Plugin: Typescript       |
| `<leader>fmd` | Remove unused variables                          | Plugin: Typescript       |
| `<leader>fmm` | Add missing imports                              | Plugin: Typescript       |
|               |                                                  |                          |
| `alt+up`      | Move the current line upward                     | -                        |
| `alt+down`    | Move the current line downward                   | -                        |
|               |                                                  |                          |
| `<leader>RR`  | Search the word under the cursor and replace all | -                        |
| `<leader>rr`  | Replace the current word under the curosr \*     | press `.` to change next |
| `<leader>DD`  | Delete all                                       | -                        |
| `<leader>AA`  | Select all with Visual mode                      |

\* **Replace the current word under the curosr**:  
_1) `<leader>rr` 2) change
word 3)`<ESC>` 4) Press `.` to apply the change next_

##### Buffers

| Keymap            | Description                         | Comment         |
| ----------------- | ----------------------------------- | --------------- |
| `shift+alt+left`  | Go to the previous buffer           | -               |
| `shift+alt+right` | Go to the next buffer               | -               |
|                   |                                     |                 |
| `F1`              | Go to the buffer 1                  | Plugin: Lualine |
| `F2`              | Go to the buffer 2                  | Plugin: Lualine |
| `F3`              | Go to the buffer 3                  | Plugin: Lualine |
| `F4`              | Go to the buffer 4                  | Plugin: Lualine |
| `F5`              | Go to the buffer 5                  | Plugin: Lualine |
| `F6`              | Go to the buffer 6                  | Plugin: Lualine |
| `F7`              | Go to the buffer 7                  | Plugin: Lualine |
| `F8`              | Go to the buffer 8                  | Plugin: Lualine |
| `F9`              | Go to the buffer 9                  | Plugin: Lualine |
| `F10`             | Go to the buffer 10                 | Plugin: Lualine |
|                   |                                     |                 |
| `<leader>ww`      | Close the current buffer            | -               |
| `<leader>WW`      | Close all except the current buffer | -               |

##### Window Management

| Keymap           | Description                         | Comment |
| ---------------- | ----------------------------------- | ------- |
| `leader+wsv`     | Split the window vertically         | -       |
| `leader+wsh`     | Split the window horizontally       | -       |
| `leader+wsc`     | Close the current split window      | -       |
|                  |                                     |         |
| `ctrl+alt+right` | Increase the vertical window size   | -       |
| `ctrl+alt+left`  | Descrese the vertical window size   | -       |
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

- [Nightfox](https://github.com/EdenEast/nightfox.nvim)
- [Nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

#### Windows/terminal Manager

- [Toggleterm](https://github.com/akinsho/toggleterm.nvim)

#### Essential plugins

- [Vim-surround](https://github.com/tpope/vim-surround)
- [ReplaceWithRegister](https://github.com/vim-scripts/ReplaceWithRegister)
- [Mason](https://github.com/williamboman/mason.nvim)

#### Search/find/navigation

- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Vim-matchup](https://github.com/andymass/vim-matchup)
- [Nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)

#### Autocompletion/snippets

- [Nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [Cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [Cmp-path](https://github.com/hrsh7th/cmp-path)
- [Cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [Cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

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

#### Optimizer

- [Impatient](https://github.com/lewis6991/impatient.nvim)

#### Git integration

- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)

#### Markdown

- [Markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
- [Vim-markdown-toc](https://github.com/iamcco/vim-markdown-toc)
- [Vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)

#### Http client

- [Rest.nvim](https://github.com/rest-nvim/rest.nvim)

#### Comments

- [Todo-comments](https://github.com/folke/todo-comments.nvim)
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [Nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)

### References

- [LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)
- [Josean-dev/dev-environment-files](https://github.com/josean-dev/dev-environment-files)
- [Homebrew](https://brew.sh/)
- [Jesseduffield/lazygit](https://github.com/jesseduffield/lazygit/)
