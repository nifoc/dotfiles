{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ wezterm.headless ];
}
