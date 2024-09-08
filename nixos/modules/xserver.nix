{
	# Configure keymap in X11
	services.xserver = {

		# Enable the X11 windowing system.
		#services.xserver.enable = true;

		# Enable the GNOME Desktop Environment.
		#services.xserver.displayManager.gdm.enable = true;
		#services.xserver.desktopManager.gnome.enable = true;
		# Enable the X11 windowing system.
		enable = true;
		xkb.layout = "fr";
		xkb.variant = "oss_nodeadkeys";

		displayManager = {
			#autoLogin.enable = true;
			#autoLogin.user = "mrgozxd";
			# Enable the GNOME Desktop Environment.
			gdm.enable = true;
			
		};

		desktopManager = {
			# Enable the GNOME Desktop Environment.
			gnome.enable = true;
			
		};
	};
}