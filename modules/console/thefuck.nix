{ config, ... }:
{
  programs.thefuck = {
    enable = true;
	enableBashIntegration = true;
	#enableInstantMode = true;
  };
}
