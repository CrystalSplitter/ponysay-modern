{
  description = "Cowsay reimplemention for ponies, but updated.";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };
  outputs =
    { self, nixpkgs, ... }@flakeInputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system} = rec {
        default = ponysay-modern-bash;
        ponysay-modern-bash = pkgs.callPackage ./nix/package-bash.nix { };
        ponysay-modern-zsh = pkgs.callPackage ./nix/package-zsh.nix { };
        ponysay-modern-fish = pkgs.callPackage ./nix/package-fish.nix { };
      };
    };
}
