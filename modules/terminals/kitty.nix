{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    theme = "catppuccin";
    shellIntegration.enableBashIntegration = true;
    extraConfig = ''
    '';
  };
}

