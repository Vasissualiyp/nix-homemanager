{ config, pkgs, inputs, numberOfMonitors, ... }:

let 
  machine_name = "Vas-HP-Nix";
in

{
  imports = [
    (import ../general/configuration.nix { inherit config pkgs inputs machine_name numberOfMonitors; })
    (import ../../modules/WM/monitor_definitions.nix { inherit config lib; })
  ];

  monitors = [
    {
      name = "eDP-1";
      width = 2560;
      height = 1600;
      refreshRate = 165;
      x = 0;
      y = 0;
      scale = 1;
      enabled = true;
    }
  ];
}
