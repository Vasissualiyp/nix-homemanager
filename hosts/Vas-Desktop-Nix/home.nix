{ config, pkgs, inputs, ... }:

let 
  machine_name = "Vas-Desktop-Nix";
  numberOfMonitors = 3;
in

{
  imports = [
    (import ../general/configuration.nix { inherit config pkgs inputs machine_name numberOfMonitors; } )
  ];
}
