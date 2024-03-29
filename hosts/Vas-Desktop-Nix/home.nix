{ config, pkgs, inputs, numberOfMonitors, ... }:

let 
  machine_name = "Vas-Desktop-Nix";
in

{
  imports = [
    (import ../general/configuration.nix { inherit config pkgs inputs machine_name numberOfMonitors; })
  ];
}
