{ pkgs, ... }:

{
  services.gammastep = {
    enable = true;

    provider = "manual";
    latitude = "43.65";
    longitude = "-79.38";
	
    temperature = {
      day = 6500;
      night = 1000;
    };
  };
}
