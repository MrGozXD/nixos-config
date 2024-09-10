{ pkgs, ... }: 
{
	programs.zsh.enable = true;

	/* stylix = {
		enable = true;
		image = /home/mrgozxd/Images/Wallpaper/GigantamaxEctoplasma.png;
		polarity = "dark";
	}; */

	users = {
		defaultUserShell = pkgs.zsh;
		users.mrgozxd = {
			isNormalUser = true;
			description = "Mr Goz XD";
			extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" ];
			packages = with pkgs; [
				vivaldi
			];
		};
	};
	
}
