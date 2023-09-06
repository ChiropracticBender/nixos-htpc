{
services = {
  syncthing = {
    enable = true;
    user = "kodi";
    dataDir = "/home/kodi/Documents";
    configDir = "/home/kodi/Documents/.config/syncthing";
    overrideDevices = true;     # overrides any devices added or deleted through the WebUI
    overrideFolders = true;     # overrides any folders added or deleted through the WebUI
    devices = {
      "nixos-tv-master" = { id = "7D4LVLA-2AKYXJF-I7KDYS4-YNWPWEF-O37FQKU-6KDEITG-UK2HEPM-FWPA6AH"; };
#      "device2" = { id = "DEVICE-ID-GOES-HERE"; };
    };
    folders = {
      "OS" = {        # Name of folder in Syncthing, also the folder ID
        path = "/ext/nixos/";    # Which folder to add to Syncthing
        devices = [ "nixos-tv-master" ];      # Which devices to share the folder with
      };
    };
  };
};
}
