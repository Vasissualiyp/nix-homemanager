{ config, pkgs, inputs, numberOfMonitors, ... }:

let 
  lib = pkgs.lib;
  bashModule = import ../../modules/terminals/bash.nix;
  qutebrowserModule = import ../../modules/web/qutebrowser.nix;
  hyprlandModule = ../../modules/WM/hyprland_Vas-Office-Nix.nix ;
  waybarModule = import ../../modules/WM/waybar/mybar.nix;
  zathuraModule = import ../../modules/office/zathura.nix;
  bspwmModule = import ../../modules/WM/bspwmrc_Vas-HP-Nix.nix;
  kittyModule = import ../../modules/terminals/kitty.nix;
  nvimModule = import ../../modules/editors/neovim/nvim.nix;
  tmuxModule = import ../../modules/terminals/tmux.nix;
  redshiftModule = import ../../modules/system/redshift.nix;
  gammastepModule = import ../../modules/system/gammastep.nix;

  machine_name = "Vas-Office-Nix";
in

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vasilii";
  home.homeDirectory = "/home/vasilii";

  imports = [
    bashModule
	(import hyprlandModule { inherit pkgs lib inputs machine_name numberOfMonitors; })
    qutebrowserModule
	waybarModule
    bspwmModule
    kittyModule
    nvimModule
    tmuxModule
    zathuraModule
    gammastepModule
	inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.colorSchemes.eris;
  #colorScheme = inputs.nix-colors.colorSchemes.framer;
  #colorScheme = inputs.nix-colors.colorSchemes.equilibrium-dark;

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
