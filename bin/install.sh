#! /bin/bash

#checking if ~/src already exists and if not create it.
if [[ -d ~/src ]] 
then
	echo "No need to create the src folder, you already have one."
else 
	sudo mkdir ~/src 	
fi

#going to the src folder and checking if Embauche has already been clone there and if not, clone it.
cd ~/src 
if [[ -d ~/src/Embauche ]]
then
	echo "No need to clone the Embauche repository in the src folder, you already have it."
else 
	sudo git clone https://github.com/Iven022/Embauche.git
fi

cd ~/bin
sudo cp ~/src/Embauche/bin/check.sh ~/bin/check.sh
sudo chmod +x check.sh #giving it executable rights


sudo cp ~/src/Embauche/bin/check.service /etc/systemd/system/check.service
sudo chmod 644 /etc/systemd/system/myservice.service

sudo sudo systemctl start check.service
 
sudo sudo systemctl enable check.service

echo -e " \e[5mInstallation Completed \e[25m!"
