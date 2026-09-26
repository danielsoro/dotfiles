# dotfiles

Declarative macOS setup for a single Apple Silicon Mac, built with
[nix-darwin](https://github.com/LnL7/nix-darwin),
[home-manager](https://github.com/nix-community/home-manager) and
[nix-homebrew](https://github.com/zhaofengli/nix-homebrew).

The whole configuration lives in `flake.nix`. It manages:

- system packages, fonts and macOS defaults (dock, Finder, Touch ID for sudo)
- Homebrew taps, formulae and casks (GUI apps)
- the `dcunha` user environment: zsh with zimfw, git, fzf, mise, ghostty

## Bootstrap a new machine

1. Install Nix with flakes enabled (for example the
   [Determinate installer](https://github.com/DeterminateSystems/nix-installer)).
2. Install Xcode Command Line Tools: `xcode-select --install`.
3. Clone this repo to `~/.config/nix`:

       git clone git@github.com:danielsoro/dotfiles.git ~/.config/nix

4. Apply it for the first time:

       sudo nix run nix-darwin -- switch --flake ~/.config/nix#dcunha

   Homebrew is installed and migrated automatically by nix-homebrew on this run.

## Day to day

After the first switch, `darwin-rebuild` is on the PATH and zsh has a `switch` alias:

    switch                    # sudo darwin-rebuild switch --flake ~/.config/nix#dcunha
    nix flake update          # bump flake.lock
    nix flake check           # evaluate without applying
    nixpkgs-fmt flake.nix     # format

Files under `dotfiles/` are linked into the home directory by home-manager.

## Contributing

Commits follow Conventional Commits and are managed with
[commitizen](https://commitizen-tools.github.io/commitizen/) (`.cz.toml`).
Changes go through pull requests.
