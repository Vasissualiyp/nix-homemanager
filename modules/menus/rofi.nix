{ config, pkgs, lib, home-manager, ... }:

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
        "background-color" = mkLiteral "rgba(${builtins.replaceStrings ["#"] [""] config.colorScheme.palette.base00}, 1.0)";
        "foreground-color" = mkLiteral "rgba(${builtins.replaceStrings ["#"] [""] config.colorScheme.palette.base05}, 1.0)";
        "border-color" = mkLiteral "rgba(${builtins.replaceStrings ["#"] [""] config.colorScheme.palette.base03}, 1.0)";
        "separator-color" = mkLiteral "rgba(${builtins.replaceStrings ["#"] [""] config.colorScheme.palette.base02}, 1.0)";
        "width" = mkLiteral "50%";
        "border" = mkLiteral "2";
      };
      "#window" = {
        background-color = "rgba(${builtins.replaceStrings ["#"] [""] config.colorScheme.palette.base00}, 0.95)";
        border-color = "rgba(${builtins.replaceStrings ["#"] [""] config.colorScheme.palette.base03}, 1.0)";
        border = 2;
        padding = 10;
        text-color = "rgba(${builtins.replaceStrings ["#"] [""] config.colorScheme.palette.base05}, 1.0)";
      };
      "#listview" = {
        lines = 5;
        fixed-height = 1;
        dynamic = false;
      };
      "#element" = {
        border = 1;
        padding = 2;
        border-radius = 5;
      };
      "#element selected" = {
        background-color = "rgba(${builtins.replaceStrings ["#"] [""] config.colorScheme.palette.base02}, 1.0)";
        text-color = "rgba(${builtins.replaceStrings ["#"] [""] config.colorScheme.palette.base07}, 1.0)";
      };
      "#scrollbar" = {
        handle-color = "rgba(${builtins.replaceStrings ["#"] [""] config.colorScheme.palette.base03}, 1.0)";
        handle-width = 2;
        handle-border = 1;
        handle-border-color = "rgba(${builtins.replaceStrings ["#"] [""] config.colorScheme.palette.base01}, 1.0)";
      };
    };
  };
}
