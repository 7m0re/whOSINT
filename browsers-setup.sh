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

# Abrir TorBrowser y Firefox ESR por primera vez, para que se gneren las carpetas de configuracion para poder cargar posteriormente los Marcadores.
echo
echo '@@ Configurando el TorBrowser y el Firefox ESR @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo
firefox &
torbrowser >/dev/null 2>&1
echo
echo '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo '@                                                                                                  @'
echo '@          CUANDO FINALICE LA CONFIGURACION AMBOS NAVEGADORES SE CERRARAN AUTOMATICAMENTE          @'
echo '@                                                                                                  @'
echo '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
echo

