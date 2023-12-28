## Install Nix on Mac

https://nixos.org/download#nix-install-macos

```bash
sh <(curl -L https://nixos.org/nix/install)
```

## Configure github helper

```bash
git credential-oauth configure
```

## Build nix to results

```bash
nix --extra-experimental-features 'nix-command flakes' build .#darwinConfigurations.your-local-hostname.system
```

## Initialise darwin rebuild

```bash
./result/sw/bin/darwin-rebuild switch --flake ~/nix-system-config
```
