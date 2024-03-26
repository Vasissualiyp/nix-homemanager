{ config, pkgs, inputs, numberOfMonitors, ... }:

let 
  machine_name = "Vas-Office-Nix";
in

{
  imports = [
    (import ../general/configuration.nix { inherit config pkgs inputs machine_name numberOfMonitors; })
  ];
}
