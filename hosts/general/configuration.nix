{ config, pkgs, inputs, machine_name, numberOfMonitors, ... }:

let 
  #lib = config.home-manager.users.vasilii.lib;
  lib = pkgs.lib;
  bashModule = import ../../modules/terminals/bash.nix;
  colorscheme = import ../../modules/rice/color_schemes.nix;
  qutebrowserModule = import ../../modules/web/qutebrowser.nix;
  hyprlandModule = ../../modules/WM/hyprland_Vas-Office-Nix.nix ;
  waybarModule = ../../modules/WM/waybar/mybar.nix;
  zathuraModule = import ../../modules/office/zathura.nix;
  bspwmModule = ../../modules/WM/bspwmrc_Vas-HP-Nix.nix;
  kittyModule = import ../../modules/terminals/kitty.nix;
  nvimModule = import ../../modules/editors/neovim/nvim.nix;
  tmuxModule = import ../../modules/terminals/tmux.nix;
  redshiftModule = import ../../modules/system/redshift.nix;
  gammastepModule = import ../../modules/system/gammastep.nix;
  rofiModule = import ../../modules/menus/rofi.nix;
in

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vasilii";
  home.homeDirectory = "/home/vasilii";

  imports = [
	(import hyprlandModule { inherit pkgs lib inputs machine_name numberOfMonitors; })
	(import waybarModule { inherit pkgs machine_name numberOfMonitors; })
    (import bspwmModule {inherit pkgs machine_name numberOfMonitors; }) 
    colorscheme 
    bashModule
    qutebrowserModule
    kittyModule
    nvimModule
    tmuxModule
    zathuraModule
    gammastepModule
    rofiModule 
	#inputs.nix-colors.homeManagerModules.default
  ];

  home.stateVersion = "23.11"; # Please read the comment before changing.

  programs.git = {
    enable = true;
	userName = "Vasissualiyp";
	userEmail = "vpustovoit@cita.utoronto.ca";
  };

  home.sessionVariables = {
     EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
