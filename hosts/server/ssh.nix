{...}: {
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  users.users."user".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM8fhpSSDobR9JQ7/QXzvGJ2piFjUU051rFJnTMn2wUe user@laptop" # from laptop
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOOj/Vm27o+LN3nA/gBnJDRFFOWNxal/sj4ZNqWp8Qka user@desktop" # from desktop
  ];
}
