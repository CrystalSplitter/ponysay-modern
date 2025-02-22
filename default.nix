let
  nixpkgs = builtins.fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in
{
  ponysay-modern-bash = pkgs.callPackage ./nix/package-bash.nix { };
  ponysay-modern-zsh = pkgs.callPackage ./nix/package-zsh.nix { };
  ponysay-modern-fish = pkgs.callPackage ./nix/package-fish.nix { };
}
