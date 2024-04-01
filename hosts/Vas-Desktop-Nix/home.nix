{ config, pkgs, inputs, numberOfMonitors, home-manager, ... }:

let 
  machine_name = "Vas-Desktop-Nix";
in

{
  imports = [
    (import ../general/configuration.nix { inherit config pkgs inputs machine_name numberOfMonitors home-manager; })
  ];
}
