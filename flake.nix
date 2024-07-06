{
  description = "Home Manager configuration of vasilii";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

	#hyprland.url = "github:hyprwm/Hyprland";
	hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
	hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
	  inputs.hyprland.follows = "hyprland";
	};

	nix-colors.url = "github:misterio77/nix-colors";
    
	# asztal's inputs
    matugen.url = "github:InioX/matugen";
    ags.url = "github:Aylur/ags";
    astal.url = "github:Aylur/astal";
    stm.url = "github:Aylur/stm";
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
	  defaultMonitorNumber = 1;
    in {
      formatter = { x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra; };
      packages.x86_64-linux.default =
        nixpkgs.legacyPackages.x86_64-linux.callPackage ./modules/peoples_dotfiles/Aylur/ags {inherit inputs;};

      homeConfigurations."nicekoffer" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/nicekoffer/home.nix stylix.homeManagerModules.stylix ];
		extraSpecialArgs = {
          inherit inputs defaultMonitorNumber;
          asztal = self.packages.x86_64-linux.default;
        };
      };
      homeConfigurations."Vas-Desktop-Nix" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/Vas-Desktop-Nix/home.nix stylix.homeManagerModules.stylix ];
		extraSpecialArgs = {
          inherit inputs;
          asztal = self.packages.x86_64-linux.default;
        };
      };
      homeConfigurations."Vas-Office-Nix-1mon" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/Vas-Office-Nix/1mon.nix stylix.homeManagerModules.stylix ];
		extraSpecialArgs = {
          inherit inputs;
          asztal = self.packages.x86_64-linux.default;
        };
      };
      homeConfigurations."Vas-Office-Nix-2mon" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/Vas-Office-Nix/2mon.nix stylix.homeManagerModules.stylix ];
		extraSpecialArgs = {
          inherit inputs;
          asztal = self.packages.x86_64-linux.default;
        };
      };
      homeConfigurations."Vas-Office-Nix-5mon" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/Vas-Office-Nix/5mon.nix stylix.homeManagerModules.stylix ];
		extraSpecialArgs = {
          inherit inputs;
          asztal = self.packages.x86_64-linux.default;
        };
      };
      homeConfigurations."Vas-HP-Nix" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/Vas-HP-Nix/home.nix stylix.homeManagerModules.stylix ];
		extraSpecialArgs = {
          inherit inputs defaultMonitorNumber;
          asztal = self.packages.x86_64-linux.default;
        };
      };
    };
}
