clear
tput cup 1 1
echo $usuario 
tput cup 1 15
echo "Apuesta Múltiple"
tput cup 1 40 
saldo=`grep $usuario usuarios | cut -d":" -f7`
echo "Saldo: $saldo"
tput cup 3 1
echo "Tipos de apuestas múltiples:"
tput cup 4 1 
echo "1) 6 números 6 combinaciones"
tput cup 5 1
echo "2) 7 números 21 combinaciones"
tput cup 6 1 
echo "3) 8 números 56 combinaciones" 
tput cup 7 1
echo "4) 4 números 44 combinaciones" 
tput cup 8 1
echo "0) Volver al menu" 

opcion=5
while [ "$opcion" -ne "1" ] && [ "$opcion" -ne "2" ] && [ "$opcion" -ne "3" ] && [ "$opcion" -ne "4" ] && [ "$opcion" -ne "0" ] 
do
	read -s -n 1 opcion
	case $opcion in 
	1) 
	clear
	tput cup 1 1 
	echo $usuario
	tput cup 1 15
	echo "Apuesta Múltiple"
	tput cup 1 40
	echo "Saldo: $saldo"
	tput cup 3 1 
	echo "Numero 1:"
	tput cup 4 1
	echo "Numero 2:"
	tput cup 5 1
	echo "Numero 3:"
	tput cup 6 1
	echo "Numero 4:"
	tput cup 7 1
	echo "Numero 5:"
	tput cup 8 1
	echo "Numero 6:"
	tput cup 9 1
	echo "Jugar con revancha:   (S/N)" 
	tput cup 3 10
	read num1
	tput cup 4 10
	read num2
	tput cup 5 10
	read num3
	tput cup 6 10	
	read num4
	tput cup 7 10	
	read num5
	tput cup 8 10	
	read num6
	tput cup 9 20
	read revancha
	if [ "$revancha" = "S" ] || [ "$revancha" = "s" ] 
	then 
		revancha=1
		monto=180	
	else 
		revancha=0
		monto=120	
	fi
	if [ "$num1" -le "48" ] && [ "$num2" -le "48" ] && [ "$num3" -le "48" ] && [ "$num4" -le "48" ] && [ "$num5" -le "48" ] && [ "$num1" -gt "0" ] && [ "$num2" -gt "0" ] && [ "$num3" -gt "0" ] && [ "$num4" -gt "0" ] && [ "$num5" -gt "0" ] && [ "$num1" -ne "$num2" ] && [ "$num1" -ne "$num3" ] && [ "$num1" -ne "$num4" ] && [ "$num1" -ne "$num5" ] && [ "$num2" -ne "$num3" ] && [ "$num2" -ne "$num4" ] && [ "$num2" -ne "$num5" ] && [ "$num3" -ne "$num4" ] && [ "$num3" -ne "$num5" ] && [ "$num4" -ne "$num5" ] && [ "$num6" -le "48" ] && [ "$num6" -gt "0" ] && [ "$num6" -ne "$num1" ] && [ "$num6" -ne "$num2" ] && [ "$num6" -ne "$num3" ] && [ "$num6" -ne "$num4" ] && [ "$num6" -ne "$num5" ]  2> /dev/null
	then
		clear
		tput cup 1 1
		echo $usuario
		tput cup 1 15
		echo "Apuesta Múltiple"
		tput cup 1 40
		echo "Saldo: $saldo"
		tput cup 3 1
		echo "Numeros elegidos: $num1:$num2:$num3:$num4:$num5:$num6"
		tput cup 3 40 
		echo "6 combinaciones de 5 números"
		tput cup 4 1
		if [ "$revancha" -eq "1" ]
		then
			echo "Valor: $ 180"
		else 
			echo "Valor: $ 120"
		fi
		tput cup 6 1 
		echo "Para confirmar la apuesta múltiple presione 5"
		tput cup 7 1
		echo "Para volver al menú presione 0"
  		subopcion=4 
		while [ "$subopcion" -ne "5" ] && [ "$subopcion" -ne "0" ]
		do
			read -s -n 1 subopcion
			case $subopcion in
			0) sh menuapuestas.sh ;;

			5) 


				apuesta[1]=$num1
				apuesta[2]=$num2
				apuesta[3]=$num3
				apuesta[4]=$num4
				apuesta[5]=$num5
				apuesta[6]=$num6
		if [ "$saldo" -gt "$monto" ] || [ "$saldo" -eq "$monto" ]
		then
			echo "Combinaciones resultantes:"
			for (( c=i; c<6; c++ )) 
			do
				var1=$((1+RANDOM%6))
				var2=$((1+RANDOM%6))
				var3=$((1+RANDOM%6))
				var4=$((1+RANDOM%6))
				var5=$((1+RANDOM%6))

				while [ "$var1" -eq "$var2" ] || [ "$var1" -eq "$var3" ] || [ "$var1" -eq "$var4" ] || [ "$var1" -eq "$var5" ]
				do
					var1=$((1+RANDOM%6))
				done
				while [ "$var2" -eq "$var1" ] || [ "$var2" -eq "$var3" ] || [ "$var2" -eq "$var4" ] || [ "$var2" -eq "$var5" ] 
				do
					var2=$((1+RANDOM%6))
				done
				while [ "$var3" -eq "$var1" ] || [ "$var3" -eq "$var2" ] || [ "$var3" -eq "$var4" ] || [ "$var3" -eq "$var5" ] 
				do
					var3=$((1+RANDOM%6))
				done
				while [ "$var4" -eq "$var2" ] || [ "$var4" -eq "$var3" ] || [ "$var4" -eq "$var1" ] || [ "$var4" -eq "$var5" ]
				do
					var4=$((1+RANDOM%6))
				done
				while [ "$var5" -eq "$var1" ] || [ "$var5" -eq "$var2" ] || [ "$var5" -eq "$var3" ] || [ "$var5" -eq "$var4" ]
				do
					var5=$((1+RANDOM%6))
				done	
				echo ${apuesta[$var1]}":"${apuesta[$var2]}":"${apuesta[$var3]}":"${apuesta[$var4]}":"${apuesta[$var5]} 
				echo ":"${apuesta[$var1]}":"${apuesta[$var2]}":"${apuesta[$var3]}":"${apuesta[$var4]}":"${apuesta[$var5]}":"$usuario":"multiple6 >> jugadas
				if [ "$revancha" -eq "1" ]
				then 
				
				echo ":"${apuesta[$var1]}":"${apuesta[$var2]}":"${apuesta[$var3]}":"${apuesta[$var4]}":"${apuesta[$var5]}":"$usuario":" >> jugadasrevancha
					
				fi
			done
        echo "Presione 0 para volver atras."
        salir=1
        while [ "$salir" -ne "0" ]
        do
        read -s -n 1 salir
        case $salir in
        0) sh menuapuestas.sh ;;
        esac
        done
	
		else 
		echo "Saldo insuficiente."
		echo "Presione 0 para volver atras"
		volver=1
		while [	"$volver" -ne "0" ]
		do
		read -s -n 1 volver
		case $volver in
		0) sh menuapuestas.sh
		;;		
		esac
		done	
		fi
			 
			nuevosaldo=$((saldo - monto))
        		lineaactual=`grep $usuario usuarios | cut -d ":" -f1,2,3,4,5,6`

        		echo `grep -v $usuario usuarios > tempusuario`
        		rm usuarios
        		mv tempusuario usuarios
        		echo $lineaactual":"$nuevosaldo >> usuarios		

;;
esac
done
else
	echo "Hubo un error. Presione 1 para reintentar."
	echo "Presione 0 para volver al menú"
	option=5
	while [ "$option" -ne "1" ] && [ "$option" -ne "0" ]
	do
		read -s -n 1 option
		case $option in
		1) sh apuestamultiple.sh ;;
		0) sh menuapuestas.sh ;;
		esac
	done


fi

;;

2)
        clear
        tput cup 1 1
        echo $usuario
        tput cup 1 15
        echo "Apuesta Múltiple"
        tput cup 1 40
        echo "Saldo: $saldo"
        tput cup 3 1
        echo "Numero 1:"
        tput cup 4 1
        echo "Numero 2:"
        tput cup 5 1
        echo "Numero 3:"
        tput cup 6 1
        echo "Numero 4:"
        tput cup 7 1
        echo "Numero 5:"
        tput cup 8 1
        echo "Numero 6:"
	tput cup 9 1
	echo "Numero 7:"
        tput cup 10 1
        echo "Jugar con revancha:   (S/N) ( $ 630 )" 
        tput cup 3 10
        read num1
        tput cup 4 10
        read num2
        tput cup 5 10
        read num3
        tput cup 6 10
        read num4
        tput cup 7 10
        read num5
        tput cup 8 10
        read num6
	tput cup 9 10
	read num7
        tput cup 10 20
        read revancha
        if [ "$revancha" = "S" ] || [ "$revancha" = "s" ]
        then
                revancha=1
                monto=630
        else
                revancha=0
                monto=420
        fi
        if [ "$num1" -le "48" ] && [ "$num2" -le "48" ] && [ "$num3" -le "48" ] && [ "$num4" -le "48" ] && [ "$num5" -le "48" ] && [ "$num1" -gt "0" ] && [ "$num2" -gt "0" ] && [ "$num3" -gt "0" ] && [ "$num4" -gt "0" ] && [ "$num5" -gt "0" ] && [ "$num1" -ne "$num2" ] && [ "$num1" -ne "$num3" ] && [ "$num1" -ne "$num4" ] && [ "$num1" -ne "$num5" ] && [ "$num2" -ne "$num3" ] && [ "$num2" -ne "$num4" ] && [ "$num2" -ne "$num5" ] && [ "$num3" -ne "$num4" ] && [ "$num3" -ne "$num5" ] && [ "$num4" -ne "$num5" ] && [ "$num6" -le "48" ] && [ "$num6" -gt "0" ] && [ "$num6" -ne "$num1" ] && [ "$num6" -ne "$num2" ] && [ "$num6" -ne "$num3" ] && [ "$num6" -ne "$num4" ] && [ "$num6" -ne "$num5" ] && [ "$num7" -le "48" ] && [ "$num7" -gt "0" ] && [ "$num7" -ne "$num1" ] && [ "$num7" -ne "$num2" ] && [ "$num7" -ne "$num3" ] && [ "$num7" -ne "$num4" ] && [ "$num7" -ne "$num5" ] && [ "$num7" -ne "$num6" ] 2> /dev/null
        then
                clear
                tput cup 1 1
                echo $usuario
                tput cup 1 15
                echo "Apuesta Múltiple"
                tput cup 1 40
                echo "Saldo: $saldo"
                tput cup 3 1
                echo "Numeros elegidos: $num1:$num2:$num3:$num4:$num5:$num6:$num7"
                tput cup 3 40
                echo "21 combinaciones de 5 números"
                tput cup 4 1
                echo "Valor: $ $monto"
                tput cup 6 1
                echo "Para confirmar la apuesta múltiple presione 5"
                tput cup 7 1
                echo "Para volver al menú presione 0"
                subopcion=4
                while [ "$subopcion" -ne "5" ] && [ "$subopcion" -ne "0" ]
                do
                        read -s -n 1 subopcion
                        case $subopcion in
                        0) sh menuapuestas.sh ;;

                        5)
                                apuesta[1]=$num1
                                apuesta[2]=$num2
                                apuesta[3]=$num3
                                apuesta[4]=$num4
                                apuesta[5]=$num5
                                apuesta[6]=$num6
				apuesta[7]=$num7
                if [ "$saldo" -gt "$monto" ] || [ "$saldo" -eq "$monto" ]
                then
                        echo "Combinaciones resultantes:"
                        for (( c=i; c<21; c++ ))
                        do
                                var1=$((1+RANDOM%7))
                                var2=$((1+RANDOM%7))
                                var3=$((1+RANDOM%7))
                                var4=$((1+RANDOM%7))
                                var5=$((1+RANDOM%7))

                                while [ "$var1" -eq "$var2" ] || [ "$var1" -eq "$var3" ] || [ "$var1" -eq "$var4" ] || [ "$var1" -eq "$var5" ]
                                do
                                        var1=$((1+RANDOM%7))
                                done
                                while [ "$var2" -eq "$var1" ] || [ "$var2" -eq "$var3" ] || [ "$var2" -eq "$var4" ] || [ "$var2" -eq "$var5" ] 
                                do
                                        var2=$((1+RANDOM%7))
                                done
                                while [ "$var3" -eq "$var1" ] || [ "$var3" -eq "$var2" ] || [ "$var3" -eq "$var4" ] || [ "$var3" -eq "$var5" ] 
                                do
                                        var3=$((1+RANDOM%7))
                                done
                                while [ "$var4" -eq "$var2" ] || [ "$var4" -eq "$var3" ] || [ "$var4" -eq "$var1" ] || [ "$var4" -eq "$var5" ]
                                do
                                        var4=$((1+RANDOM%7))
                                done
                                while [ "$var5" -eq "$var1" ] || [ "$var5" -eq "$var2" ] || [ "$var5" -eq "$var3" ] || [ "$var5" -eq "$var4" ]
                                do
                                        var5=$((1+RANDOM%7))
                                done
                                echo ${apuesta[$var1]}":"${apuesta[$var2]}":"${apuesta[$var3]}":"${apuesta[$var4]}":"${apuesta[$var5]} 
                                echo ":"${apuesta[$var1]}":"${apuesta[$var2]}":"${apuesta[$var3]}":"${apuesta[$var4]}":"${apuesta[$var5]}":"$usuario":"multiple6 >> jugadas
                                if [ "$revancha" -eq "1" ]
                                then

                                echo ":"${apuesta[$var1]}":"${apuesta[$var2]}":"${apuesta[$var3]}":"${apuesta[$var4]}":"${apuesta[$var5]}":"$usuario":" >> jugadasrevancha

                                fi
                        done
	echo "Presione 0 para volver atras."
	salir=1
	while [ "$salir" -ne "0" ]
	do
	read -s -n 1 salir
	case $salir in
	0) sh menuapuestas.sh ;;
	esac
	done
                else
                echo "Saldo insuficiente."
                echo "Presione 0 para volver atras"
                volver=1
                while [ "$volver" -ne "0" ]
                do
                read -s -n 1 volver
                case $volver in
                0) sh menuapuestas.sh
                ;;
                esac
                done
                fi

                        nuevosaldo=$((saldo - monto))
                        lineaactual=`grep $usuario usuarios | cut -d ":" -f1,2,3,4,5,6`

                        echo `grep -v $usuario usuarios > tempusuario`
                        rm usuarios
                        mv tempusuario usuarios
                        echo $lineaactual":"$nuevosaldo >> usuarios

;;
esac
done
else
        echo "Hubo un error. Presione 1 para reintentar."
        echo "Presione 0 para volver al menú"
        option=5
        while [ "$option" -ne "1" ] && [ "$option" -ne "0" ]
        do
                read -s -n 1 option
                case $option in
                1) sh apuestamultiple.sh ;;
                0) sh menuapuestas.sh ;;
                esac
        done


fi

;;

3)
        clear
        tput cup 1 1
        echo $usuario
        tput cup 1 15
        echo "Apuesta Múltiple"
        tput cup 1 40
        echo "Saldo: $saldo"
        tput cup 3 1
        echo "Numero 1:"
        tput cup 4 1
        echo "Numero 2:"
        tput cup 5 1
        echo "Numero 3:"
        tput cup 6 1
        echo "Numero 4:"
        tput cup 7 1
        echo "Numero 5:"
        tput cup 8 1
        echo "Numero 6:"
        tput cup 9 1
        echo "Numero 7:"
	tput cup 10 1
	echo "Numero 8:"
        tput cup 11 1
        echo "Jugar con revancha:   (S/N) ( $ 630 )" 
        tput cup 3 10
        read num1
        tput cup 4 10
        read num2
        tput cup 5 10
        read num3
        tput cup 6 10
        read num4
        tput cup 7 10
        read num5
        tput cup 8 10
        read num6
        tput cup 9 10
        read num7
	tput cup 10 10
	read num8
        tput cup 11 20
        read revancha
        if [ "$revancha" = "S" ] || [ "$revancha" = "s" ]
        then
                revancha=1
                monto=1680
        else
                revancha=0
                monto=1120
        fi
        if [ "$num1" -le "48" ] && [ "$num2" -le "48" ] && [ "$num3" -le "48" ] && [ "$num4" -le "48" ] && [ "$num5" -le "48" ] && [ "$num1" -gt "0" ] && [ "$num2" -gt "0" ] && [ "$num3" -gt "0" ] && [ "$num4" -gt "0" ] && [ "$num5" -gt "0" ] && [ "$num1" -ne "$num2" ] && [ "$num1" -ne "$num3" ] && [ "$num1" -ne "$num4" ] && [ "$num1" -ne "$num5" ] && [ "$num2" -ne "$num3" ] && [ "$num2" -ne "$num4" ] && [ "$num2" -ne "$num5" ] && [ "$num3" -ne "$num4" ] && [ "$num3" -ne "$num5" ] && [ "$num4" -ne "$num5" ] && [ "$num6" -le "48" ] && [ "$num6" -gt "0" ] && [ "$num6" -ne "$num1" ] && [ "$num6" -ne "$num2" ] && [ "$num6" -ne "$num3" ] && [ "$num6" -ne "$num4" ] && [ "$num6" -ne "$num5" ] && [ "$num7" -le "48" ] && [ "$num7" -gt "0" ] && [ "$num7" -ne "$num1" ] && [ "$num7" -ne "$num2" ] && [ "$num7" -ne "$num3" ] && [ "$num7" -ne "$num4" ] && [ "$num7" -ne "$num5" ] && [ "$num7" -ne "$num6" ] && [ "$num8" -le "48" ] && [ "$num8" -gt "0" ] && [ "$num8" -ne "$num1" ] && [ "$num8" -ne "$num2" ] && [ "$num8" -ne "$num3" ] && [ "$num8" -ne "$num4" ] && [ "$num8" -ne "$num5" ] && [ "$num8" -ne "$num6" ] && [ "$num8" -ne "$num7" ] 2> /dev/null
        then
                clear
                tput cup 1 1
                echo $usuario
                tput cup 1 15
                echo "Apuesta Múltiple"
                tput cup 1 40
                echo "Saldo: $saldo"
                tput cup 3 1
                echo "Numeros elegidos: $num1:$num2:$num3:$num4:$num5:$num6:$num7:$num8"
                tput cup 3 40
                echo "56 combinaciones de 5 números"
                tput cup 4 1
                echo "Valor: $ $monto"
                tput cup 6 1
                echo "Para confirmar la apuesta múltiple presione 5"
                tput cup 7 1
                echo "Para volver al menú presione 0"
                subopcion=4
                while [ "$subopcion" -ne "5" ] && [ "$subopcion" -ne "0" ]
                do
                        read -s -n 1 subopcion
                        case $subopcion in
                        0) sh menuapuestas.sh ;;

                        5)
                                apuesta[1]=$num1
                                apuesta[2]=$num2
                                apuesta[3]=$num3
                                apuesta[4]=$num4
                                apuesta[5]=$num5
                                apuesta[6]=$num6
                                apuesta[7]=$num7
				apuesta[8]=$num8
                if [ "$saldo" -gt "$monto" ] || [ "$saldo" -eq "$monto" ]
                then
                        echo "Combinaciones resultantes:"
                        for (( c=i; c<56; c++ ))
                        do
                                var1=$((1+RANDOM%8))
                                var2=$((1+RANDOM%8))
                                var3=$((1+RANDOM%8))
                                var4=$((1+RANDOM%8))
                                var5=$((1+RANDOM%8))

                                while [ "$var1" -eq "$var2" ] || [ "$var1" -eq "$var3" ] || [ "$var1" -eq "$var4" ] || [ "$var1" -eq "$var5" ]
                                do
                                        var1=$((1+RANDOM%8))
                                done
                                while [ "$var2" -eq "$var1" ] || [ "$var2" -eq "$var3" ] || [ "$var2" -eq "$var4" ] || [ "$var2" -eq "$var5" ] 
                                do
                                        var2=$((1+RANDOM%8))
                                done
                                while [ "$var3" -eq "$var1" ] || [ "$var3" -eq "$var2" ] || [ "$var3" -eq "$var4" ] || [ "$var3" -eq "$var5" ] 
                                do
                                        var3=$((1+RANDOM%8))
                                done
                                while [ "$var4" -eq "$var2" ] || [ "$var4" -eq "$var3" ] || [ "$var4" -eq "$var1" ] || [ "$var4" -eq "$var5" ]
                                do
                                        var4=$((1+RANDOM%8))
                                done
                                while [ "$var5" -eq "$var1" ] || [ "$var5" -eq "$var2" ] || [ "$var5" -eq "$var3" ] || [ "$var5" -eq "$var4" ]
                                do
                                        var5=$((1+RANDOM%8))
                                done
                                echo ${apuesta[$var1]}":"${apuesta[$var2]}":"${apuesta[$var3]}":"${apuesta[$var4]}":"${apuesta[$var5]} 
                                echo ":"${apuesta[$var1]}":"${apuesta[$var2]}":"${apuesta[$var3]}":"${apuesta[$var4]}":"${apuesta[$var5]}":"$usuario":"multiple6 >> jugadas
                                if [ "$revancha" -eq "1" ]
                                then

                                echo ":"${apuesta[$var1]}":"${apuesta[$var2]}":"${apuesta[$var3]}":"${apuesta[$var4]}":"${apuesta[$var5]}":"$usuario":" >> jugadasrevancha

                                fi
                        done
        echo "Presione 0 para volver atras."
        salir=1
        while [ "$salir" -ne "0" ]
        do
        read -s -n 1 salir
        case $salir in
        0) sh menuapuestas.sh ;;
        esac
        done
                else
                echo "Saldo insuficiente."
                echo "Presione 0 para volver atras"
                volver=1
                while [ "$volver" -ne "0" ]
                do
                read -s -n 1 volver
                case $volver in
                0) sh menuapuestas.sh
                ;;
                esac
                done
                fi

                        nuevosaldo=$((saldo - monto))
                        lineaactual=`grep $usuario usuarios | cut -d ":" -f1,2,3,4,5,6`

                        echo `grep -v $usuario usuarios > tempusuario`
                        rm usuarios
                        mv tempusuario usuarios
                        echo $lineaactual":"$nuevosaldo >> usuarios

;;
esac
done
else
        echo "Hubo un error. Presione 1 para reintentar."
        echo "Presione 0 para volver al menú"
        option=5
        while [ "$option" -ne "1" ] && [ "$option" -ne "0" ]
        do
                read -s -n 1 option
                case $option in
                1) sh apuestamultiple.sh ;;
                0) sh menuapuestas.sh ;;
                esac
        done


fi

;;

4)

        clear
        tput cup 1 1
        echo $usuario
        tput cup 1 15
        echo "Apuesta Múltiple"
        tput cup 1 40
        echo "Saldo: $saldo"
        tput cup 3 1
        echo "Numero 1:"
        tput cup 4 1
        echo "Numero 2:"
        tput cup 5 1
        echo "Numero 3:"
        tput cup 6 1
        echo "Numero 4:"
        tput cup 7 1
        echo "Jugar con revancha:   (S/N) ( $ 1320 )" 
        tput cup 3 10
        read num1
        tput cup 4 10
        read num2
        tput cup 5 10
        read num3
        tput cup 6 10
        read num4
        tput cup 7 20
        read revancha
        if [ "$revancha" = "S" ] || [ "$revancha" = "s" ]
        then
                revancha=1
                monto=1320
        else
                revancha=0
                monto=880
        fi
        if [ "$num1" -le "48" ] && [ "$num2" -le "48" ] && [ "$num3" -le "48" ] && [ "$num4" -le "48" ] && [ "$num1" -gt "0" ] && [ "$num2" -gt "0" ] && [ "$num3" -gt "0" ] && [ "$num4" -gt "0" ] && [ "$num1" -ne "$num2" ] && [ "$num1" -ne "$num3" ] && [ "$num1" -ne "$num4" ] && [ "$num2" -ne "$num3" ] && [ "$num2" -ne "$num4" ] && [ "$num3" -ne "$num4" ]  2> /dev/null
        then
                clear
                tput cup 1 1
                echo $usuario
                tput cup 1 15
                echo "Apuesta Múltiple"
                tput cup 1 40
                echo "Saldo: $saldo"
                tput cup 3 1
                echo "Numeros elegidos: $num1:$num2:$num3:$num4:X"
                tput cup 3 40
                echo "44 combinaciones de 5 números"
                tput cup 4 1
                echo "Valor: $ $monto"
                tput cup 6 1
                echo "Para confirmar la apuesta múltiple presione 5"
                tput cup 7 1
                echo "Para volver al menú presione 0"
                subopcion=4
                while [ "$subopcion" -ne "5" ] && [ "$subopcion" -ne "0" ]
                do
                        read -s -n 1 subopcion
                        case $subopcion in
                        0) sh menuapuestas.sh ;;

                        5)
                                apuesta[1]=$num1
                                apuesta[2]=$num2
                                apuesta[3]=$num3
                                apuesta[4]=$num4
                if [ "$saldo" -gt "$monto" ] || [ "$saldo" -eq "$monto" ]
                then
                        echo "Combinaciones resultantes:"
                        for (( c=i; c<44; c++ ))
                        do
                                var1=$((1+RANDOM%4))
                                var2=$((1+RANDOM%4))
                                var3=$((1+RANDOM%4))
                                var4=$((1+RANDOM%4))

                                while [ "$var1" -eq "$var2" ] || [ "$var1" -eq "$var3" ] || [ "$var1" -eq "$var4" ]
                                do
                                        var1=$((1+RANDOM%4))
                                done
                                while [ "$var2" -eq "$var1" ] || [ "$var2" -eq "$var3" ] || [ "$var2" -eq "$var4" ] 
                                do
                                        var2=$((1+RANDOM%4))
                                done
                                while [ "$var3" -eq "$var1" ] || [ "$var3" -eq "$var2" ] || [ "$var3" -eq "$var4" ] 
                                do
                                        var3=$((1+RANDOM%4))
                                done
                                while [ "$var4" -eq "$var2" ] || [ "$var4" -eq "$var3" ] || [ "$var4" -eq "$var1" ]
                                do
                                        var4=$((1+RANDOM%4))
                                done
                          
                                echo ${apuesta[$var1]}":"${apuesta[$var2]}":"${apuesta[$var3]}":"${apuesta[$var4]}":"X 
                                echo ":"${apuesta[$var1]}":"${apuesta[$var2]}":"${apuesta[$var3]}":"${apuesta[$var4]}":"X":"$usuario":"multiple4 >> jugadas
                                if [ "$revancha" -eq "1" ]
                                then

                                echo ":"${apuesta[$var1]}":"${apuesta[$var2]}":"${apuesta[$var3]}":"${apuesta[$var4]}":"X":"$usuario >> jugadasrevancha

                                fi
                        done
        echo "Presione 0 para volver atras."
        salir=1
        while [ "$salir" -ne "0" ]
        do
        read -s -n 1 salir
        case $salir in
        0) sh menuapuestas.sh ;;
        esac
        done
                else
                echo "Saldo insuficiente."
                echo "Presione 0 para volver atras"
                volver=1
                while [ "$volver" -ne "0" ]
                do
                read -s -n 1 volver
                case $volver in
                0) sh menuapuestas.sh
                ;;
                esac
                done
                fi

                        nuevosaldo=$((saldo - monto))
                        lineaactual=`grep $usuario usuarios | cut -d ":" -f1,2,3,4,5,6`

                        echo `grep -v $usuario usuarios > tempusuario`
                        rm usuarios
                        mv tempusuario usuarios
                        echo $lineaactual":"$nuevosaldo >> usuarios

;;
esac
done
else
        echo "Hubo un error. Presione 1 para reintentar."
        echo "Presione 0 para volver al menú"
        option=5
        while [ "$option" -ne "1" ] && [ "$option" -ne "0" ]
        do
                read -s -n 1 option
                case $option in
                1) sh apuestamultiple.sh ;;
                0) sh menuapuestas.sh ;;
                esac
        done


fi

;;

0) sh menuapuestas.sh ;;
esac
done

