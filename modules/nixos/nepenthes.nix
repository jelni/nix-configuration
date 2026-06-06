{ lib, pkgs, ... }:
let
  lunix = (
    ps:
    ps.buildLuarocksPackage {
      pname = "lunix";
      version = "20220331-1";

      src = pkgs.fetchurl {
        url = "https://luarocks.org/manifests/daurnimator/lunix-20220331-1.src.rock";
        hash = "sha256-6xPonh38yCrsORXtQYXzoqkgXsPpipkbE8w51/OJxCc=";
      };

      sourceRoot = "lunix-20220331-1/lunix-rel-20220331";

      externalDeps = [
        {
          name = "RT";
          dep = pkgs.stdenv.cc.libc;
        }
      ];

      NIX_CFLAGS_COMPILE = "-Wno-error=incompatible-pointer-types";
    }
  );

  lua = pkgs.lua5_4.withPackages (ps: [
    ps.cqueues
    ps.lpeg
    ps.lua-zlib
    ps.luaossl
    (lunix ps)
  ]);

  source = fetchTarball {
    url = "https://zadzmo.org/downloads/nepenthes/file/nepenthes-2.7.tar.gz";
    sha256 = "sha256-Q8Vl4BdksW76AIMuRCJq4JYU+O6pk+sH6Cth/mQ5Kc4=";
  };

  # this removes a bug occuring with `zero_delay`
  nepenthes = pkgs.runCommand "patch-nepenthes" { } ''
    cp -r ${source} $out
    chmod -R +w $out
    sed -i '/logged:record( #page, 0 )/d' $out/core/nepenthes.lua
  '';

  corpus = pkgs.concatText "corpus.txt" [
    (pkgs.fetchurl {
      url = "https://wolnelektury.pl/media/book/txt/dziady-dziady-poema-dziady-czesc-iii.txt";
      hash = "sha256-7sYjYtJ/PWc5n5a5Ofph9cTA2NJppZaqSlGfU691uzM=";
    })
    (pkgs.fetchurl {
      url = "https://wolnelektury.pl/media/book/txt/orwell-rok-1984.txt";
      hash = "sha256-fRm+FgdZhq/AuiaySlAnpWtDx2CIZMXH/vXGTmibX8I=";
    })
    (pkgs.fetchurl {
      url = "https://wolnelektury.pl/media/book/txt/pan-tadeusz.txt";
      hash = "sha256-+QOLD5y3DvzlCQkhw6czVlJwZure7hBQwCHWVyCVBXQ=";
    })
  ];

  configuration = (pkgs.formats.yaml { }).generate "config.yaml" {
    templates = [ "${nepenthes}/templates" ];
    seed_file = pkgs.writeText "seed.txt" "free data for every scraper :3";

    silos = [
      {
        name = "default";
        inherit corpus;
        wordlist = "${pkgs.scowl}/share/dict/words.txt";
        zero_delay = true;
      }
    ];
  };
in
{
  nixpkgs.config.problems.handlers.lua-zlib.broken = "ignore";

  services.caddy.virtualHosts."https://free-data.jel.gay".extraConfig =
    "reverse_proxy localhost:8893";

  systemd.services.nepenthes = {
    path = [ (pkgs.writeShellScriptBin "lua5.4" "exec ${lib.getExe lua} \"$@\"") ];

    serviceConfig = {
      ExecStart = "${nepenthes}/nepenthes ${configuration}";
      WorkingDirectory = nepenthes;
    };

    wantedBy = [ "multi-user.target" ];
  };
}
