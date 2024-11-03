{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    python310
    python310Packages.virtualenv
    python310Packages.pip
    poetry

    go

    rustup
    nodejs_20
    wasm-pack
    wasm-bindgen-cli
    mold
    lldb
    clang

    tree
    tmux
    btop
    wget
    iterm2
    obsidian
    vscodium
    zsh-powerlevel10k

    docker
    docker-compose
  ];
}
