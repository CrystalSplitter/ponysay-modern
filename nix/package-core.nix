{ shell-type }:
{
  pkgs,
  python3,
  stdenv,
  ...
}:

stdenv.mkDerivation {
  pname = "ponysay-modern-${shell-type}";
  version = "unstable-2025-02-21";

  src = ./..;

  nativeBuildInputs = with pkgs; [
    coreutils
    gzip
    makeWrapper
    texinfo
  ];

  # ponysay's setup.py creates a self-extracting zip file
  # which starts with a shebang. Replace those shebangs everywhere.
  patchPhase = ''
    substituteInPlace *.py src/*.py completion/*.py \
      --replace '#!/usr/bin/env python3' '#!${python3}/bin/python3'
  '';

  installPhase = ''
    runHook preInstall

    ${python3}/bin/python3 ./setup.py \
      --prefix=$out \
      --freedom=partial \
      install \
      --with-shared-cache=$out/share/ponysay \
      --with-${shell-type}

    runHook postInstall
  '';

  doCheck = true;
}
