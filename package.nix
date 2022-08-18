{ lib, stdenv, rustPlatform, installShellFiles, nix-eval-jobs }:

rustPlatform.buildRustPackage rec {
  pname = "colmena";
  version = "0.3.1";

  src = lib.cleanSourceWith {
    filter = name: type: !(type == "directory" && builtins.elem (baseNameOf name) [ "target" "manual" "integration-tests" ]);
    src = lib.cleanSource ./.;
  };

  cargoSha256 = "sha256-B8gO2m+i3BOsMyB/KHlA4MO+a5UT+ZAN1XJ92X1suec=";

  nativeBuildInputs = [ installShellFiles ];

  buildInputs = [ nix-eval-jobs ];

  NIX_EVAL_JOBS = "${nix-eval-jobs}/bin/nix-eval-jobs";

  preBuild = ''
    if [[ -z "$NIX_EVAL_JOBS" ]]; then
      unset NIX_EVAL_JOBS
    fi
  '';

  postInstall = lib.optionalString (stdenv.hostPlatform == stdenv.buildPlatform) ''
    installShellCompletion --cmd colmena \
      --bash <($out/bin/colmena gen-completions bash) \
      --zsh <($out/bin/colmena gen-completions zsh) \
      --fish <($out/bin/colmena gen-completions fish)
  '';

  # Recursive Nix is not stable yet
  doCheck = false;

  passthru = {
    # We guarantee CLI and Nix API stability for the same minor version
    apiVersion = builtins.concatStringsSep "." (lib.take 2 (lib.splitString "." version));
  };

  meta = with lib; {
    description = "A simple, stateless NixOS deployment tool";
    homepage = "https://colmena.cli.rs/${passthru.apiVersion}";
    license = licenses.mit;
    maintainers = with maintainers; [ zhaofengli ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
