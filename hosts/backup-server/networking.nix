{...}: {
  networking.hostName = "backup-server";

  networking.hostId = "feef2b19";

  networking.firewall.enable = true;

  networking.firewall.allowPing = true;
}
