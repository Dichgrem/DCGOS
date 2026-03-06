{ hostname
, lib
, pkgs
, ...
}:
with lib; let
  inherit (import ../../hosts/${hostname}/env.nix) QEMU-VM-Use-Case;
in
{
  config = mkIf QEMU-VM-Use-Case {
    services = {
      spice-vdagentd.enable = true;
      spice-webdavd.enable = true;
    };
    virtualisation.libvirtd.enable = true;

    systemd.services.virt-secret-init-encryption = {
      serviceConfig = {
        ExecStart = [
          ""
          "${pkgs.bash}/bin/sh -c 'umask 0077 && (dd if=/dev/random status=none bs=32 count=1 | systemd-creds encrypt --name=secrets-encryption-key - /var/lib/libvirt/secrets/secrets-encryption-key)'"
        ];
      };
    };
  };
}
