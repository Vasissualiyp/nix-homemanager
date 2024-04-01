{ config, pkgs, lib, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    theme = {
      "*" = {
        background-color = mkLiteral "#${config.colorScheme.palette.base00}";
        foreground-color = mkLiteral "#FFFFFF"; #"#${config.colorScheme.palette.base05}";
        border-color = mkLiteral "#${config.colorScheme.palette.base03}";
        separator-color = mkLiteral "#${config.colorScheme.palette.base02}";
        width = mkLiteral "30%"; # Added % for percentage
        #border = mkLiteral "2px"; # per-element separator
      };
      "#window" = {
        background-color = mkLiteral "#${config.colorScheme.palette.base00}";
        border-color = mkLiteral "#${config.colorScheme.palette.base03}";
        border = mkLiteral "2";
        padding = mkLiteral "10";
        text-color = mkLiteral "#${config.colorScheme.palette.base05}";
      };
      "#listview" = {
        lines = mkLiteral "15";
        fixed-height = mkLiteral "1";
        dynamic = mkLiteral "false";
      };
	  "#entry,prompt,case-indicator" ={
		color = mkLiteral "#${config.colorScheme.palette.base0B}";
	  };
      "#element" = {
        border = mkLiteral "1";
        padding = mkLiteral "2";
        border-radius = mkLiteral "5";
      };
      "#element-text" = {
        text-color = mkLiteral "#${config.colorScheme.palette.base05}";
      };
      "#element selected" = {
        background-color = mkLiteral "#${config.colorScheme.palette.base0A}";
        text-color = mkLiteral "#${config.colorScheme.palette.base0B}";
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
