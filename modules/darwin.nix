{ inputs, pkgs, config, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # The user whose macOS defaults / homebrew / etc. are managed here.
  system.primaryUser = "wclaus";

  users.users.wclaus = {
    home = "/Users/wclaus";
    shell = pkgs.zsh;
  };

  # System-level zsh support: adds zsh to /etc/shells and sources /etc/zshrc.
  # Complements the home-manager `programs.zsh` block, which owns ~/.zshrc.
  programs.zsh.enable = true;

  # Fonts installed into /Library/Fonts/Nix Fonts. Nerd Font variants include
  # the glyphs starship/terminal prompts rely on.
  # Family names: "FiraCode Nerd Font", "Hack Nerd Font".
  fonts.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.hack
  ];

  system.defaults = {
    dock.autohide = true;
    dock.persistent-apps = [
      "${pkgs.google-chrome}/Applications/Google Chrome.app"
      "/Applications/Microsoft Teams.app"
      "${pkgs.wezterm}/Applications/WezTerm.app"
      "${pkgs.obsidian}/Applications/Obsidian.app"
      "${pkgs.vscode}/Applications/Visual Studio Code.app"
    ];
    finder.FXPreferredViewStyle = "clmv";
  };

  homebrew = {
    enable = true;
    casks = [
      "docker"
      "firefox"
      "scroll-reverser"
    ];
  };

  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "wclaus";
  };

  # Symlink nix-installed GUI apps into /Applications so Spotlight finds them.
  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = [ "/Applications" ];
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

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
}
