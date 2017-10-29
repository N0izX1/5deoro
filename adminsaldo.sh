clear
echo "Bienvenido $usuario"
saldo=`grep $usuario usuarios | cut -d":" -f7`
echo "Su saldo es: $ $saldo"

echo "Presione 1 para cargar fondos"
echo "Presione 0 para salir"
while :
do
read -s -n 1 reset
case $reset in
	1) 
		echo "Ingrese el monto a agregar:"
		read monto
		if [ "$monto" -eq "$monto" ] 2> /dev/null 
 
		then

		nuevosaldo=$((saldo + monto))
		lineaactual=`grep $usuario usuarios | cut -d ":" -f1,2,3,4,5,6`
	
		echo `grep -v $usuario usuarios > tempusuario`
		rm usuarios
		mv tempusuario usuarios	
		echo $lineaactual":"$nuevosaldo >> usuarios
		echo "Saldo agregado correctamente"
		echo "Presione 0 para volver al menu"
		while :
		do
		read -s -n 1 reset
		case $reset in	
			0) sh menu.sh ;; 
		esac 
		done

		else

		echo "Error: El saldo ingresado debe de ser numerico"
		echo "Presione 1 Para volver a intentar..."
		echo "Presione 0 para salir"
		while :
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
