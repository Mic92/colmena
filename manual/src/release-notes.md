# Release Notes

## [Release 0.3.0](https://github.com/zhaofengli/colmena/releases/tag/v0.3.0) (2022/04/27)

- [Remote builds](https://colmena.cli.rs/0.3/features/remote-builds.html) are now supported ([#33](https://github.com/zhaofengli/colmena/issues/33)).
- [Streaming evaluation](https://colmena.cli.rs/0.3/features/parallelism.html#parallel-evaluation-experimental) powered by [nix-eval-jobs](https://github.com/nix-community/nix-eval-jobs) is now available as an experimental feature (`--evaluator streaming`).
- Colmena can now run on macOS to deploy to NixOS hosts using [remote building](https://colmena.cli.rs/0.3/features/remote-builds.html).
- It's now possible to configure output colorization via the CLI and environment variables. Colmena follows the [clicolors](https://bixense.com/clicolors) standard.
- [A systemd unit](https://colmena.cli.rs/0.3/features/keys.html#key-services) (`${name}-key.service`) is now created for each secret file deployed using `deployment.keys` ([#48](https://github.com/zhaofengli/colmena/issues/48)).
- Node enumeration is now faster if you do not filter against tags with `--on @tag-name`.
- The main deployment logic has been rewritten to be cleaner and easier to follow.
- There are now [end-to-end tests](https://github.com/zhaofengli/colmena/tree/main/integration-tests) to ensure that the development branch is actually functional as a whole at all times.

## [Release 0.2.2](https://github.com/zhaofengli/colmena/releases/tag/v0.2.2) (2022/03/08)

This bugfix release fixes NixOS detection so `apply-local` works with the latest changes in `nixos-unstable` ([#63](https://github.com/zhaofengli/colmena/pull/63)). Additionally, `--no-keys` was fixed in `apply-local`.

## [Release 0.2.1](https://github.com/zhaofengli/colmena/releases/tag/v0.2.1) (2022/01/26)

This bugfix release fixes the issue ([#50](https://github.com/zhaofengli/colmena/issues/50)) where [sandboxed documentation builds](https://github.com/NixOS/nixpkgs/pull/149532) fail when using the unstable Nixpkgs channel.

## [Release 0.2.0](https://github.com/zhaofengli/colmena/releases/tag/v0.2.0) (2021/11/18)

This is release 0.2.0, the first stable release of Colmena!

Colmena is a simple, stateless NixOS deployment tool modeled after NixOps and morph, built from the ground up to support parallel deployments.

This release contains the following features:

- Node Tagging
- Local Deployment
- Secrets
- Ad Hoc Evaluation
- Nix Flakes Support
- Parallelism

We now have a User Manual at https://colmena.cli.rs/0.2 containing tutorials, sample configurations as well as a complete listing of supported deployment options.
