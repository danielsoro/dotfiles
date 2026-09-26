## 0.3.0 (2026-09-26)

### Feat

- replace oh-my-zsh with zimfw
- export GITHUB_TOKEN from gh auth
- add cargo bin to PATH
- add firefox cask
- add light-background friendly zsh prompt theme
- **flakes**: Upgrade flakes and added xclip

### Fix

- disable globbing in switch alias for zimfw EXTENDED_GLOB
- resolve home-manager .zprofile clobber on activation
- fixing brew packages
- removing podman, because we're using docker

### Refactor

- replace asdf with mise

## 0.2.0 (2026-01-28)

### Feat

- commitizen configuration
- Addimg commitizen
- **microsoft-office**: add office to the brew cask
- **fzf**: Enabling fzf on terminal
- **nix**: Moving env configuration to Nix

### Fix

- **ghostty**: change font size
- **package**: removing unnused configs in home-manager
- **terminal**: enabling fzf and rollback to kitty case ghostty has issue on mac
