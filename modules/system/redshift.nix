{ config, pkgs, callPackage, ... }: 

{
  #services.geoclue2.enable = true;
  # All values except 'enable' are optional.
  services.redshift = {
    enable = true;

    provider = "manual";
    latitude = "43.65";
    longitude = "-79.38";

    settings.redshift.brightness-day = "1";
    settings.redshift.brightness-night = "1";

    temperature = {
      day = 6500;
      night = 1000;
    };

  };
}


















