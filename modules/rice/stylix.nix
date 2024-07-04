{ config, pkgs, lib, ... }:
{
  #stylix.homeManagerIntegration.autoImport = true;
  #wayland.windowManager.hyprland.setting.general."col.active_border" =
  #  lib.mkForce "rgb$(config.stylix.base16Scheme.base0E})";
}
