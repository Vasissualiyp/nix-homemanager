{ ... }:

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
      default-bg = "#{config.colorScheme.colors.base01}"; #00
      default-fg = "#{config.colorScheme.colors.base04}"; #01
     
      statusbar-fg = "#B0B0B0"; #04
      statusbar-bg = "#202020"; #01
     
      inputbar-bg = "#151515"; #00 currently not used
      inputbar-fg = "#FFFFFF"; #02
     
      notification-error-bg = "#AC4142"; #08
      notification-error-fg = "#151515"; #00
     
      notification-warning-bg = "#AC4142"; #08
      notification-warning-fg = "#151515"; #00
     
      highlight-color = "#F4BF75"; #0A
      highlight-active-color = "#ffffff"; #0D
      highlight-transparency = "0.1";
     
      completion-highlight-fg = "#151515"; #02
      completion-highlight-bg = "#90A959"; #0C
     
      completion-bg = "#303030"; #02
      completion-fg = "#E0E0E0"; #0C
     
      notification-bg = "#90A959"; #0B
      notification-fg = "#151515"; #00
     
      recolor = "true";
      recolor-lightcolor = "#000000"; #00
      recolor-darkcolor = "#E0E0E0"; #06
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
