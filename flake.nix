{
  description = "Idris 2 project template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        name = "idris2-dev";
        buildInputs = [ pkgs.idris2 ];
      };

      packages.${system}.default = pkgs.stdenv.mkDerivation {
        name = "project";
        src = ./project;

        nativeBuildInputs = [ pkgs.idris2 ];

        buildPhase = ''
          idris2 --build project.ipkg
        '';

        installPhase = ''
          mkdir -p $out/bin
          cp build/exec/project $out/bin/
          cp -r build/exec/project_app $out/bin/
        '';
      };
    };
}
