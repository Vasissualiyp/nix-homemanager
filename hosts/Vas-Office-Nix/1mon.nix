{ config, pkgs, inputs, ... }:
let 
  numberOfMonitors = 1;
in 
{
  imports = [
    (import ./home.nix { inherit config pkgs inputs numberOfMonitors; })
  ];
}
