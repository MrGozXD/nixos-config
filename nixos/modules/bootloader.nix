{
	# Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable=true;
  boot.loader.grub.devices=["nodev"];
	boot.loader.grub.theme = pkgs.grub2-themes.theme-vimix;
  boot.loader.grub.efiSupport=true;
  boot.loader.grub.useOSProber=true;
}