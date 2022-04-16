# QUE ES whOSINT

whOSINT, es una distribución basada de sistema Whonix, pensada en analistas de OSINT y que a la vez les permita realizar su trabajo de una forma mucho más segura y privada de lo que ofrecen otras distribuciones orientadas a investigaciones OSINT.

Los principales valores para la elección de la distribución de Whonix en comparación con otras distribuciones como pueden ser la de Ubuntu/Fedora es principalmente por las funcionalidades nativas que ofrece frente a dichas distribuciones. Whonix es una distribución basada en Debian y diseñada para ofrecer privacidad y anonimato en Internet, aplicando el principio de seguridad por aislamiento, para ello, el sistema operativo se ejecuta dentro de múltiples máquinas virtuales aislando las aplicaciones, además todas sus conexiones se realizan a través de la red Tor, ofreciendo una capa de protección sustancial contra malware y posibles fugas de la dirección IP del analista.

Para completar las funcionalidades necesarias para que un analista de OSINT pueda realizar su labor de investigación, la distribución de whOSINT permite desplegar por medio del script “whOSINT_script.sh” un conjunto de herramientas, marcadores y extensiones, separadas por categorías para facilitar y agilizar el trabajo del analista.

# INSTALACIÓN

1) Descargar OVA de Whonix desde la web oficial

2) Despleagar la OVA sobre un entorno de Virtual-BOX

Una vez desplegada la OVA, hay que ejecutar los siguientes comandos desde el terminal de la VM que hace las funciones de WorkStation:
  
  3) sudo apt-get update
  
  4) sudo apt install git -y
  
  5) cd /usr/share/
	
  6) sudo git clone https://github.com/7m0re/whOSINT.git
	
  7) cd whOSINT/
	
  8) sudo chmod +x whOSINT_script.sh
	
  9) sudo chmod +x browsers-setup.sh
	
  10) ./whOSINT_script.sh
