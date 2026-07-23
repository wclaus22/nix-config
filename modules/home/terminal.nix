{ ... }:
{
  # Deploy the self-contained wezterm.lua verbatim to ~/.config/wezterm/wezterm.lua.
  xdg.configFile."wezterm/wezterm.lua".source = ../../wezterm.lua;
}
