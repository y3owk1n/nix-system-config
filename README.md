# My Personal Nix System Configuration

This is a project to help me to manage my Nix system configuration, mainly with Darwin and Home Manager.

## Notes for future me

### To use MX Master 3 bluetooth mouse with kanata

- Reset kanata
- Restart Keychron keyboard
- Both keyboard and mouse should be working

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

### Installing NPM packages that are not available in Nix

Navigate to `...../modules/home-manager/node-packages` and run the following command to generate a nix expression. The expression can then be added into home manager

- `-18` is to build with nodejs v18

```bash
nix-shell -p nodePackages.node2nix --command "node2nix -18 -i ./node-packages.json -o node"
```

### To fix ungoogled-chromium icloud password not working

https://github.com/ungoogled-software/ungoogled-chromium-macos/issues/144#issuecomment-1913176798

```bash
echo '{
    "name": "com.apple.passwordmanager",
    "description": "PasswordManagerBrowserExtensionHelper",
    "path": "/System/Cryptexes/App/System/Library/CoreServices/PasswordManagerBrowserExtensionHelper.app/Contents/MacOS/PasswordManagerBrowserExtensionHelper",
    "type": "stdio",
    "allowed_origins": [
        "chrome-extension://pejdijmoenmkgeppbflobdenhhabjlaj/",
        "chrome-extension://mfbcdcnpokpoajjciilocoachedjkima/"
    ]
}' > ~/Library/Application\ Support/Chromium/NativeMessagingHosts/com.apple.passwordmanager.json
```
