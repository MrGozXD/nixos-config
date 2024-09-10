{
  # Enable sound with pipewire.
  # sound.enable = true; https://github.com/NixOS/nixpkgs/blob/3eeff54780a1a8c73c82ca51987962b62bd4219e/nixos/doc/manual/release-notes/rl-2411.section.md#sound-options-removal-sec-release-2411-migration-sound
  hardware.pulseaudio.enable = false;
  # rtkit is optional but recommended for low-latency audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
}
