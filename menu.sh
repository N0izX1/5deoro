clear
echo "Bienvenido $usuario"
echo " 1) Administrar Saldo"
echo " 2) Jugar"
echo " 3) Realizar sorteo"
echo " 4) Cerrar Sesión"
export usuario=$usuario
menu=0
while [ "$menu" -ne "1" ] && [ "$menu" -ne "2" ] && [ "$menu" -ne "3" ] && [ "$menu" -ne "4" ]   
do
read -s -n 1 menu
case $menu in

	1) sh adminsaldo.sh ;;

	2) sh menuapuestas.sh ;;

	3) sh sorteo.sh ;;

	4) sh 5deoro.sh  ;;
esac 
done
