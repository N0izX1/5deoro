clear
sh cabecera.sh
echo "Elija una opcion:"
tput cup 5 20
echo " 1) Administrar Saldo"
tput cup 6 20
echo " 2) Apostar"
tput cup 7 20
echo " 3) Mis Apuestas"
tput cup 8 20
echo " 4) Sorteo"
tput cup 9 20
echo " 5) Cerrar Sesión"
export usuario=$usuario
menu=0
while [ "$menu" -ne "1" ] && [ "$menu" -ne "2" ] && [ "$menu" -ne "3" ] && [ "$menu" -ne "4" ]   
do
read -s -n 1 menu
case $menu in

	1) sh adminsaldo.sh ;;

	2) sh menuapuestas.sh ;;

	3) sh misapuestas.sh ;;

	4) sh sorteo.sh  ;;
	
	5) sh 5deoro.sh ;;	
esac 
done
