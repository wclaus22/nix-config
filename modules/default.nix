{ config, pkgs, ... }:
{
  imports = [
    ./vscode.nix
    ./development.nix
  ];
}
