{ config, pkgs, inputs, machine_name, numberOfMonitors,  splitMonitorWorkspaces, ... }:

let 
  #lib = config.home-manager.users.vasilii.lib;
  lib = pkgs.lib;
  bashModule = import ../../modules/console/bash.nix;
  thefuckModule = import ../../modules/console/thefuck.nix;
  colorscheme = import ../../modules/rice/color_schemes.nix;
  cursor = import ../../modules/rice/cursor.nix;
  stylix = import ../../modules/rice/stylix.nix;
  qutebrowserModule = import ../../modules/web/qutebrowser.nix;
  hyprlandModule = ../../modules/WM/hyprland.nix ;
  waybarModule = ../../modules/WM/waybar/mybar.nix;
  bspwmModule = ../../modules/WM/bspwmrc.nix;
  zathuraModule = import ../../modules/office/zathura.nix;
  kittyModule = import ../../modules/console/kitty.nix;
  nvimModule = import ../../modules/editors/neovim/nvim.nix;
  nvimColorsModule = import ../../modules/editors/neovim/neovim-colors.nix;
  tmuxModule = import ../../modules/console/tmux.nix;
  redshiftModule = import ../../modules/system/redshift.nix;
  gammastepModule = import ../../modules/system/gammastep.nix;
  kdeconnectModule = import ../../modules/web/kdeconnect.nix;
  rofiModule = import ../../modules/menus/rofi.nix;
  # asztal's modules
  asztalModule = import ../../modules/peoples_dotfiles/Aylur_v2/home-manager/ags.nix;
  dconfModule = import ../../modules/peoples_dotfiles/Aylur_v2/home-manager/dconf.nix;
  #tmuxModule = import ../../modules/peoples_dotfiles/Aylur/home_manager/tmux.nix;
in

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vasilii";
  home.homeDirectory = "/home/vasilii";

  imports = [
	(import hyprlandModule { inherit config pkgs lib inputs machine_name numberOfMonitors splitMonitorWorkspaces; })
	(import waybarModule { inherit pkgs machine_name numberOfMonitors; })
    (import bspwmModule {inherit pkgs machine_name numberOfMonitors; }) 
    colorscheme 
    #cursor 
    stylix 
    bashModule
    thefuckModule
    qutebrowserModule
    kittyModule
    nvimModule
    nvimColorsModule 
    tmuxModule
    zathuraModule
    gammastepModule
    kdeconnectModule
    rofiModule 
    #asztalModule 
    #dconfModule 
  ]; 

  home.stateVersion = "23.11"; # Please read the comment before changing.

  programs.git = {
    enable = true;
	userName = "Vasissualiyp";
	userEmail = "vpustovoit@cita.utoronto.ca";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    #QMLSCENE_DEVICE = "softwarecontext"; # Needed to make qutebrowser work properly. For some reason, this doesn't set global variable properly - need to do it every time I launch qutebrowser
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
