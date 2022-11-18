# Neovim initial setup

## Table of contents

<!-- vim-markdown-toc GFM -->

- [Installation (Homebrew)](#installation-homebrew)
  - [Install Neovim](#install-neovim)
  - [Install Lazygit](#install-lazygit)
- [Installed Plugins](#installed-plugins)
  - [Plugin Manager](#plugin-manager)
  - [Essential Lua Functions for other plugins](#essential-lua-functions-for-other-plugins)
  - [Colors](#colors)
  - [Windows/Terminal Manager](#windowsterminal-manager)
  - [Essential plugins](#essential-plugins)
  - [File Explorer](#file-explorer)
  - [Icons](#icons)
  - [Status Line](#status-line)
  - [Search and find](#search-and-find)
  - [Autocompletion](#autocompletion)
  - [Snippet](#snippet)
  - [Managing servers](#managing-servers)
  - [LSP Configuration](#lsp-configuration)
  - [Formatting and linting](#formatting-and-linting)
  - [Syntax highlight and autoclosing](#syntax-highlight-and-autoclosing)
  - [Optimizer](#optimizer)
  - [Git integration](#git-integration)
  - [Markdown](#markdown)
  - [Code observer](#code-observer)
- [References](#references)

<!-- vim-markdown-toc -->

This repo is the resource for the initial setup of the Neovim Lua.
The primary purpose of this repo is to help you set up Neovim, and none of these setups is meant to provide the best practice.

## Installation (Homebrew)

> Reference:
>
> [Homebrew Installation](https://brew.sh/)  
> [Lazygit](https://github.com/jesseduffield/lazygit)  
> [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

### Install Neovim

> For other installation methods, please visit [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

```
brew install neovim
```

### Install Lazygit

> Lazygit is a simple terminal UI for git commands.
>
> For other installation methods, please visit [Lazygit](https://github.com/jesseduffield/lazygit).

```
brew install lazygit
```

## Installed Plugins

> Following plugins are installed for the initial setup

#### Plugin Manager

- [Packer](https://github.com/wbthomason/packer.nvim)

#### Essential Lua Functions for other plugins

- [Plenary](https://github.com/nvim-lua/plenary.nvim)

#### Colors

> Checkout [Rose Pine Palette](https://rosepinetheme.com/palette)

- [Rose-pine](https://github.com/rose-pine/neovim)
- [Nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua)

#### Windows/Terminal Manager

- [Vim Maximizer](https://github.com/vim-maximizer)
- [Toggleterm](https://github.com/akinsho/toggleterm.nvim)

#### Essential plugins

- [Vim-surround](https://github.com/tpope/vim-surround)
- [ReplaceWithRegister](https://github.com/vim-scripts/ReplaceWithRegister)
- [Comment](https://github.com/numToStr/Comment.nvim)

#### File Explorer

- [Nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)

#### Icons

- [Nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

#### Status Line

- [Lualine](https://github.com/nvim-lualine/lualine.nvim)

#### Search and find

- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Visual-multi](https://github.com/mg979/vim-visual-multi)

#### Autocompletion

- [Nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

- [Cmp-buffer](https://github.com/hrsh7th/cmp-buffer)

- [Camp-path](https://github.com/hrsh7th/cmp-path)

#### Snippet

- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)

- [Cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)

- [Friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

#### Managing servers

- [Mason](https://github.com/williamboman/mason.nvim)

#### LSP Configuration

- [Mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
- [Lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [Lspsaga](https://github.com/glepnir/lspsaga.nvim)
- [lspkind](https://github.com/lspkind.nvim)

#### Formatting and linting

- [Null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [Mason-null-ls](https://github.com/mason-null-ls.nvim)

#### Syntax highlight and autoclosing

- [Tree Sitter](https://github.com/nvim-treesitter.install)
- [AutoPair](https://github.com/nvim-autopairs)

#### Optimizer

- [Impatient](https://github.com/lewis6991/impatient.nvim)

#### Git integration

- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)

#### Markdown

- [Markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
- [Vim-Markdown-toc](https://github.com/iamcco/vim-markdown-toc)

#### Code observer

- [Trouble](https://github.com/folke/trouble.nvim)

## References

- [LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)
- [josean-dev/dev-environment-files](https://github.com/josean-dev/dev-environment-files)
- [Homebrew](https://brew.sh/)
- [jesseduffield/lazygit](https://github.com/jesseduffield/lazygit/)
