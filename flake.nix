{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";  
};

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: { 
      
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [
	  pkgs.vim
	  pkgs.mkalias
	  
 	  pkgs.python310
	  pkgs.python310Packages.virtualenv
	  pkgs.python310Packages.pip
	  pkgs.poetry
	  pkgs.uv

	  pkgs.go
	  pkgs.rustup

	  pkgs.nodejs_20
	  pkgs.wasm-pack
	  pkgs.wasm-bindgen-cli
	  pkgs.mold
	  pkgs.lldb
	  pkgs.clang
	 
	  pkgs.openvpn
	  pkgs.sshfs 
	  pkgs.tree
	  pkgs.tmux
	  pkgs.btop
	  pkgs.wget
	  pkgs.google-chrome
	  pkgs.iterm2
	  pkgs.obsidian
	  pkgs.vscode
	  pkgs.spotify
	  pkgs.zsh-powerlevel10k
	  
	  pkgs.docker
	  pkgs.docker-compose
	];

      nixpkgs.config.allowUnfree = true;

      system.activationScripts.applications.text = let
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
          while read src; do
            app_name=$(basename "$src")
            echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
          done
        '';

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      system.defaults = {
        dock.autohide = true;
	dock.persistent-apps = [
	  "${pkgs.google-chrome}/Applications/Google Chrome.app"
	  "/Applications/Microsoft Teams.app"
	  "${pkgs.iterm2}/Applications/iTerm2.app"
	  "${pkgs.obsidian}/Applications/Obsidian.app"
	  "${pkgs.vscode}/Applications/Visual Studio Code.app"
	];
	finder.FXPreferredViewStyle = "clmv";
      };
      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      programs.zsh.enable = true;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#wclaus-mbp
    darwinConfigurations."wclaus-mbp" = nix-darwin.lib.darwinSystem {
        specialArgs = {inherit inputs;};
	modules = [ 
	  configuration
	  nix-homebrew.darwinModules.nix-homebrew
	  {
	    nix-homebrew = {
	      enable = true;
	      enableRosetta = true;
   	      user = "wclaus";
   	    };
	  }
	];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."wclaus-mbp".pkgs;
  };
}
