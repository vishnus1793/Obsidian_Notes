{ config, pkgs, ... }:

{
  # Enable Hyprland as the window manager
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  # Add necessary packages for Hyprland and Wayland
  environment.systemPackages = with pkgs; [
    kitty        # Terminal
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    swaybg       # Backgrounds
    swaylock     # Lock screen
    swaybar      # Status bar
  ];

  # Enable Wayland support
  services.xserver = {
    enable = false; # Disable X11 server
    displayManager = {
      sddm.enable = false;  # Disable sddm if you want to use a different DM
      wayland.enable = true;
    };
  };

  # Enable openGL support for Wayland
  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  # Optionally set up a display manager for Wayland (like GDM or SDDM)
  services.xserver.displayManager.gdm.enable = true;  # Example for GDM
}
