clear

saldo=`grep $usuario usuarios | cut -d":" -f7`
tput cup 1 35
echo "Usuario: $usuario"
tput cup 2 35
echo "Saldo: $saldo"
tput cup 1 1
echo "Ingrese 5 numeros"
tput cup 2 1
echo "Primero:"
tput cup 3 1
echo "Segundo:"
tput cup 4 1
echo "Tercero:"
tput cup 5 1
echo "Cuarto:"
tput cup 6 1
echo "Quinto:"
tput cup 2 9
read num1
tput cup 3 9
read num2
tput cup 4 9
read num3
tput cup 5 8
read num4
tput cup 6 8
read num5

if [ "$num1" -le "48" ] && [ "$num2" -le "48" ] && [ "$num3" -le "48" ] && [ "$num4" -le "48" ] && [ "$num5" -le "48" ] && [ "$num1" -gt "0" ] && [ "$num2" -gt "0" ] && [ "$num3" -gt "0" ] && [ "$num4" -gt "0" ] && [ "$num5" -gt "0" ] && [ "$num1" -ne "$num2" ] && [ "$num1" -ne "$num3" ] && [ "$num1" -ne "$num4" ] && [ "$num1" -ne "$num5" ] && [ "$num2" -ne "$num3" ] && [ "$num2" -ne "$num4" ] && [ "$num2" -ne "$num5" ] && [ "$num3" -ne "$num4" ] && [ "$num3" -ne "$num5" ] && [ "$num4" -ne "$num5" ]  2> /dev/null

then

clear
tput cup 1 35 
echo "Usuario: $usuario"
tput cup 2 1
echo "Su jugada es: $num1:$num2:$num3:$num4:$num5"
tput cup 2 35
echo "Valor: $ 20"
tput cup 3 1 
echo "Si desea jugar con revancha presione 1 (+ $ 10)"
tput cup 4 1
echo "Para confirmar la jugada presione 5"
tput cup 5 1
echo "Para volver atras presione 0"
while :
do
read -s -n 1 menu
case $menu in
1) 
	clear
	tput cup 1 1
	echo "Usuario: $usuario"
	tput cup 2 1
	echo "Su jugada es: $num1:$num2:$num3:$num4:$num5"
	tput cup 2 35
	echo "Valor: $ 30"
	tput cup 3 1
	echo "Para confirmar la jugada presione 5"
	tput cup 4 1
	echo "Para volver atras presione 0"
	while :
	do
	read -s -n 1 opcion
	case $opcion in
		5)  
	
		if [ $saldo -gt 30 ] || [ $saldo -eq 30 ]
		then
			nuevosaldo=$((saldo - monto))
			lineaactual=`grep $usuario usuarios | cut -d ":" -f1,2,3,4,5,6`

                	echo `grep -v $usuario usuarios > tempusuario`
                	rm usuarios
                	mv tempusuario usuarios
                	echo $lineaactual":"$nuevosaldo >> usuarios
	
			echo ":"$num1":"$num2":"$num3":"$num4":"$num5":"$usuario >> jugadasrevancha
			echo ":"$num1":"$num2":"$num3":"$num4":"$num5":"$usuario >> jugadas
		 	echo "Apuesta realizada con exito"
               		echo "Presione 0 para volver al menu"
			while :
			do
                	read -s -n 1 opcion
                	case $opcion in
                	0) sh menu.sh
                	;;
                	esac
			done

		else 
			
			echo "Saldo insuficiente"
                	echo "Presione 0 para volver atras"
			while :
			do
                	read -s -n 1 opcion
                	case $opcion in
                        0) sh menuapuestas.sh
                        ;;
                	esac
			done
		fi
		;;
		0) sh menuapuestas.sh
		;;
	esac
	done
;;
5)

       	if [ $saldo -gt 20 ] || [ $saldo -eq 20 ]
	then
      		nuevosaldo=$((saldo - monto))
                lineaactual=`grep $usuario usuarios | cut -d ":" -f1,2,3,4,5,6`

               	echo `grep -v $usuario usuarios > tempusuario`
                rm usuarios
                mv tempusuario usuarios
            	echo $lineaactual":"$nuevosaldo >> usuarios

                echo ":"$num1":"$num2":"$num3":"$num4":"$num5":"$usuario >> jugadas
        	echo "Apuesta realizada con exito"
		echo "Presione 0 para volver al menu"
		while :
		do
		read -s -n 1 opcion
		case $opcion in
		0) sh menu.sh
		;;
		esac
		done
	else
        	echo "Saldo insuficiente"
                echo "Presione 0 para volver atras"
		while :
		do
		read -s -n 1 opcion
		case $opcion in
			0) sh menuapuestas.sh 
       			;;
		esac
		done
	fi
;;
0)
sh menuapuestas.sh
esac
done
else
	echo "Hubo un error. Recuerde que los numeros tienen que estar entre el 1-48 y deben ser distintos entre si "
	echo "Presione 1 para volver a intentar"
	echo "Presione 0 para salir"
	while : 
	do
	read -s -n 1 opcion
	case $opcion in
	1) sh apuestasimple.sh ;;
	0) sh menuapuestas.sh ;;
	esac
	done 
fi
