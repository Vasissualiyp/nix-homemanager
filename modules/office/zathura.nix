{ pkgs, config, ... }:

{
  programs.zathura = {
    enable = true;
	options = {
      # One page per row by default;
      pages-per-row = 1;
     
      #stop = at page boundries;
      scroll-page-aware = "true";
      smooth-scroll = "true";
      scroll-full-overlap = "0.01";
      scroll-step = 100;
     
      #zoom = settings;
      zoom-min = 10;
      #guioptions = "";
     
      # zathurarc-dark;
     
      font = "inconsolata 15";
      default-bg = "#${config.colorScheme.palette.base00}";
      default-fg = "#${config.colorScheme.palette.base01}";
     
      statusbar-fg = "#${config.colorScheme.palette.base04}";
      statusbar-bg = "#${config.colorScheme.palette.base01}";
     
      inputbar-bg = "#${config.colorScheme.palette.base00}";
      inputbar-fg = "#${config.colorScheme.palette.base02}";
     
      notification-error-bg = "#${config.colorScheme.palette.base08}";
      notification-error-fg = "#${config.colorScheme.palette.base00}";
     
      notification-warning-bg = "#${config.colorScheme.palette.base08}";
      notification-warning-fg = "#${config.colorScheme.palette.base00}";
     
      highlight-color = "#${config.colorScheme.palette.base0A}";
      highlight-active-color = "#${config.colorScheme.palette.base0D}";
      highlight-transparency = "1";
     
      completion-highlight-fg = "#${config.colorScheme.palette.base02}";
      completion-highlight-bg = "#${config.colorScheme.palette.base0C}";
     
      completion-bg = "#${config.colorScheme.palette.base02}";
      completion-fg = "#${config.colorScheme.palette.base0C}";
     
      notification-bg = "#${config.colorScheme.palette.base0B}";
      notification-fg = "#${config.colorScheme.palette.base00}";
     
      recolor = "true";
      recolor-lightcolor = "#${config.colorScheme.palette.base00}";
      recolor-darkcolor = "#${config.colorScheme.palette.base06}";
      recolor-reverse-video = "true";
      recolor-keephue = "true";
     
      render-loading = "false";
	};

	mappings = {
      gr = "set recolor";
	};

    extraConfig = ''
    #unmap f
    #map f toggle_fullscreen
    #map [fullscreen] f toggle_fullscreen
    '';

  };
}
