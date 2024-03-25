{ config, pkgs, inputs, ... }:
let 
  numberOfMonitors = 2;
in 
{
  imports = [
    (import ./home.nix { inherit config pkgs inputs numberOfMonitors; })
  ];
}
