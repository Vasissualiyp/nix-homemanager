{ pkgs, config, ... }:

{
  home.sessionVariables = {
    EDITOR = "nvim";
    QT_XCB_GL_INTEGRATION = "none"; # kde-connect
  };

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };
}
