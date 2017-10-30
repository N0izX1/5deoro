clear
tput cup 1 50
echo "5 de ORO"
tput cup 2 15
echo "Iniciar Sesión"
tput cup 4 15
echo "Ingrese su usuario:"
tput cup 4 35
read usuario
tput cup 5 15
echo "Ingrese su contraseña:"
tput cup 5 38
read -s contrasena

if grep --quiet $usuario usuarios
then 
	pass=`grep $usuario usuarios | cut -d ":" -f2`
	if [ "$contrasena" = "$pass" ]
	then
		saldo=`grep $usuario usuarios | cut -d":" -f7`
		export saldo=$saldo
		export usuario=$usuario	
		sh menu.sh
	else
		tput cup 7 20
		echo "Contraseña incorrecta"
		tput cup 8 20
		echo "Presione 1 para volver a intentar"
		tput cup 9 20
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
	tput cup 7 20
	echo "El usuario no existe"
	tput cup 8 20
	echo "Presione 1 para volver a intentar"
	tput cup 9 20        
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
