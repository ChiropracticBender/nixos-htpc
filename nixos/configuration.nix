# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# test
{ inputs, config, pkgs, ... }:

{
  imports = 
    [
      ./hardware-configuration.nix # include hardware scan
      ./channels.nix # add channels to builds
      <home-manager/nixos> #home manager module CORE
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-tv"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Edmonton";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  ###################### KODI LOGIN
  # Desktop Environment.
  services.xserver.displayManager.defaultSession = "kodi"; #sets kodi as the default launcher 
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.kodi.enable = true; #kodi desktop enviroment (testing wayland login
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "htpc";
  # KODI DESKTOP ENVIROMENT (WANT TO SWITCH THIS TO WAYLAND 
  # STAND ALONE APPLICATION
  services.xserver.displayManager.lightdm.autoLogin.timeout = 3;
  services.xserver.desktopManager.plasma5.enable = true;
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.developer = {
    isNormalUser = true;
    description = "developer";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kate
      epiphany
      microsoft-edge
      git
      vscode
    ];
  };

  users.users.htpc = {
    isNormalUser = true;
    description = "HTPC";
    packages = with pkgs; [
      microsoft-edge
      kodi-wayland
    ];
  };

  # HOME MANAGER USER AGENT
#   home-manager.users.kodi = {
#     kodi-wayland = {
#       enabled = true;
#      };
#    };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    pkgs.home-manager
    kodi-wayland
    openvpn
    pkgs.wget
  ];

  services.xserver.desktopManager.kodi.package = pkgs.kodi.withPackages (pkgs: with pkgs; 
    [
    osmc-skin
    ]);


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];

  system.stateVersion = "23.05"; # Did you read the comment?
  system.autoUpgrade.flake = "github:chiropracticbender/nixos-htpc";
  # NIX FLAKES
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # UNFREE SOFTWARE ALLOW
  nixpkgs.config.allowUnfree = true;

}
