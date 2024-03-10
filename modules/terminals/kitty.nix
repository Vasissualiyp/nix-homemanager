{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Frappe";
    shellIntegration.enableBashIntegration = true;
    extraConfig = ''
    '';
  };
}

