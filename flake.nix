{
  description = "Bound by Infinity Project";
  inputs = {
    # Pinning for the sake of Tofu
    nixpkgs.url = github:NixOS/nixpkgs/c9112fadbc539ac3418b3b668971d2c7f0c15f66;
    flake-utils.url = github:numtide/flake-utils;
  };
  outputs = { self, nixpkgs, flake-utils }:
    with flake-utils.lib; eachSystem allSystems (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in rec {
      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [ opentofu ];
      };
    });
}
