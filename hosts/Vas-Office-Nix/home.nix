{ config, pkgs, inputs, splitMonitorWorkspaces, ... }:

let 
  machine_name = "Vas-Office-Nix";
  numberOfMonitors = 1;
in

{
  imports = [
    (import ../general/configuration.nix { inherit config pkgs inputs machine_name numberOfMonitors  splitMonitorWorkspaces; } )
  ];
}
