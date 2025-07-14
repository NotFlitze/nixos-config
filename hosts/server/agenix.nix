{...}: {
  age.identityPaths = [
    "/root/.ssh/mailbox.org_agenix_key"
  ];

  age.secrets.mailbox-smtp-password = {
    file = ../../secrets/mailbox-smtp-password.age;
    owner = "user";
    group = "users";
    mode = "0400";
  };
}
