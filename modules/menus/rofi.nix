{ config, pkgs, lib, ... }:

let
  #hmConfig = import "${home-manager}/nixos" { inherit pkgs lib; };
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  #home-manager.users.vasilii = ({ config, ... }: { ... });
  #imports =
  #  [
  #    (import "${home-manager}/nixos")
  #  ];
  programs.rofi = {
    enable = true;
    theme = {
      "*" = {
        background-color = mkLiteral "#${config.colorScheme.palette.base00}";
        foreground-color = mkLiteral "#${config.colorScheme.palette.base05}";
        border-color = mkLiteral "#${config.colorScheme.palette.base03}";
        separator-color = mkLiteral "#${config.colorScheme.palette.base02}";
        width = mkLiteral "50%"; # Added % for percentage
        border = mkLiteral "2px"; 
      };
      "#window" = {
        background-color = mkLiteral "#${config.colorScheme.palette.base00}";
        border-color = mkLiteral "#${config.colorScheme.palette.base03}";
        border = mkLiteral "2";
        padding = mkLiteral "10";
        text-color = mkLiteral "#${config.colorScheme.palette.base05}";
      };
      "#listview" = {
        lines = mkLiteral "5";
        fixed-height = mkLiteral "1";
        dynamic = mkLiteral "false";
      };
      "#element" = {
        border = mkLiteral "1";
        padding = mkLiteral "2";
        border-radius = mkLiteral "5";
      };
      "#element selected" = {
        background-color = mkLiteral "#${config.colorScheme.palette.base02}";
        text-color = mkLiteral "#${config.colorScheme.palette.base07}";
      };
      "#scrollbar" = {
        handle-color = mkLiteral "#${config.colorScheme.palette.base03}";
        handle-width = mkLiteral "2";
        handle-border = mkLiteral "1";
        handle-border-color = mkLiteral "#${config.colorScheme.palette.base01}";
      };
    };
  };
}
#    theme = {
#      "*" = {
#        background-color = mkLiteral "#${config.colorScheme.palette.base00}";
#        foreground-color = mkLiteral "rgba ( 250, 251, 252, 100 % )";
#        border-color = mkLiteral "#FFFFFF";
#        width = 512;
#      };
#    
#      "#inputbar" = {
#        children = map mkLiteral [ "prompt" "entry" ];
#      };
#    
#      "#textbox-prompt-colon" = {
#        expand = false;
#        str = ":";
#        margin = mkLiteral "0px 0.3em 0em 0em";
#        text-color = mkLiteral "@foreground-color";
#      };
#    };
#  };
#}
