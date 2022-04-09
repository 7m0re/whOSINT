#!/bin/sh

# Limpiar Terminal
clear

# Titulo
echo '#######################################################################'
echo '#                               whOSINT                               #'
echo '#######################################################################'
echo

# Actualización de Whonix.
upgrade-nonroot
echo
echo -e '@@@@@@@@@@ Eliminación del banner de la shell @@@@@@@@@@'
echo
cp /etc/skel/.bashrc.whonix-orig ~/.bashrc
echo
echo '@@@@@@@@@@ Instalación de los modulos de Python, Curl y Git @@@@@@@@@@'
echo
sudo apt-get update -y
sudo apt install python -y
sudo apt install curl -y
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
sudo python2 get-pip.py
sudo apt install python3 python3-pip -y
sudo apt install git -y
echo
pip --version
pip2 --version
pip3 --version
function press_key() {
	echo -e "\n[.] Presiona la tecla Enter para continuar..." && read
}
# Mover los archivos que he generado en base a scripts de bash, los cuales permiten la ejecucion de los programas desde cualquier ubicacion, sin necesidad de modificar el $PATH del sistema.
echo '@@@@@@@@@@ Mover los "Program Launcher" a /usr/bin/ @@@@@@@@@@'
echo
sudo mv $HOME/whOSINT/program_launcher/* /usr/bin/
echo
# Mover los archivos de aplicacciones (.desktop) que he generado para poder personalizar el menu de inicio con los programas que se instalar en los siguientes pasos.
echo '@@@@@@@@@@ Preparacion del entorno para la personalización del menu de inicio @@@@@@@@@@'
echo
sudo mv $HOME/whOSINT/applications/* /usr/share/applications/
sudo chmod +x /usr/share/applications/exec-in-shell
# Mover los archivos de directorio (*.directory) que he generado para poder personalizar el menu de inicio.
sudo mv $HOME/whOSINT/directory/*.directory /usr/share/desktop-directories/
# Creacion de carpeta para almacenar el fichero del menu de inicio personalizado.
# Mover el archivo de menu de inicio (*.menu) que he generado para poder personalizarle.
sudo mkdir /etc/xdg/menus/applications-merged
sudo mv $HOME/whOSINT/custom_menu/*.menu /etc/xdg/menus/applications-merged/
echo
# Instalación de las herramientas de OSINT.
echo
echo '@@@@@@@@@@ Instalación de Recon-ng @@@@@@@@@@'
echo
cd /usr/share/
sudo git clone https://github.com/lanmaster53/recon-ng.git
cd recon-ng
sudo pip install -r REQUIREMENTS
sudo chmod +x /usr/bin/recon-ng
echo
echo '@@@@@@@@@@ Instalación de Dmitry @@@@@@@@@@'
echo
sudo apt-get install dmitry
echo
echo '@@@@@@@@@@ Instalación de EmailHarvester @@@@@@@@@@'
echo
sudo apt-get install dmitry
cd /usr/share/
sudo git clone https://github.com/maldevel/EmailHarvester
cd EmailHarvester/
sudo pip install -r requirements.txt
sudo chmod +x /usr/bin/EmailHarvester.py
echo
pip --version
pip2 --version
pip3 --version
function press_key() {
	echo -e "\n[.] Presiona la tecla Enter para continuar..." && read
}
echo '@@@@@@@@@@ Instalación de Image-ExifTool @@@@@@@@@@'
echo
cd /usr/share/
sudo curl https://cpan.metacpan.org/authors/id/E/EX/EXIFTOOL/Image-ExifTool-12.30.tar.gz --output Image-ExifTool-12.30.tar.gz
sudo tar -zvxf Image-ExifTool-12.30.tar.gz
sudo rm Image-ExifTool-12.30.tar.gz
echo
echo '@@@@@@@@@@ Instalación de EyeWitness 2.0 @@@@@@@@@@'
echo
cd /usr/share/
sudo git clone https://github.com/FortyNorthSecurity/EyeWitness.git
sudo apt-get install -y cmake python3 xvfb python3-pip python3-netaddr python3-dev firefox-esr
sudo python3 -m pip install fuzzywuzzy
sudo python3 -m pip install selenium --upgrade
sudo python3 -m pip install python-Levenshtein
sudo python3 -m pip install pyvirtualdisplay
sudo python3 -m pip install netaddr
sudo chmod -R 777 /usr/share/EyeWitness/
cd EyeWitness/Python/bin/
sudo wget https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz
sudo tar -xvf geckodriver-v0.30.0-linux64.tar.gz
sudo rm geckodriver-v0.30.0-linux64.tar.gz
sudo mv geckodriver /usr/sbin
sudo ln -s /usr/sbin/geckodriver /usr/bin/geckodriver
sudo chmod +x /usr/bin/EyeWitness.py
echo
echo '@@@@@@@@@@ Instalación de Infoga @@@@@@@@@@'
echo
cd /usr/share/
sudo git clone https://github.com/m4ll0k/Infoga.git infoga
cd infoga
pip3 install requests
sudo chmod +x /usr/bin/infoga.py
echo
echo '@@@@@@@@@@ Instalación de Knockpy (Knock Subdomain Scan) @@@@@@@@@@'
echo
cd /usr/share/
sudo git clone https://github.com/guelfoweb/knock.git
cd knock
sudo pip3 install -r requirements.txt
sudo chmod +x /usr/bin/knockpy
echo
pip --version
pip2 --version
pip3 --version
function press_key() {
	echo -e "\n[.] Presiona la tecla Enter para continuar..." && read
}
echo '@@@@@@@@@@ Instalación de theHarvester @@@@@@@@@@'
echo
cd /usr/share/
sudo git clone https://github.com/laramies/theHarvester
cd theHarvester
sudo python3 -m pip install -r requirements/base.txt
sudo chmod +x /usr/bin/theHarvester.py
echo
echo '@@@@@@@@@@ Instalación de Maltego @@@@@@@@@@'
echo
cd /usr/share/
sudo mkdir Maltego
cd Maltego
sudo curl https://maltego-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v4.3.0.deb --output Maltego.v4.3.0.deb
sudo dpkg -i Maltego.v4.3.0.deb
sudo apt install default-jdk -y
echo
echo '@@@@@@@@@@ Instalación de MAT2 (Metadata Anonimisation Toolkit 2) @@@@@@@@@@'
echo
cd /usr/share/
sudo git clone https://0xacab.org/jvoisin/mat2.git
cd mat2
sudo apt install -y python3-mutagen python3-gi-cairo gir1.2-poppler-0.18 gir1.2-gdkpixbuf-2.0 gir1.2-rsvg-2.0 ffmpeg libimage-exiftool-perl bubblewrap
echo
echo '@@@@@@@@@@ Instalación de MediaInfo GUI & CLI @@@@@@@@@@'
echo
sudo apt-get install mediainfo-gui -y
sudo apt-get install mediainfo -y
echo
echo '@@@@@@@@@@ Instalación de Metagoofil @@@@@@@@@@'
echo
cd /usr/share/
sudo git clone https://github.com/laramies/metagoofil.git
sudo chmod +x /usr/bin/metagoofil.py
echo
echo '@@@@@@@@@@ Instalación de Nexfil @@@@@@@@@@'
echo
cd /usr/share/
sudo git clone https://github.com/thewhiteh4t/nexfil.git
cd nexfil
sudo pip3 install -r requirements.txt
sudo chmod +x /usr/bin/nexfil.py
echo
pip --version
pip2 --version
pip3 --version
function press_key() {
	echo -e "\n[.] Presiona la tecla Enter para continuar..." && read
}
echo '@@@@@@@@@@ Instalación de Osrframework @@@@@@@@@@'
echo
cd /usr/share/
sudo pip3 install osrframework
sudo pip3 install osrframework --upgrade
sudo git clone https://github.com/i3visio/osrframework.git
cd osrframework
sudo mkdir /home/user/.config/OSRFramework
sudo mkdir /home/user/.config/OSRFramework/default
sudo chmod -R 777 /home/user/.config/OSRFramework/
sudo cp config/*.cfg /home/user/.config/OSRFramework/default/
echo
echo '@@@@@@@@@@ Instalación de Spiderfoot @@@@@@@@@@'
echo
cd /usr/share/
sudo wget https://github.com/smicallef/spiderfoot/archive/v3.5.tar.gz
sudo tar zxvf v3.5.tar.gz
sudo rm v3.5.tar.gz
cd spiderfoot-3.5
sudo pip3 install -r requirements.txt
sudo chmod +x /usr/bin/sf.py
echo
echo '@@@@@@@@@@ Instalación de Sublist3r @@@@@@@@@@'
echo
cd /usr/share/
sudo git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r/
sudo pip install -r requirements.txt
sudo chmod +x /usr/bin/sublist3r.py
echo
echo '[*] Eliminacion de referencias a aplicaciones repetidas'
sudo rm -r /usr/share/applications/maltego_java_config.desktop
sudo rm -r /usr/share/applications/maltego.desktop
sudo rm -r /usr/share/applications/firefox-esr.desktop
sudo rm -r /usr/share/applications/mediainfo-gui.desktop
sudo rm -r /usr/share/applications/monero-gui.desktop
sudo rm -r /usr/share/applications/janondisttorbrowser.desktop
sudo rm -r /usr/share/applications/org.keepassxc.KeePassXC.desktop
sudo rm -r /usr/share/applications/electrum.desktop
pip --version
pip2 --version
pip3 --version
function press_key() {
	echo -e "\n[.] Presiona la tecla Enter para finalizar..." && read
}
