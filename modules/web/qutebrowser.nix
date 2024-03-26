{ pkgs, config, ... }:

{
  programs.qutebrowser = {
    enable = true;
	settings = {
      colors = {
        webppage.preferred_color_scheme = "${config.colorScheme.variant}";
        tabs.bar.bg = "#${config.colorScheme.palette.base00}";
        tabs.bar.fg = "#${config.colorScheme.palette.base05}";
        hints.bg = "#${config.colorScheme.palette.base00}";
        hints.fg = "#${config.colorScheme.palette.base05}";
      };
    };
  };
}
