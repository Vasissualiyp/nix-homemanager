{ config, pkgs, inputs, ... }:
let 
  numberOfMonitors = 5;
in 
{
  imports = [
    (import ./home.nix { inherit config pkgs inputs numberOfMonitors; })
  ];
}
