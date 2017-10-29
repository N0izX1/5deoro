clear
echo " 1) Apuesta Simple"
echo " 2) Apuestas multiples"
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
