{pkgs, ...}: let
  inherit
    (pkgs)
    lib
    stdenv
    fetchFromGitHub
    ;

  mkDict = {
    pname,
    readmeFile,
    dictFileName,
    ...
  } @ args:
    stdenv.mkDerivation (
      {
        inherit pname;
        installPhase = ''
          runHook preInstall
          # hunspell dicts
          install -dm755 "$out/share/hunspell"
          install -m644 ${dictFileName}.dic "$out/share/hunspell/"
          install -m644 ${dictFileName}.aff "$out/share/hunspell/"
          # myspell dicts symlinks
          install -dm755 "$out/share/myspell/dicts"
          ln -sv "$out/share/hunspell/${dictFileName}.dic" "$out/share/myspell/dicts/"
          ln -sv "$out/share/hunspell/${dictFileName}.aff" "$out/share/myspell/dicts/"
          # docs
          install -dm755 "$out/share/doc"
          install -m644 ${readmeFile} $out/share/doc/${pname}.txt
          runHook postInstall
        '';
      }
      // args
    );
in
  mkDict rec {
    pname = "hunspell-dict-uz-uz";
    version = "0.1.0";

    src = fetchFromGitHub {
      owner = "uzbek-net";
      repo = "uz-hunspell";
      rev = version;
      hash = "sha256-EUYhnUWUy45AYGH+HoxaFFCBVnotsIm4GlpMBgnHxdo=";
    };

    shortName = "uz-uz";
    dictFileName = "uz_UZ";
    readmeFile = "README.md";

    meta = {
      description = "Hunspell dictionary for Uzbek";
      homepage = "https://github.com/uzbek-net/uz-hunspell";
      license = with lib.licenses; [
        gpl3Plus
      ];
      maintainers = with lib.maintainers; [bahrom04];
    };
  }
