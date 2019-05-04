# Void Linux - Post Install Script

bypass() {
  sudo -v
  while true;
  do
    sudo -n true
    sleep 45
    kill -0 "$$" || exit
  done 2>/dev/null &
}

echo "Starting Void Linux Post Install"
sleep 3s
	bypass

echo "Updating system"
sleep 3s
	sudo xbps-install -Su
clear

echo "Installing Packages"
sleep 3s
	sudo xbps-install -S git,sway,swayidle,swaylock,termite,Waybar
clear

echo "Setup Wayland"
sleep 3s
{
if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi
}
clear

echo "Setup Init"
sleep 3s

# Install cdm display manager
~/Downloads/; git clone https://github.com/evertiro/cdm.git
cd cdm
install.sh
ln -s /etc/cdmrc /var/service/

# Stop lxdm display manager
rm /var/service/lxdm






clear

read -p "Done! Press ENTER to reboot."
	sudo shutdown -r now
