#!/bin/sh

# Limpiar Terminal
clear

# Titulo
echo '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo '@                                                                     @'
echo '@                         ┬ ┬┬ ┬╔═╗╔═╗╦╔╗╔╔╦╗                         @'
echo '@                         │││├─┤║ ║╚═╗║║║║ ║                          @'
echo '@                         └┴┘┴ ┴╚═╝╚═╝╩╝╚╝ ╩                          @'
echo '@                               by 7m0re                              @'
echo '@                                                                     @'
echo '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo

# Actualización de Whonix.
upgrade-nonroot
echo
echo '@@ Eliminación del banner de la shell @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo
cp /etc/skel/.bashrc.whonix-orig ~/.bashrc
echo
echo '@@ Instalación de los modulos de Python, Curl y Git @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo
sudo apt-get update -y
sudo apt install python -y
sudo apt install curl -y
sudo curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
sudo python2 get-pip.py
sudo apt install python3 python3-pip -y
sudo apt install git -y
echo
echo '@@ Moviendo los "Program Launcher" a /usr/bin/ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
# Mover los archivos descargados del Github (https://github.com/7m0re/whOSINT.git), basados en scripts de bash.
# Estos archivos, permiten la ejecución de los programas desde cualquier ubicación, sin necesidad de modificar el $PATH del sistema.
echo
sudo mv ~/whOSINT/program_launcher/* /usr/bin/
echo
echo '@@ Preparando el entorno para la personalización del menu de inicio @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
# Mover los archivos de aplicaciones (.desktop) que he generado para poder personalizar el menú de inicio con los programas que se instalar en los siguientes pasos.
echo
sudo mv ~/whOSINT/applications/* /usr/share/applications/
sudo chmod +x /usr/share/applications/exec-in-shell
# Mover los archivos de directorio (*.directory) que he generado para poder personalizar el menú de inicio.
sudo mv ~/whOSINT/directory/*.directory /usr/share/desktop-directories/
# Creación de carpeta para almacenar el fichero del menú de inicio personalizado.
# Mover el archivo de menú de inicio (*.menu) que he generado para poder personalizarle.
sudo mkdir /etc/xdg/menus/applications-merged
sudo mv ~/whOSINT/custom_menu/*.menu /etc/xdg/menus/applications-merged/
# Creación de carpeta para almacenar las imágenes de fondo de escritorio.
sudo mkdir /usr/share/backgrounds/whOSINT
# Modificación de la configuración de Xfce para la personalización del fondo de escritorio.
sudo mv ~/whOSINT/media/wallpaper/* /usr/share/backgrounds/whOSINT/
xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorVirtual1/workspace0/last-image --set /usr/share/backgrounds/whOSINT/Wallpaper-whOSINT.jpg
xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorVirtual1/workspace0/image-style --set 3
echo
echo '@@ INSTALANDO HERRAMIENTAS DE OSINT @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
# Instalación de las herramientas de OSINT seleccionadas.
echo
echo '@@ Instalando Recon-ng @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo
cd /usr/share/
sudo git clone https://github.com/lanmaster53/recon-ng.git
cd recon-ng
sudo pip install -r REQUIREMENTS
sudo chmod +x /usr/bin/recon-ng
echo
echo '@@ Instalando Dmitry @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo
sudo apt-get install dmitry
echo
echo '@@ Instalando EmailHarvester @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo
sudo apt-get install dmitry
cd /usr/share/
sudo git clone https://github.com/maldevel/EmailHarvester
cd EmailHarvester/
sudo pip install -r requirements.txt
sudo chmod +x /usr/bin/EmailHarvester.py
echo
echo '@@ Instalando Image-ExifTool @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo
cd /usr/share/
sudo curl https://cpan.metacpan.org/authors/id/E/EX/EXIFTOOL/Image-ExifTool-12.30.tar.gz --output Image-ExifTool-12.30.tar.gz
sudo tar -zvxf Image-ExifTool-12.30.tar.gz
sudo rm Image-ExifTool-12.30.tar.gz
echo
echo '@@ Instalando EyeWitness 2.0 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
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
echo '@@ Instalando Infoga @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo
cd /usr/share/
sudo git clone https://github.com/m4ll0k/Infoga.git infoga
cd infoga
sudo pip3 install requests
sudo chmod +x /usr/bin/infoga.py
echo
echo '@@ Instalando Knockpy (Knock Subdomain Scan) @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo
cd /usr/share/
sudo git clone https://github.com/guelfoweb/knock.git
cd knock
sudo pip3 install -r requirements.txt
sudo chmod +x /usr/bin/knockpy
echo
echo '@@ Instalando theHarvester @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo
cd /usr/share/
sudo git clone https://github.com/laramies/theHarvester
cd theHarvester
sudo python3 -m pip install -r requirements/base.txt
sudo chmod +x /usr/bin/theHarvester.py
echo
echo '@@ Instalando Maltego @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo
cd /usr/share/
sudo mkdir Maltego
cd Maltego
sudo curl https://maltego-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v4.3.0.deb --output Maltego.v4.3.0.deb
sudo dpkg -i Maltego.v4.3.0.deb
sudo apt install default-jdk -y
echo
echo '@@ Instalando MAT2 (Metadata Anonimisation Toolkit 2) @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo
cd /usr/share/
sudo git clone https://0xacab.org/jvoisin/mat2.git
cd mat2
sudo apt install -y python3-mutagen python3-gi-cairo gir1.2-poppler-0.18 gir1.2-gdkpixbuf-2.0 gir1.2-rsvg-2.0 ffmpeg libimage-exiftool-perl bubblewrap
echo
echo '@@ Instalando MediaInfo GUI & CLI @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo
sudo apt-get install mediainfo-gui -y
sudo apt-get install mediainfo -y
echo
echo '@@ Instalando Nexfil @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo
cd /usr/share/
sudo git clone https://github.com/thewhiteh4t/nexfil.git
cd nexfil
sudo pip3 install -r requirements.txt
sudo chmod +x /usr/bin/nexfil.py
echo
echo '@@ Instalando Osrframework @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
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
echo '@@ Instalando Spiderfoot @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo
cd /usr/share/
sudo wget https://github.com/smicallef/spiderfoot/archive/v3.5.tar.gz
sudo tar zxvf v3.5.tar.gz
sudo rm v3.5.tar.gz
cd spiderfoot-3.5
sudo pip3 install -r requirements.txt
sudo chmod +x /usr/bin/sf.py
echo
echo '@@ Instalando Sublist3r @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo
cd /usr/share/
sudo git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r/
sudo pip install -r requirements.txt
sudo chmod +x /usr/bin/sublist3r.py
echo
echo '@@ Instalación de LibreOffice @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
sudo apt install flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.libreoffice.LibreOffice -y
echo
echo '@@ Eliminando las referencias a aplicaciones repetidas @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
# Eliminación de los archivos de aplicación (*.desktop) que están duplicados al haber generado uno nuevo con las configuraciones necesarias.
# Dicho duplicado del archivo, se ha realizado para ubicar el acceso directo del programa dentro del menú de inicio en la categoría deseada.
sudo rm -r /usr/share/applications/maltego_java_config.desktop
sudo rm -r /usr/share/applications/maltego.desktop
sudo rm -r /usr/share/applications/firefox-esr.desktop
sudo rm -r /usr/share/applications/mediainfo-gui.desktop
sudo rm -r /usr/share/applications/monero-gui.desktop
sudo rm -r /usr/share/applications/janondisttorbrowser.desktop
sudo rm -r /usr/share/applications/org.keepassxc.KeePassXC.desktop
sudo rm -r /usr/share/applications/electrum.desktop
echo
echo '@@ Cargando Marcadores en Tor-Browser y Firefox ESR  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
# Importo el archivo de backup de los marcadores que ha sido descargado desde el Github (https://github.com/7m0re/whOSINT.git).
# Dicho archivo contiene todos los marcadores ordenados por categorias y en orden alfabetico.
sudo apt-get install sqlite3
sudo sqlite3 ~/.mozilla/firefox/*.default-esr/places.sqlite ".restore ~/whOSINT/bookmarks/OSINTbookmarks.backup"	
sudo sqlite3 ~/.tb/tor-browser/Browser/TorBrowser/Data/Browser/profile.default/places.sqlite ".restore ~/whOSINT/bookmarks/OSINTbookmarks.backup"