{ config, pkgs, inputs, numberOfMonitors, ... }:

let 
  machine_name = "nicekoffer";
in

{
  imports = [
    (import ../general/configuration.nix { inherit config pkgs inputs machine_name numberOfMonitors; })
  ];
}
