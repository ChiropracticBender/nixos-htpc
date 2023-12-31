# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ inputs, config, pkgs, ... }:

{
  imports = 
    [
      /etc/nixos/hardware-configuration.nix # include hardware scan
      ./channels.nix # add channels to builds
      <home-manager/nixos> #home manager module CORE
      ./bootloader-uefi.nix # Bootloader.
    ];

  networking.hostName = "nixos-htpc"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Edmonton";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  ############# GNOME KODI ###################
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.desktopManager.kodi.enable = true;
  services.xserver.displayManager.defaultSession = "kodi";
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "htpc";
  environment.gnome.excludePackages = (with pkgs; [
  gnome-photos
  gnome-tour
  xterm
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gedit # text editor
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
    gnome-maps #maps app
    simple-scan #scanner app
    gnome-contacts #contacts app
    gnome-calendar # calendar
    gnome-calculator
  ]); 


  # KODI DESKTOP ENVIROMENT (WANT TO SWITCH THIS TO WAYLAND 
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
    password = "developer";
    packages = with pkgs; [
      kate
      epiphany
      microsoft-edge
      git
      vscode
      kodi-wayland
    ];
  };

  
  users.extraUsers.htpc = {
    isNormalUser = true;
    description = "HTPC";
    home = "/home/htpc";
    extraGroups = [ "networkmanager" "wheel" ];
    password = "tvrules";
    packages = with pkgs; [
      microsoft-edge
      kodi-wayland
    ];
  };

  home-manager.users.htpc = {
    home.stateVersion = "22.05";
    home.file.digiwizard = {
      source = "/htpc/kodi/addons/plugin.program.digiwizard";
      target = "/.kodi/addons/plugin.program.digiwizard";
    };
    home.file.digiwizard-certifi = {
      source = "/htpc/kodi/addons/script.module.certifi";
      target = "/.kodi/addons/script.module.certifi";
    };
    home.file.digiwizard-chardet = {
      source = "/htpc/kodi/addons/script.module.chardet";
      target = "/.kodi/addons/script.module.chardet";
    };
    home.file.digiwizard-idna = {
      source = "/htpc/kodi/addons/script.module.idna";
      target = "/.kodi/addons/script.module.idna";
    };    
    home.file.digiwizard-requests = {
      source = "/htpc/kodi/addons/script.module.requests";
      target = "/.kodi/addons/script.module.requests";
    };
    home.file.digiwizard-six = {
      source = "/htpc/kodi/addons/script.module.six";
      target = "/.kodi/addons/script.module.six";
    };
    home.file.digiwizard-urllib3 = {
      source = "/htpc/kodi/addons/script.module.urllib3";
      target = "/.kodi/addons/script.module.urllib3";
    };     
    home.file.profiles = {
      source = "/htpc/kodi/userdata/profiles.xml";
      target = "/.kodi/userdata/profiles.xml";
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    pkgs.home-manager
    openvpn
    pkgs.wget
    cmake
    git
    python39Full
    git-lfs
  ];

  services.xserver.desktopManager.kodi.package = pkgs.kodi.withPackages (pkgs: with pkgs; [ 
    inputstream-adaptive
    inputstream-ffmpegdirect
    inputstream-rtmp
    pvr-iptvsimple
  ]);

  system.stateVersion = "23.05"; # Did you read the comment?
  system.autoUpgrade.flake = "github:chiropracticbender/nixos-htpc";
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # NIX FLAKES
  nixpkgs.config.allowUnfree = true; # UNFREE SOFTWARE ALLOW

  boot.plymouth.enable = true; #silent boot Step 2

}
