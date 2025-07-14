{...}: {
  # for macOS/iOS & Linux-Clients per mDNS/Bonjour
  services.avahi = {
    publish.enable = true;
    publish.userServices = true;
    # ssmdns4 = true;
    enable = true;
    openFirewall = true;
  };
}
