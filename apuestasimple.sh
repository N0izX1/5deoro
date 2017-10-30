clear
sh cabecera.sh
echo "Apuesta Simple"
tput cup 4 20
echo "Ingrese 5 numeros"
tput cup 5 20
echo "Primero:"
tput cup 6 20
echo "Segundo:"
tput cup 7 20
echo "Tercero:"
tput cup 8 20
echo "Cuarto:"
tput cup 9 20
echo "Quinto:"
tput cup 5 29
read num1
tput cup 6 29
read num2
tput cup 7 29
read num3
tput cup 8 28
read num4
tput cup 9 28
read num5

if [ "$num1" -le "48" ] && [ "$num2" -le "48" ] && [ "$num3" -le "48" ] && [ "$num4" -le "48" ] && [ "$num5" -le "48" ] && [ "$num1" -gt "0" ] && [ "$num2" -gt "0" ] && [ "$num3" -gt "0" ] && [ "$num4" -gt "0" ] && [ "$num5" -gt "0" ] && [ "$num1" -ne "$num2" ] && [ "$num1" -ne "$num3" ] && [ "$num1" -ne "$num4" ] && [ "$num1" -ne "$num5" ] && [ "$num2" -ne "$num3" ] && [ "$num2" -ne "$num4" ] && [ "$num2" -ne "$num5" ] && [ "$num3" -ne "$num4" ] && [ "$num3" -ne "$num5" ] && [ "$num4" -ne "$num5" ]  2> /dev/null

then

clear
sh cabecera.sh
echo "Apuesta simple"
tput cup 6 20
echo "Su jugada es: $num1:$num2:$num3:$num4:$num5"
tput cup 6 50 
echo "Valor: $ 20"
tput cup 8 20 
echo "Si desea jugar con revancha presione 1 ($ 30)"
tput cup 9 20
echo "Para confirmar la jugada presione 5"
tput cup 10 35
echo "Para volver atras presione 0"
menu=6
while [ "$menu" -ne "5" ] && [ "$menu" -ne "0" ] && [ "$menu" -ne "1" ] 
do
read -s -n 1 menu
case $menu in
1) 
	clear
	sh cabecera.sh
	echo "Apuesta simple con revancha"
	tput cup 6 20
	echo "Su jugada es: $num1:$num2:$num3:$num4:$num5"
	tput cup 6 50
	echo "Valor: $ 30"
	tput cup 8 20
	echo "Para confirmar la jugada presione 5"
	tput cup 9 35
	echo "Para volver atras presione 0"
	opcion=3
	while [ "$opcion" -ne "0" ] && [ "$opcion" -ne "5" ] 
	do
	read -s -n 1 opcion
	case $opcion in
		5)  
	
		if [ $saldo -gt 30 ] || [ $saldo -eq 30 ]
		then
			monto=30	
			oro=`grep oro pozos | cut -d":" -f1`
			revancha=`grep revancha pozos | cut -d":" -f1`
			plata=`grep plata pozos | cut -d":" -f1`

			porcentaje=$((monto / 3))
			
			nuevooro=$((oro + porcentaje))
			nuevoplata=$((plata + porcentaje))
			nuevorevancha=$((revancha + porcentaje))
			rm pozos
			echo $nuevooro":"oro > pozos
			echo $nuevoplata":"plata >> pozos
			echo $nuevorevancha":"revancha >> pozos

			nuevosaldo=$((saldo - monto))
			lineaactual=`grep $usuario usuarios | cut -d ":" -f1,2,3,4,5,6`
			
                	echo `grep -v $usuario usuarios > tempusuario`
                	rm usuarios
                	mv tempusuario usuarios
                	echo $lineaactual":"$nuevosaldo >> usuarios
	
			echo ":"$num1":"$num2":"$num3":"$num4":"$num5":"$usuario >> jugadasrevancha
			echo ":"$num1":"$num2":"$num3":"$num4":"$num5":"$usuario":"simple >> jugadas
			tput cup 11 20
		 	echo "Apuesta realizada con exito"
			tput cup 12 50 
               		echo "Presione 0 para volver al menu"
			opcion=1
			while [ "$opcion" -ne "0" ] 
			do
                	read -s -n 1 opcion
                	case $opcion in
                	0) sh menu.sh
                	;;
                	esac
			done

		else 
			tput cup 13 20 
			echo "Saldo insuficiente"
			tput cup 14 50
                	echo "Presione 0 para volver atras"
			opcion=2
			while [ "$opcion" -ne "0" ]
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
      		monto=20
		nuevosaldo=$((saldo - monto))
		oro=`grep oro pozos | cut -d":" -f1`
               	revancha=`grep revancha pozos | cut -d":" -f1`
                plata=`grep plata pozos | cut -d":" -f1`
                porcentaje=$((monto / 2))	
                nuevooro=$((oro + porcentaje))
              	nuevoplata=$((plata + porcentaje))
                rm pozos
               	echo $nuevooro":"oro > pozos
                echo $nuevoplata":"plata >> pozos
                echo $revancha":"revancha >> pozos
	 	
		nuevosaldo=$((saldo - monto))
		lineaactual=`grep $usuario usuarios | cut -d ":" -f1,2,3,4,5,6`
		echo `grep -v $usuario usuarios > tempusuario`
                rm usuarios
                mv tempusuario usuarios
            	echo $lineaactual":"$nuevosaldo >> usuarios

                echo ":"$num1":"$num2":"$num3":"$num4":"$num5":"$usuario":"simple >> jugadas
		tput cup 10 20
        	echo "Apuesta realizada con exito"
		tput cup 11 50
		echo "Presione 0 para volver al menu"
		opcion=1
		while [ "$opcion" -ne "0" ]
		do
		read -s -n 1 opcion
		case $opcion in
		0) sh menu.sh
		;;
		esac
		done
	else
		tput cup 9 20
        	echo "Saldo insuficiente"
		tput cup 10 50
                echo "Presione 0 para volver atras"
		opcion=1
		while [ "$opcion" -ne "0" ] 
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
	tput cup 8 20
	echo "Hubo un error. Recuerde que los numeros tienen que estar entre el 1-48 y deben ser distintos entre si "
	tput cup 9 20
	echo "Presione 1 para volver a intentar"
	tput cup 10 50
	echo "Presione 0 para salir"
	opcion=4
	while [ "$opcion" -ne "1" ] && [ "$opcion" -ne "0" ]
	do
	read -s -n 1 opcion
	case $opcion in
	1) sh apuestasimple.sh ;;
	0) sh menuapuestas.sh ;;
	esac
	done 
fi
