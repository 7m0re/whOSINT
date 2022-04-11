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
echo
# Abrir TorBrowser y Firefox ESR por primera vez, para que se generen las carpetas de configuración para poder cargar posteriormente los Marcadores
echo
echo '[2/24] @@ Configurando el TorBrowser y el Firefox ESR @@@@@@@@@@@@@@@@@@@@@'
echo
echo
echo
echo '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo '@                                                                         @'
echo '@                  NO CIERRE NINGUNO DE LOS NAVEGADORES                   @'
echo '@   CUANDO FINALICE LA CONFIGURACION, AMBOS SE CERRARAN AUTOMATICAMENTE   @'
echo '@                                                                         @'
echo '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo
echo '         Al cerrarse el TorBrowser, mostrara el siguiente mensaje:         '
echo '         ERROR: Tor Browser ended with non-zero (error) exit code!         '
echo
echo ' Este ERROR es normal en esta fase de la configuración, presiones Aceptar. '
echo
firefox &
torbrowser >/dev/null 2>&1