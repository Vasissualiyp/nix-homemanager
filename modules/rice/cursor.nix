{ config, pkgs, lib, ... }:
let
package_name = pkgs.bibata-cursors;
cursor_name = "Bibata-Modern-Classic";

in
{
  home.pointerCursor = {
    gtk.enable = true;
    #x11.enable = true;
    name = cursor_name;
    package = package_name;
    size = 16;
  };
  gtk.cursorTheme = {
    name = cursor_name;
    package = package_name;
  };
}
