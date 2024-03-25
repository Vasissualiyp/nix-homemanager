{ config, pkgs, inputs, ... }:
let 
  numberOfMonitors = 1;
in 
{
  imports = [
    (import ./home.nix { inherit pkgs lib inputs numberOfMonitors; })
  ];
}
