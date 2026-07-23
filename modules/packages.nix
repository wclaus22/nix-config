{ pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # editors / core
    vim
    mkalias

    # python
    python312
    python312Packages.virtualenv
    python312Packages.pip
    uv

    # languages / toolchains
    go
    delve
    rustup
    wasm-pack
    wasm-bindgen-cli
    (yarn.override { nodejs = null; })

    # cli tools
    htop
    btop
    pandoc
    tree
    tmux
    wget
    openvpn
    sshfs
    macfuse-stubs

    # gui apps
    wezterm
    google-chrome
    obsidian
    spotify
  ];
}
