{ config, pkgs, lib, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    theme = {
      "*" = {
        width = mkLiteral "30%"; # Added % for percentage
      };
      "#window" = {
        border = mkLiteral "2";
        padding = mkLiteral "10";
      };
      "#listview" = {
        lines = mkLiteral "15";
        fixed-height = mkLiteral "1";
        dynamic = mkLiteral "false";
      };
	  "#entry,prompt,case-indicator" ={
	  };
      "#element" = {
        border = mkLiteral "1";
        padding = mkLiteral "2";
        border-radius = mkLiteral "5";
      };
      "#element-text" = {
      };
      "#element selected" = {
      };
      "#scrollbar" = {
        handle-width = mkLiteral "2";
        handle-border = mkLiteral "1";
      };
    };
  };
}
