clear
sh cabecera.sh
echo "Administrar saldo"
tput cup 4 20
echo "Presione 1 para cargar fondos"
tput cup 5 20
echo "Presione 0 para salir"
reset=5
while [ "$reset" -ne "1" ] && [ "$reset" -ne "0" ]
do
read -s -n 1 reset
case $reset in
	1) 
	clear
	sh cabecera.sh 
	echo "Ingrese el monto a agregar:"
	tput cup 4 47
	read monto
	if [ "$monto" -eq "$monto" ] 2> /dev/null 
 
	then

	nuevosaldo=$((saldo + monto))
	lineaactual=`grep $usuario usuarios | cut -d ":" -f1,2,3,4,5,6`
	
	echo `grep -v $usuario usuarios > tempusuario`
	rm usuarios
	mv tempusuario usuarios	
	echo $lineaactual":"$nuevosaldo >> usuarios
	tput cup 6 20
	echo "Saldo agregado correctamente"
	tput cup 7 25
	echo "Presione 0 para volver al menu"
	reset1=1
	while [ "$reset1" -ne "0" ]  
	do
	read -s -n 1 reset1
	case $reset1 in	
	0) sh menu.sh ;; 
	esac 
	done

		else
		clear
		sh cabecera.sh
		echo "Error: El monto debe ser numerico"
		tput cup 5 25
		echo "Presione 1 Para volver a intentar"
		tput cup 6 25
		echo "Presione 0 para salir"
		reset=1
		while [ "$reset" -ne "0" ]
		do
		read -s -n 1 reset
		case $reset in
			1) sh loginsaldo.sh ;;
			0) sh menu.sh ;;	
		esac
		done
		fi
		;;
		0)
			sh menu.sh
		;;
esac
done
