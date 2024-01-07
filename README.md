# virtualhere

## Instructions
1. You need usbip kernel module to get it running, add this to your /etc/nixos/configuration.nix ``boot.extraModulePackages = with config.boot.kernelPackages; [ usbip ];``
2. ``sudo nix run github:BatteredBunny/virtualhere-nixos``

## GUI

```
sudo nix run github:BatteredBunny/virtualhere-nixos
```

## CLI

[Check the usage instructions](https://www.virtualhere.com/linux_console)
```
sudo nix run github:BatteredBunny/virtualhere-nixos#cli
```