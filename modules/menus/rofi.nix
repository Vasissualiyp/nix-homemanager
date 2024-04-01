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
        "background-color" = mkLiteral "#000000";
        "foreground-color" = mkLiteral "rgba (250, 251, 252, 100%)";
        "border-color" = mkLiteral "#FFFFFF";
        "width" = 512;
      };

      "#inputbar" = {
        "children" = map mkLiteral [ "prompt" "entry" ];
      };

      "#textbox-prompt-colon" = {
        "expand" = false;
        "str" = ":";
        "margin" = mkLiteral "0px 0.3em 0em 0em";
        "text-color" = mkLiteral "@foreground-color";
      };
    };
  };
}
