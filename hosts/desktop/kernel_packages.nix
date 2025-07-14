{pkgs, ...}: {
  environment.systemPackages = with pkgs; [linuxKernel.packages.linux_6_12.r8125]; # check if you still need that
}
