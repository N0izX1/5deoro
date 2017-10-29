clear
tput cup 1 1
echo "Ingrese su usuario:"
tput cup 1 21
read usuario
tput cup 2 1
echo "Ingrese su contraseña:"
tput cup 2 23
read -s contrasena

if grep --quiet $usuario usuarios
then 
	pass=`grep $usuario usuarios | cut -d ":" -f2`
	if [ "$contrasena" = "$pass" ]
	then
		export usuario=$usuario	
		sh menu.sh
	else
		tput cup 3 1
		echo "Contraseña incorrecta"
		echo "Presione 1 para volver a intentar"
		echo "Presione 0 para salir"
		reset=2
		while [ "$reset" -ne "1" ] && [ "$reset" -ne "0" ] 
		do
		read -s -n 1 reset
		case $reset in
		
			1) sh login.sh ;;
			0) sh 5deoro.sh ;;
		esac
		done
	fi   

else
	tput cup 3 1
	echo "El usuario no existe"
	echo "Presione 1 para volver a intentar"
        echo "Presione 0 para salir"
	reset=3
	while [ "$reset" -ne "1" ] && [ "$reset" -ne "0" ] 
	do
       	read -s -n 1 reset
        case $reset in

		1) sh login.sh ;;
		0) sh 5deoro.sh ;;
       	esac
	done
fi
