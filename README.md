# Exquisite Nvim Config
1. Ensure to install the following dependencies using your package manager:
- git
- gcc
- make
- [ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation)
- [fd](https://github.com/sharkdp/fd#installation)
- [fzf](https://github.com/junegunn/fzf?tab=readme-ov-file#installation)

2. Install the config
- backup your existing config:
  ```bash
  # required
  mv ~/.config/nvim{,.bak}
  # optional but recommended
  mv ~/.local/share/nvim{,.bak}
  mv ~/.local/state/nvim{,.bak}
  mv ~/.cache/nvim{,.bak}
  ```

- clone Exquisite Config:
  ```bash
  git clone https://github.com/ejsadiarin/best-neovim-config.git ~/.config/nvim
  # Remove the git folder so you can add to your own repo
  rm -rf ~/.config/nvim/.git
  ```

- start nvim to install plugins:
  ```bash
  nvim
  ```

### Powered by 💤 LazyVim
  - A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
  - Refer to the [documentation](https://lazyvim.github.io/installation) to get started.
