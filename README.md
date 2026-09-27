# NixOS-Hyprland-dots3333
i just love hyprland and nixos

# install
```bash
git clone https://github.com/Dymon1403/NixOS-Hyprland-dots3333.git
cd NixOS-Hyprland-dots3333/
```
Replace configuration.nix and rename the variables within it for example, `networking.hostName` and `users.users.`

```bash
git init
git add .

```

```bash
sudo nixos-rebuild switch --flake .#YOUR NETWORK NAME IN configuration.nix

```
akdaspdodjapsf

replace hyprland.lua and waybar
da
```bash
cp hypr/hyprland/lua ~/.config/hypr/hyprland.lua
cp waybar/config ~/.config/waybar/config
cp waybar/style.css ~/.config/waybar/style.css

```
# NOTE
CP YOUR hardware-configuration.nix IN DOTS DIR

```bash
sudo cp /etc/nixos/hardware-configuration.nix ~/NixOS-Hyprland-dots3333/

```
