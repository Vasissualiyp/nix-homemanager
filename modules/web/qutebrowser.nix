{ pkgs, config, ... }:

{
  programs.qutebrowser = {
    enable = true;

    keyBindings = {
	  normal = {
	    ",p" = "spawn --userscript qute-pass";
	    ",P" = "spawn --userscript qute-pass --password-only";
	    "J" = "tab-prev";
	    "K" = "tab-next";
	  };
    };

	settings = {
	  # Make pdfs reading work inside of qutebrowser
	  content.pdfjs = true;

      # Make 'copy to clipboard' buttons work
	  content.javascript.clipboard = "access"; 

	  # Colorization with nix-colors
	  colors.webpage.darkmode.enabled = true;
    };
  };
}
