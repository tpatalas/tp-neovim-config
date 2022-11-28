# Neovim initial setup

![image](https://github.com/tpAtalas/tp-nvim-lua-config/blob/c6f214e0820f01bfc1bc38b3aad87170abeb7670/image.png?raw=true)

## Table of contents

<!-- vim-markdown-toc GFM -->

- [Installation (Homebrew)](#installation-homebrew)
  - [Install Neovim](#install-neovim)
  - [Install Lazygit](#install-lazygit)
- [Installed Plugins](#installed-plugins)
  - [Plugin Manager](#plugin-manager)
  - [Essential Lua Functions for other plugins](#essential-lua-functions-for-other-plugins)
  - [Themes/colors/icons](#themescolorsicons)
  - [Windows/terminal Manager](#windowsterminal-manager)
  - [Essential plugins](#essential-plugins)
  - [File Explorer/status](#file-explorerstatus)
  - [Search and find](#search-and-find)
  - [Autocompletion](#autocompletion)
  - [Snippet](#snippet)
  - [LSP Configuration](#lsp-configuration)
  - [Formatting and linting](#formatting-and-linting)
  - [Syntax highlight and auto-closing](#syntax-highlight-and-auto-closing)
  - [Optimizer](#optimizer)
  - [Git integration](#git-integration)
  - [Markdown](#markdown)
  - [Code observer](#code-observer)
  - [Http client](#http-client)
  - [Comments](#comments)
- [References](#references)

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

### Installed Plugins

> Following plugins are installed for the initial setup

#### Plugin Manager

- [Packer](https://github.com/wbthomason/packer.nvim)

#### Essential Lua Functions for other plugins

- [Plenary](https://github.com/nvim-lua/plenary.nvim)

#### Themes/colors/icons

> Checkout [Rose Pine Palette](https://rosepinetheme.com/palette)

- [Rose-pine](https://github.com/rose-pine/neovim)
- [Nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua)
- [Nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

#### Windows/terminal Manager

- [Toggleterm](https://github.com/akinsho/toggleterm.nvim)

#### Essential plugins

- [Vim-surround](https://github.com/tpope/vim-surround)
- [ReplaceWithRegister](https://github.com/vim-scripts/ReplaceWithRegister)
- [Mason](https://github.com/williamboman/mason.nvim)

#### File Explorer/status

- [Nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)

#### Search and find

- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Visual-multi](https://github.com/mg979/vim-visual-multi)

#### Autocompletion

- [Nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [Cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [Cmp-path](https://github.com/hrsh7th/cmp-path)

#### Snippet

- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [Cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [Friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

#### LSP Configuration

- [Mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
- [Lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [Lspsaga](https://github.com/glepnir/lspsaga.nvim)
- [Lspkind](https://github.com/onsails/lspkind.nvim)

#### Formatting and linting

- [Null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [Mason-null-ls](https://github.com/mason-null-ls.nvim)

#### Syntax highlight and auto-closing

- [Tree Sitter](https://github.com/nvim-treesitter.install)
- [AutoPair](https://github.com/nvim-autopairs)
- [Nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)

#### Optimizer

- [Impatient](https://github.com/lewis6991/impatient.nvim)

#### Git integration

- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)

#### Markdown

- [Markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
- [Vim-Markdown-toc](https://github.com/iamcco/vim-markdown-toc)

#### Code observer

- [Trouble](https://github.com/folke/trouble.nvim)

#### Http client

- [Rest.nvim](https://github.com/rest-nvim/rest.nvim)

#### Comments

- [Todo-comments](https://github.com/folke/todo-comments.nvim)
- [Comment](https://github.com/numToStr/Comment.nvim)

### References

- [LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)
- [Josean-dev/dev-environment-files](https://github.com/josean-dev/dev-environment-files)
- [Homebrew](https://brew.sh/)
- [Jesseduffield/lazygit](https://github.com/jesseduffield/lazygit/)
