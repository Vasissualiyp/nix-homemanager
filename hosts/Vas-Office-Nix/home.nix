{ config, pkgs, inputs, numberOfMonitors, asztal, ... }:

let 
  machine_name = "Vas-Office-Nix";
in

{
  imports = [
    (import ../general/configuration.nix { inherit config pkgs inputs machine_name numberOfMonitors asztal; } )
  ];
}
