clear
sh cabecera.sh
echo "Tipo de apuesta:"
tput cup 5 20
echo " 1) Apuesta Simple"
tput cup 6 20
echo " 2) Apuestas multiples"
tput cup 7 20
echo " 0) Volver atras"
menu=4
while [ "$menu" -ne "1" ] && [ "$menu" -ne "2" ] && [ "$menu" -ne "0" ]
do
read -s -n 1 menu 
case $menu in
	1) sh apuestasimple.sh ;;
	2) sh apuestamultiple.sh ;;
	0) sh menu.sh ;;
esac
done
