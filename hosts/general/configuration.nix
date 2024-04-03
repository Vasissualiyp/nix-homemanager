{ config, pkgs, inputs, machine_name, numberOfMonitors, ... }:

let 
  #lib = config.home-manager.users.vasilii.lib;
  lib = pkgs.lib;
  bashModule = import ../../modules/terminals/bash.nix;
  colorscheme = import ../../modules/rice/color_schemes.nix;
  qutebrowserModule = import ../../modules/web/qutebrowser.nix;
  monitorDefsModule = (import ../../modules/WM/monitor_definitions.nix { inherit config lib; });
  hyprlandModule = ../../modules/WM/hyprland_Vas-Office-Nix.nix ;
  waybarModule = ../../modules/WM/waybar/mybar.nix;
  bspwmModule = ../../modules/WM/bspwmrc_Vas-HP-Nix.nix;
  zathuraModule = import ../../modules/office/zathura.nix;
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
	(import hyprlandModule { inherit config pkgs lib inputs machine_name numberOfMonitors; })
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
	monitorDefsModule
	#inputs.nix-colors.homeManagerModules.default
  ]; 

  monitors = [
	{
      #name = "DP-2";
      name = "HDMI-A-2";
	  width = 1920;
	  height = 1080;
	  refreshRate = 60;
	  x = 0;
	  y = 180;
	  scale = 1;
	  enabled = true;
	}
    {
      name = "DP-1";
	  width = 2560;
	  height = 1440;
	  refreshRate = 144;
	  x = 1920;
	  y = 0;
	  scale = 1;
	  enabled = true;
	}
    {
      name = "HDMI-A-2";
      #name = "DP-2";
	  width = 1920;
	  height = 1080;
	  refreshRate = 60;
	  x = 4480;
	  y = 180;
	  scale = 1;
	  enabled = true;
	}
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
