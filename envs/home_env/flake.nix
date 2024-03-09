{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
  #outputs = { self, nixpkgs }: {
  #  packages.x86_64-linux = {
  #    general = nixpkgs.legacyPackages.x86_64-linux.python3.withPackages (ps: with ps; [
  #      numpy
  #      pandas
  #    ]);

  #    vim = nixpkgs.legacyPackages.x86_64-linux.python3.withPackages (ps: with ps; [
  #      pynvim
  #      pandas
  #    ]);

  #    shellgpt = nixpkgs.legacyPackages.x86_64-linux.python3.withPackages (ps: with ps; [
  #      scipy
  #      matplotlib
  #    ]);
  #  };
  #};
}
