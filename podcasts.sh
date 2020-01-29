#!/bin/sh
 
_menu()
{
    echo "Selecciona una opcion:"
    echo
    echo "1) Iniciar podcasts"
    echo "2) Reiniciar podcasts"
    echo "3) Apagar podcasts"
    echo
    echo "9) Salir"
    echo
    echo -n "Indica una opcion: "
}
 
_initPodcast()
{
    clear
    export FLASK_APP=rssServer.py && screen -dm flask run --host=0.0.0.0 --port=$1
}

_killByPID()
{
    clear
    kill -9 `lsof -t -i:$1`
}

_restartPodcast()
{
    clear
    _killByPID $1
    _initPodcast $1
}
 
opc="0"

until [ "$opc" -eq "9" ];
do
    case $opc in
        1)
            _initPodcast 5000
            _menu
            ;;
        2)
            _restartPodcast 5000
            _menu
            ;;
        3)
            _killByPID 5000
            _menu
            ;;
        *)
            # Esta opcion se ejecuta si no es ninguna de las anteriores
            clear
            _menu
            ;;
    esac
    read opc
done