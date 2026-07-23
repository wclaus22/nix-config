{ ... }:
{
  imports = [
    ./shell.nix
    ./terminal.nix
    ./vscode.nix
  ];

  home = {
    homeDirectory = "/Users/wclaus";
    stateVersion = "24.05";
    packages = [ ];
  };
}
