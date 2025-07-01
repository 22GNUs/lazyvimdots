# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## High-Level Code Architecture

This repository contains a Neovim configuration based on [LazyVim](https://github.com/LazyVim/LazyVim).

-   **Entry Point**: The primary configuration entry point is `init.lua`, which initializes `lazy.nvim` (the plugin manager) and loads all other configurations and plugins.
-   **Configuration Files**: Core Neovim configurations, such as global options, autocmds, and custom keymaps, are located in the `lua/config/` directory.
-   **Plugin Management**: Plugins are managed by `lazy.nvim`. Plugin specifications and overrides are defined in the `lua/plugins/` directory. LazyVim automatically checks for plugin updates.
-   **VSCode Integration**: There are specific keymaps and configurations (`lua/config/keymaps.lua`) tailored for users running Neovim within the VSCode Neovim extension, utilizing VSCode's built-in commands.

## Common Development Commands

-   **Installation**: To clone and set up this Neovim configuration:
    ```sh
    git clone git@github.com:22GNUs/lazyvimdots.git ~/.config/nvim
    ```
-   **Cleaning Neovim Cache/State**: To clear Neovim's cache and state directories (useful for troubleshooting plugin issues):
    ```sh
    ~/.config/nvim/clean.sh
    ```
    This script performs the following actions:
    ```bash
    mv ~/.local/share/nvim{,.bak}
    mv ~/.local/state/nvim{,.bak}
    mv ~/.cache/nvim{,.bak}
    ```
-   **Plugin Updates**: LazyVim is configured to automatically check for plugin updates. Manual updates can typically be triggered from within Neovim.
