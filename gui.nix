{
  pkgs,
  stdenv,
  writeShellScriptBin,
  fetchurl,
  ...
}: let
  vhuit64 = stdenv.mkDerivation rec {
    name = "vhuit64";

    src = fetchurl {
      url = "https://www.virtualhere.com/sites/default/files/usbclient/${name}";
      hash = "sha256-E7DH7xiIzG76yuGswkcQL/P8XJRsA0V2KQ2nclbQFNg=";
    };

    buildInputs = with pkgs; [upx];

    unpackPhase = "true";

    installPhase = ''
      mkdir -p $out/bin
      cp ${src} $out/bin/${name}
      chmod 0755 $out/bin/${name}
      upx -d $out/bin/${name}
    '';
  };
in
  writeShellScriptBin "virtualhere-client-gui" ''
    ${pkgs.nix-alien}/bin/nix-alien-ld ${vhuit64}/bin/vhuit64
  ''
