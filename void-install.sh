#!/bin/bash
# https://alkusin.net/voidlinux
# Void Linux post-install script

bypass() {
  sudo -v
  while true;
  do
    sudo -n true
    sleep 45
    kill -0 "$$" || exit
  done 2>/dev/null &
}

set e

echo "Starting Void Linux post-install script..."
sleep 3s
	bypass
clear

echo "Updating system and adding repositories..."
sleep 3s
	sudo xbps-install -Syu
	sudo xbps-install -Sy void-repo-nonfree
	sudo xbps-install -Sy vvoid-repo-multilib 
	sudo xbps-install -Sy void-repo-multilib-nonfree
clear

echo "Installing packages..."
sleep 3s
#services [stock installed - dhcpcd udevd]
	sudo xbps-install -Syv dbus dbus-elogind elogind polkit
		
		#acpid detects power/sleep button and laptop lid closed.
		#sudo xbps-install -Syv acpid
		#rtkit sshd uuid

#cpu and gpu firmware modules
	sudo xbps-install -Syv mesa-intel-dri mesa-vulkan-intel nvidia
		
#de - sway
	sudo xbps-install -Syv sway Waybar wofi mako wl-clipboard grim slurp bemenu redshift light wob alacritty
		
		#autotling
		python3-pip  i3ipc

#network
	sudo xbps-install -Syv NetworkManager 
	#sudo xbps-install -Syv connman
	#sudo xbps-install -Syv linux-firmware-network #FREE, easy to use implementation of the Network Time Protocol
		
		#wireguard #https://www.wireguard.com/install/
			sudo xbps-install -Syv wireguard-tools wireguard-dkms

		#bemnu: https://github.com/Cloudef/bemenu	https://github.com/firecat53/networkmanager-dmenu
		#sudo xbps-install -Syv networkmanager-dmenu

#bluetooth
	sudo xbps-install -Syv bluez
	#sudo xbps-install -Syv libspa-bluetooth #Server and user space API to deal with multimedia pipelines - bluetooth plugins
	#sudo xbps-install -Syv sbc #Bluetooth Subband Codec (SBC) library
	#sudo xbps-install -Syv broadcom-bt-firmware
	#libbluetooth #Library to use the Bluez Linux Bluetooth Stack
	#hidapi #Simple library for communicating with USB and Bluetooth HID devices
	#blueman #GTK+ Bluetooth Manager
	#blueberry
	#bluez-alsa #Bluetooth Audio ALSA Backend
	#gnome-bluetooth #GNOME Bluetooth Subsystem

#audio
	sudo xbps-install -Syv alsa-utils pulseaudio alsa-plugins-pulseaudio
	#audio desktop
		pamixer playerctl ncpamixer
	#sudo xbps-install -Syv alsa-firmware alsa-lib alsa-plugins alsa-plugins-ffmpeg 
	#gui pavucontrol
		#stock
		
#multimedia
	sudo xbps-install -Syv imv mpv
	sudo xbps-install -Syv blender
	sudo xbps-install -Syv darktable
	#sudo xbps-install -Syv gstreamer gst-libav gst-plugins-good gst-plugins-bad gst-plugins-base gst-plugins-ugly
	#sudo xbps-install -Syv ffmpeg
#spotify
	sudo xbps-install -Syv spotify-tui spotifyd
	#https://github.com/Spotifyd/spotifyd

#office
	#sudo xbps-install -Syv libreoffice-gnome
	#sudo xbps-install -Syv libreoffice-writer
	#sudo xbps-install -Syv libreoffice-calc
	sudo xbps-install -Syv mupdf

#passwords
	sudo xbps-install -Syv keepassxc

	#https://www.passwordstore.org/
	#sudo xbps-install -Syv pass qtpass

#internet
	#sudo xbps-install -Sy dhcpcd-gtk wpa_gui
	sudo xbps-install -Syv firefox elinks
	sudo xbps-install -Syv transmission-gtk
	#https://github.com/vladimiry/ElectronMail/releases
		#chat
	sudo xbps-install -Syv fractal #hexchat #dino
		
		#privacy
			#sudo xbps-install -Syv ufw # gufw - GTK+ frontend for ufw
			#sudo xbps-install -Syv dnscrypt-proxy

#system utilities
	sudo xbps-install -Syv gedit
	#sudo xbps-install -Syv numlockx
	sudo xbps-install -Syv rsync	
	#sudo xbps-install -Syv gnome-disk-utility
	#sudo xbps-install -Syv gparted #issues with wayland.
	#sudo xbps-install -Syv autofs # automount usb
	#sudo xbps-install -Syv xeyes # show X11 or Wayland
	#sudo xbps-install -Syv xev # show key press
	sudo xbps-install -Syv gnome-boxes
	#sudo xbps-install -Syv dconf-editor
	#sudo xbps-install -Syv ntfs-3g #Stable Read/Write NTFS Driver in userspace

#terminal
	sudo xbps-install -Syv neofetch neovim wget git gotop tty-clock calcurse vitetris
	sudo xbps-install -Syv bash-completion
	sudo xbps-install -yv ranger
	#sudo xbps-install -yv lf # Terminal file manager - written in go https://github.com/gokcehan/lf
	#sudo xbps-install -Syv elvish
	#sudo xbps-install -yv vifm # Ncurses-based file manager with vi-like keybindings

#android
	sudo xbps-install -Syv android-tools
		
#nvidia - https://docs.voidlinux.org/config/graphics/optimus.html
	sudo xbps-install -Syv nvidia glxinfo

#gaming
	sudo xbps-install -Syv lutris steam piper #GTK application to configure gaming mice
		#https://wiki.voidlinux.org/Wine
		sudo xbps-install -Syv  wine-32bit
		#https://wiki.voidlinux.org/Steam
		sudo xbps-install -Syv libpulseaudio-32bit libtxc_dxtn-32bit fontconfig-32bit libavcodec-32bit libavformat-32bit libavresample-32bit libavutil-32bit
		sudo xbps-install -Syv libGL-32bit mesa-intel-dri-32bit
		sudo xbps-install -Syv libGL-32bit mesa-nouveau-dri-32bit
		sudo xbps-install -Syv nvidia-libs-32bit
		sudo xbps-install -Syv mono

#unsure
	#sudo xbps-install -Syv openntpd openresolv

#development
	#sudo xbps-install -Syv curl ninja make

#gnome
	#sudo xbps-install -Syv gnome-contacts
	#sudo xbps-install -Syv gnome-calculator
	#sudo xbps-install -Syv gnome-terminal
	#sudo xbps-install -Syv gnome-font-viewer
	#sudo xbps-install -Syv gnome-latex
	#sudo xbps-install -Syv gnome-bluetooth

#flatpak
	sudo xbps-install -Syv flatpak
	sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	#sudo flatpak install flathub org.octave.Octave

#fonts
	sudo xbps-install -Syv font-Siji font-firacode font-hack-ttf termsyn-font
	
#remove
		#sudo xbps-remove -oyv dhcpcd

clear

echo "Importing files from server..."
sleep 3s
	\cp -R void-files/etc/skel/. ~/
	sudo \cp -R void-files/etc/. /etc
	sudo \cp -R void-files/usr/. /usr
	rm -rf void-files/
	mkdir ~/.void-backup/

clear

echo "Installing new theme..."
sleep 3s
	/usr/local/bin/void-scripts/plata-custom-void.sh
	/usr/local/bin/void-scripts/papirus-custom-void.sh
	sudo ln -sfnr /usr/share/icons/Papirus/64x64/apps/hardinfo.svg /usr/share/hardinfo/pixmaps/logo.png

clear

echo "Configuring system..."
sleep 3s

	sudo ln -s /etc/sv/dbus /var/service/
	sudo ln -s /etc/sv/elogind /var/service/
	sudo ln -s /etc/sv/polkitd /var/service/
	sudo ln -s /etc/sv/ntpd /var/service/

	#sudo ln -s /etc/sv/rtkit /var/service/
	#sudo ln -s /etc/sv/sshd /var/service/
	#sudo ln -s /etc/sv/uuid /var/service/

	sudo ln -s /etc/sv/alsa /var/service/
	sudo ln -s /etc/sv/bluetoothd /var/service/
	#sudo ln -s /etc/sv/ufw /var/service/
	#sudo ln -s /etc/sv/dnscrypt-proxy /var/service/

# Disable unecassary tty services
	sudo rm -f /var/service/agetty-tty{3,4,5,6}
	sudo touch /var/service/agetty-tty{3,4,5,6}/down

#auto login
	#sudo sed -i "s/--noclear/--noclear\ --skip-login\ --login-options=$USER/g" /etc/sv/agetty-tty1/conf

# bluetooth config
	sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf
	sudo sed -i 's/'#DiscoverableTimeout = 0'/'DiscoverableTimeout = 180'/g' /etc/bluetooth/

# network setup
	#sudo resolvconf -u
	#sudo ufw default deny
	#sudo ufw allow from 192.168.0.0/24
	#sudo ufw logging off
	#sudo ufw enable

# system clock
	sudo hwclock --systohc

# fix swap
	sudo mkdir /etc/sysctl.d/
	echo 'vm.swappiness=10' | sudo tee /etc/sysctl.d/99-swappiness.conf

# fix text
	#sudo ln -s /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d/
	#sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
	#sudo ln -s /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/
	#sudo ln -s /usr/share/fontconfig/conf.avail/50-user.conf /etc/fonts/conf.d/
	#sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/

clear

# Numlock at boot
	for tty in /dev/tty[1-6]*;
		do
		setleds -D +num < $tty > /dev/null
	done

echo "Adding user to some groups..."
sleep 3s
	sudo usermod -a -G input $USER
	sudo usermod -a -G audio $USER
	sudo usermod -a -G video $USER
	sudo usermod -a -G rfkill $USER
	sudo usermod -a -G power $USER
	sudo usermod -a -G bluetooth $USER
	sudo usermod -a -G pulse-access $USER
	#sudo usermod -aG libvirt $USER
	#sudo usermod -aG kvm $USER
	#sudo usermod -aG socklog $USER
clear

read -p "Done! Press ENTER to reboot."
	sudo shutdown -r now
