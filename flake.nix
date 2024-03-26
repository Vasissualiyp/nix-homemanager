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

	nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
	  defaultMonitorNumber = 1;
    in {
      homeConfigurations."nicekoffer" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/nicekoffer/home.nix ];
		extraSpecialArgs = {
          inherit inputs;
        };
      };
      homeConfigurations."Vas-Office-Nix-1mon" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/Vas-Office-Nix/1mon.nix ];
		extraSpecialArgs = {
          inherit inputs;
        };
      };
      homeConfigurations."Vas-Office-Nix-2mon" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/Vas-Office-Nix/2mon.nix ];
		extraSpecialArgs = {
          inherit inputs;
        };
      };
      homeConfigurations."Vas-Office-Nix-5mon" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/Vas-Office-Nix/5mon.nix ];
		extraSpecialArgs = {
          inherit inputs;
        };
      };
      homeConfigurations."Vas-HP-Nix" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/Vas-HP-Nix/home.nix ];
		extraSpecialArgs = {
          inherit inputs defaultMonitorNumber;
        };
      };
    };
}
