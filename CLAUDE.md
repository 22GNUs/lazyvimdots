# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## High-Level Code Architecture

This repository contains a Neovim configuration based on [LazyVim](https://github.com/LazyVim/LazyVim).

-   **Entry Point**: The primary configuration entry point is `init.lua`, which initializes `lazy.nvim` (the plugin manager) and loads all other configurations and plugins.
-   **Configuration Files**: Core Neovim configurations, such as global options, autocmds, and custom keymaps, are located in the `lua/config/` directory. This includes:
    -   `options.lua`: Global Neovim options and settings
    -   `keymaps.lua`: Custom key mappings, including VSCode-specific mappings
    -   `autocmds.lua`: Automatic command configurations
    -   `neovide.lua`: Neovide-specific configurations
-   **Plugin Management**: Plugins are managed by `lazy.nvim` with configuration in `lua/config/lazy.lua`. Plugin specifications and overrides are defined in the `lua/plugins/` directory:
    -   `override.lua`: Overrides for default LazyVim plugins (notify, noice, treesitter, neo-tree, conform)
    -   `code.lua`: Claude Code integration with custom keymaps
    -   `custom.lua`: Placeholder for additional custom plugins
    -   Other language-specific and utility plugins
-   **VSCode Integration**: Specific keymaps and configurations in `lua/config/keymaps.lua` for users running Neovim within the VSCode Neovim extension, utilizing VSCode's built-in commands via the `vscode` module.
-   **Keymap System**: Custom keymap helper function in `lua/config/keymaps.lua` that respects lazy key handlers and provides silent execution.

## Common Development Commands

-   **Installation**: To clone and set up this Neovim configuration:
    ```sh
    git clone git@github.com:22GNUs/lazyvimdots.git ~/.config/nvim
    ```
-   **System Requirements**: 
    -   Node.js (for JSON LSP): `brew install node`
    -   Optional: Lazygit (`brew install lazygit`) and Glow (`brew install glow`)
    -   Recommended font: FantasqueSansMono Nerd Font (`brew install --cask font-fantasque-sans-mono-nerd-font`)
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
-   **Plugin Updates**: LazyVim is configured to automatically check for plugin updates every 48 hours. Manual updates can typically be triggered from within Neovim.
-   **Claude Code Integration**: This configuration includes Claude Code plugin with keymaps under `<leader>a` prefix for AI assistance.
