# ./flake.nix
{
  description = "My macOS config with nix-darwin + Home Manager";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    # Flake utils for eachSystem
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs: let
    outputs = self;
  in
    # Attributes for each system
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import inputs.nixpkgs {
          inherit system;
        };
      in
        # Nixpkgs packages for the current system
        {
          # Development shells
          devShells.default = import ./shell.nix {inherit pkgs;};

          # Output package
          packages.default = pkgs.callPackage ./. {inherit pkgs;};

          formatter = pkgs.alejandra;
        }
    );
}
