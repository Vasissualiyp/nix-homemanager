{ config, ... }:
{
  programs.thefuck = {
    enable = true;
	enableBashIntegration = true;
	alias = "asdf";
	#enableInstantMode = true;
  };
}
