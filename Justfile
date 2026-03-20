# Set current hostname
hostname := `hostname`

# Set current username
username := `whoami`

@install:
  # Install this flake
  bash install.sh

@ghc:
  # Generate hardware.nix
  nixos-generate-config --show-hardware-config > ./hosts/{{hostname}}/hardware.nix

@format:
  deadnix -e ; alejandra .

@update:
  # Update flake.lock
  nix flake update --extra-experimental-features flakes --extra-experimental-features nix-command --show-trace

@build input:
  # Build
  sudo nixos-rebuild build --flake .#{{input}} --show-trace -L -v

@switch input:
  # Let system rebuild and switch
  sudo nixos-rebuild switch --flake .#{{input}} --show-trace -L -v

@upgrade:
  # Let system totally upgrade
  ## Set hostname and username in flake.nix
  sed -i "/^\s*hostname[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"{{hostname}}\"/" ./flake.nix
  sed -i "/^\s*username[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"{{username}}\"/" ./flake.nix
  git add .
  ## Rebuild the system
  sudo nixos-rebuild switch --flake .#{{hostname}} --show-trace

@list:
  sudo nix-env -p /nix/var/nix/profiles/system --list-generations

@diff:
  sudo nix profile diff-closures --profile /nix/var/nix/profiles/system

@clean:
  # Remove useless nix-channel files
  sudo rm -rf /nix/var/nix/profiles/per-user/root/channels /root/.nix-defexpr/channels

@gc:
  # Do garbage-clean (remove unused packages, etc)
  sudo nix profile wipe-history --older-than 7d --profile /nix/var/nix/profiles/system
  sudo nix-collect-garbage --delete-old

@delete generation:
  sudo nix-env -p /nix/var/nix/profiles/system --delete-generations {{generation}}
