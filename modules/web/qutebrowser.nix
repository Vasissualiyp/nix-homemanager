{ pkgs, config, ... }:

{
  programs.qutebrowser = {
    enable = true;
	settings = {
      colors = {
        webpage.preferred_color_scheme = "${config.colorScheme.variant}";
        #webpage.preferred_color_scheme = "dark";
        tabs.bar.bg = "#${config.colorScheme.palette.base00}";
        hints.bg = "#${config.colorScheme.palette.base00}";
        hints.fg = "#${config.colorScheme.palette.base05}";
      };
    };
  };
}
