{
  description = "Dcunha nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager }:
    let
      # DEFAULT NIX-DARWING CONFIG
      configuration = { pkgs, config, ... }: {
        services.nix-daemon.enable = true;

        #NIX SETTINGS
        nix = {
          settings.experimental-features = "nix-command flakes";
        };

        #NIX PACKAGES
        nixpkgs = {
          config.allowUnfree = true;
          hostPlatform = "aarch64-darwin";
        };

        environment.systemPackages =
          [
            pkgs.nixpkgs-fmt
            pkgs.kbfs
            pkgs.zsh
            pkgs.fzf
            pkgs.scmpuff
            pkgs.gnupg
            pkgs.oh-my-zsh
            pkgs.neofetch
            pkgs.git
            pkgs.asdf-vm
            pkgs.rustup
            pkgs.kitty
            pkgs.mkalias
            pkgs.vim
            pkgs.neovim
            pkgs.tmux
            pkgs.google-chrome
            pkgs.vscode
            pkgs.telegram-desktop
          ];

        fonts.packages =
          [
            pkgs.nerd-fonts.jetbrains-mono
          ];

        homebrew = {
          enable = true;
          casks = [
            "jetbrains-toolbox"
            "1password"
            "logi-options+"
            "keybase"
          ];
          onActivation.cleanup = "zap";
          onActivation.autoUpdate = true;
          onActivation.upgrade = true;
        };

        # SECURITY
        security = {
          pam.enableSudoTouchIdAuth = true;
        };

        # SYSTEM CONFIGURATIONS
        system = {
          stateVersion = 5;
          configurationRevision = self.rev or self.dirtyRev or null;
          defaults = {
            finder.FXPreferredViewStyle = "clmv";
            loginwindow.GuestEnabled = false;
            NSGlobalDomain.AppleICUForce24HourTime = true;
            NSGlobalDomain.AppleInterfaceStyle = "Dark";
            NSGlobalDomain.KeyRepeat = 2;

            dock.persistent-apps = [
              "${pkgs.kitty}/Applications/Kitty.app"
	      "/Applications/1Password.app"
              "${pkgs.google-chrome}/Applications/Google Chrome.app"
              "/System/Applications/Mail.app"
            ];
          };

          activationScripts.applications.text =
            let
              env = pkgs.buildEnv {
                name = "system-applications";
                paths = config.environment.systemPackages;
                pathsToLink = "/Applications";
              };
            in
            pkgs.lib.mkForce ''
              # Set up applications.
              echo "setting up /Applications..." >&2
              rm -rf /Applications/Nix\ Apps
              mkdir -p /Applications/Nix\ Apps
              find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
              while read -r src; do
                app_name=$(basename "$src")
                echo "copying $src" >&2
                ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
              done
            '';
        };

        time.timeZone = "America/Fortaleza";

        networking = {
          computerName = "Daniel's MackBook Pro";
          hostName = "godofredo";
        };

        users = {
          users.dcunha = {
            name = "dcunha";
            description = "Daniel Cunha";
            home = "/Users/dcunha";
            shell = pkgs.zsh;
          };
        };

        # PROGRAMS
        programs = {
          zsh = {
            enable = true;
            enableCompletion = true;
            enableBashCompletion = true;
            enableFzfCompletion = true;
            enableFzfHistory = true;
            enableSyntaxHighlighting = true;
          };
        };
      };

      # HOME-MANAGER CONFIG
      homeconfig = { pkgs, ... }: {
        home.stateVersion = "25.05";
        home.packages = with pkgs; [ ];

        home.sessionVariables = {
          EDITOR = "nvim";
        };

        programs = {
          home-manager = {
            enable = true;
          };

          git =
            {
              enable = true;
              userName = "Daniel Cunha";
              userEmail = "danielsoro@gmail.com";

              ignores = [ ".DS_Store" ".idea" ".vscode" ];
              signing = {
                key = "EAF61BB1C055D18D";
                signByDefault = true;
              };
              extraConfig = {
                init.defaultBranch = "main";
                push.autoSetupRemote = true;
              };
            };

          scmpuff = {
            enable = true;
          };

          zsh = {
            enable = true;
            oh-my-zsh = {
              enable = true;
              theme = "robbyrussell";
              plugins = [ "git" "sudo" ];
            };
            shellAliases = {
              switch = "darwin-rebuild switch --flake ~/.config/nix#dcunha";
            };
          };

          kitty = {
            enable = true;
            settings = {
              font_family = "JetBrainsMono Nerd Font";
              font_size = 16;
            };
          };
        };
      };

    in
    {
      darwinConfigurations."dcunha" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = "dcunha";
              enableRosetta = true;
              autoMigrate = true;
            };
          }
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.verbose = true;
            home-manager.users.dcunha = homeconfig;
          }
        ];
      };

      darwinPackages = self.darwinConfigurations."dcunha".pkgs;
    };
}