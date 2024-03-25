{ config, pkgs, inputs, ... }:
let 
  numberOfMonitors = 5;
in 
{
  imports = [
    (import ./home.nix { inherit pkgs lib inputs numberOfMonitors; })
  ];
}
