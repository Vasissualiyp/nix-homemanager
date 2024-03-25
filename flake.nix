{
  description = "Home Manager configuration of vasilii";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

	hyprland.url = "github:hyprwm/Hyprland";
	hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
	  inputs.hyprland.follows = "hyprland";
	};
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
	  numberOfMonitors = 1;
    in {
      homeConfigurations."nicekoffer" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/nicekoffer/home.nix ];
		extraSpecialArgs = {
          inherit inputs numberOfMonitors;
        };
      };
      homeConfigurations."Vas-Office-Nix" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/Vas-Office-Nix/home.nix ];
		extraSpecialArgs = {
          inherit inputs numberOfMonitors;
        };
      };
    };
}
