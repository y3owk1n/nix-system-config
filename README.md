# My Personal Nix System Configuration

This is a project to help me to manage my Nix system configuration, mainly with Darwin and Home Manager.

## Commands to make it work (For future me)

### Installing Nix on Macos

<https://nixos.org/download#nix-install-macos>

```bash
sh <(curl -L https://nixos.org/nix/install)
```

### Configure github helper

```bash
git credential-oauth configure
```

### Getting localhostname

```bash
scutil --get LocalHostName
```

### Getting username

```bash
whoami
```

### Switch to fish shell

```bash
chsh -s (which fish)
```

### Build nix to results

```bash
nix --extra-experimental-features 'nix-command flakes' build .#darwinConfigurations.your-local-hostname.system
```

### Initialise darwin rebuild

```bash
./result/sw/bin/darwin-rebuild switch --flake ~/nix-system-config
```

### Cleanup

```bash
bash ~/nix-system-config/cleanup.sh
```
