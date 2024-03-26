{ pkgs, config, ... }:

{
  enable = true;
  colors = {
    webppage.preferred_color_scheme = "${config.colorScheme.variant}";
    tabs.bar.bg = "#${config.colorScheme.palette.base00}";
    keyhint.fg = "#${config.colorScheme.palette.base05}";
  };
}
