# Neovim Configuration

> This is a configuration for [Neovim](https://neovim.io/charter/), a highly
> configurable and extensible text editor. It is designed to provide a smooth
> and efficient editing experience within your favorite terminal.

![image](https://github.com/tpAtalas/tp-nvim-lua-config/blob/assets/image.png?raw=true)
colorscheme: [Tokyonight](https://github.com/folke/tokyonight.nvim)

## Table of contents

<!-- vim-markdown-toc GFM -->

- [Installation](#installation)
  - [Homebrew on macOS or Linux](#homebrew-on-macos-or-linux)
  - [Setup Neovim configs](#setup-neovim-configs)
  - [[Optional] Installing Lazygit](#optional-installing-lazygit)
- [Features](#features)
  - [Core](#core)
  - [Misc](#misc)
- [Major Keymaps](#major-keymaps)
  - [General Keymaps (Normal Mode)](#general-keymaps-normal-mode)
    - [Formatting](#formatting)
    - [Buffers](#buffers)
    - [Window Management](#window-management)

<!-- vim-markdown-toc -->

This repo is the resource for the initial setup of the Neovim Lua.
The primary purpose of this repo is to help you set up Neovim, and none of
these setups is meant to provide the best practice.

## Installation

> References:
>
> [Homebrew Installation](https://brew.sh/)  
> [Lazygit](https://github.com/jesseduffield/lazygit)  
> [Installing Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

### Homebrew on macOS or Linux

> For other installation methods, please visit [Installing Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

```bash
# insatll nevoim
brew install neovim
```

```bash
# check version
nvim -v
```

### Setup Neovim configs

```bash
cd ~
# backup previouse configs
mv ~/.config/nvim ~/.config/nvim_backup
# clone config
git clone https://github.com/tpAtalas/tp-neovim-config.git ~/.config/nvim
```

### [Optional] Installing Lazygit

> Lazygit is a simple terminal UI for git commands.
>
> For other installation methods, please visit [Installation Lazygit](https://github.com/jesseduffield/lazygit#installation).

```bash
brew install lazygit
```

## Features

#### Core

| Feature       | Description                          | Plugins / comments |
| ------------- | ------------------------------------ | ------------------ |
| Fuzzy finding | find, filter, and preview the search | `telescope`        |
|               |                                      |                    |

#### Misc

| Feature              | Description                                                  | Plugins / comments |
| -------------------- | ------------------------------------------------------------ | ------------------ |
| Hard Mode            | Limit the usage of navigation keys                           | `vim-hardtime`     |
| Grammar/spell checks | Grammar checks only on markdown and spells checks everywhere | `null-ls`          |

example
<https://github.com/Allaman/nvim>
<https://github.com/craftzdog/dotfiles-public>
<https://github.com/CosmicNvim/CosmicNvim>

## Major Keymaps

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
| `<leader>ww`      | Close the current buffer            | -               |
| `<ldeader>WW`     | Close all except the current buffer | -               |

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
