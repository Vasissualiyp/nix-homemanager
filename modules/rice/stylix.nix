{ pkgs, ... }:

{
  stylix = {
	enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/da-one-black.yaml";
	image = pkgs.fetchurl {
      url = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.wallpapersafari.com%2F30%2F94%2Fws5FS0.jpg&f=1&nofb=1&ipt=58053b260345fd52e8956b4bdb6cc0247e30cfb21a490ad5b98a60b5d877035c&ipo=images";
      sha256 = "sha256-OWqqFLczATnhEWXeRXEpe6Ti+1Hp27i5YiTsv2nEfuw=";
    };
	cursor.package = pkgs.bibata-cursors;
	cursor.name = "Bibata-Modern-Classic";
	stylix.polarity = "dark";
	#homeManagerIntegration.followSystem = true;
	#homeManagerIntegration.autoImport = true;
  };
}
