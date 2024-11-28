{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
    ];
    homeDirectory = "/Users/wclaus";
    stateVersion = "24.05";
  };
}