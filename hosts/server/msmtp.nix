{...}: {
  programs.msmtp = {
    enable = true;
    accounts.default = {
      auth = true;
      tls = true;
      tls_starttls = true;
      host = "smtp.mailbox.org";
      port = 587;
      from = "server-notifications@mailbox.org";
      user = "felixbo@mailbox.org";
      passwordeval = "cat /run/agenix/mailbox-smtp-password";
    };
    setSendmail = true;
  };
}
