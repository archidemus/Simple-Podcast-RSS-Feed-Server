#!/bin/sh
 
_menu()
{
    echo "Options:"
    echo
    echo "1) Run podcast server"
    echo "2) Restart podcast server"
    echo "3) Stop podcast server"
    echo
    echo "9) Exit"
    echo
    echo -n "Option: "
}
 
_initPodcast()
{
    clear
    export FLASK_APP=rssServer.py && screen -dm flask run --host=127.0.0.1 --port=$1
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
            _initPodcast 5500
            _menu
            ;;
        2)
            _restartPodcast 5500
            _menu
            ;;
        3)
            _killByPID 5500
            _menu
            ;;
        *)
            clear
            _menu
            ;;
    esac
    read opc
done