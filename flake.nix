{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { flake-parts, ... } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = { pkgs, system, ... }:
        let
          nvfModule = import ./config.nix;
          nvfConfig = (inputs.nvf.lib.neovimConfiguration {
            inherit pkgs;
            modules = [ nvfModule ];
          }).neovim;
        in {
          packages = {
            default = nvfConfig;
          };
        };
    };
}
