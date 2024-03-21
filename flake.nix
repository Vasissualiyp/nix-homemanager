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
    in {
      homeConfigurations."vasilii" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./hosts/nicekoffer/home.nix ];
		extraSpecialArgs = {
          inherit inputs;
        };

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
