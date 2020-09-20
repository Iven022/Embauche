#! /bin/bash

#checking if ~/src already exists and if not create it.
if [[ -d ~/src ]] 
then
	echo "No need to create the src folder, you already have one."
else 
	mkdir ~/src 	
fi

#going to the src folder and checking if Embauche has already been clone there and if not, clone it.
cd ~/src 
if [[ -d ~/src/Embauche ]]
then
	echo "No need to clone the Embauche repository in the src folder, you already have it."
else 
	git clone --single-branch --branch master https://github.com/Iven022/Embauche.git
fi

cd ~/bin
cp ~/src/Embauche/bin/check.sh ~/bin/check.sh
chmod +x check.sh #giving it executable rights


cd /etc/systemd/system
cp ~/src/Embauche/bin/check.service /etc/systemd/system/check.service
chmod +x /etc/systemd/system/check.service #giving it executable rights

sudo systemctl start check.service
 
sudo systemctl enable check.service

echo -e " \e[5mInstallation Completed \e[25m!"
