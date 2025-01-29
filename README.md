<p align="center">
    <img src="https://github.com/user-attachments/assets/cb18b4eb-eccc-43bd-9448-2b0cabda67d5" alt="startuptime">
</p>

## 🔧 Preparation

Ensure the following are installed:

- Neovim 0.9+
- Node.js
- A nerd font (for icons)
- Git (for plugin management)
- A modern terminal with true color support (e.g.,Ghostty, Kitty, Wezterm, Alacritty)

## 🔩 Dependencies

- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [bat](https://github.com/sharkdp/bat)
- [delta](https://github.com/dandavison/delta)

## ⌨️ Neovim keymaps

### General

| Mode | Key           | Action                              |
| ---- | ------------- | ----------------------------------- |
| i    | `<C-c>`       | Exit insert mode                    |
| n    | `U`           | Redo                                |
| n    | `<C-d>/<C-u>` | Scroll half page and center         |
| n    | `gg/G`        | Go to top/bottom and center         |
| v    | `gx`          | Open URL under cursor               |
| v    | `>`/`<`       | Indent/dedent and stay in selection |

### Window Management

| Mode | Key          | Action               |
| ---- | ------------ | -------------------- |
| n    | `<C-h>`      | Move to left window  |
| n    | `<C-l>`      | Move to right window |
| n    | `<leader>sh` | Split horizontally   |
| n    | `<leader>sv` | Split vertically     |

### File Management

| Mode | Key         | Action                    |
| ---- | ----------- | ------------------------- |
| n    | `<leader>w` | Save current file         |
| n    | `<leader>W` | Save all files            |
| n    | `<leader>q` | Quit current buffer       |
| n    | `<leader>Q` | Force quit current buffer |

### Harpoon

| Key                | Action                         |
| ------------------ | ------------------------------ |
| `<leader>hh`       | Toggle Harpoon UI              |
| `<leader>ha`       | Add current file to Harpoon    |
| `<leader>1` to `9` | Navigate to Harpoon file slots |
