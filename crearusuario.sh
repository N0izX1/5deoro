clear
tput cup 2 1
echo "Nombre:"
tput cup 2 18
echo "Apellido:"
tput cup 3 1
echo "Usuario:"
tput cup 4 1
echo "Contraseña:"
tput cup 5 1
echo "Vuelva a introducir la contraseña:"
tput cup 6 1
echo "Edad:"
tput cup 7 1 
echo "Teléfono:"

tput cup 2 8
read nombre
tput cup 2 27
read apellido
tput cup 3 9
read usuario
tput cup 4 12
read -s contrasena
tput cup 5 35
read -s verifpass
tput cup 6 6
read edad
tput cup 7 10
read telefono

saldo=300

if [ "$contrasena" = "$verifpass" ] 
then 	
	verificacion1=1

else
	echo "Las contraseñas no coinciden"
	verificacion1=0
	echo "Presione 1 para volver a intentar"
	echo "Presione 0 para volver al menu"
	while :
	do
	read -s -r -n 1 reset
	case $reset in
    		1) sh crearusuario.sh;;
    		0) sh 5deoro.sh;;  
	esac
	done
fi
if [ "$edad" -ge "18" ]
then
	verificacion2=1

else
	echo "Los usuarios deben de ser mayores de edad"
	verificacion2=0
     	echo "Presione 1 para volver a intentar"		
	echo "Presione 0 para volver al menu"
	while :
	do
        read -r -s -n 1 reset
        case $reset in
		1) sh crearusuario.sh ;;
    		0) sh 5deoro.sh ;;
       	esac
	done

fi
if grep --quiet "$usuario" usuarios
then
	echo "El usuario ya existe"
	echo "Presione 1 para volver a intentar"          
        echo "Presione 0 para volver al menu"
	while :
	do
        read -r -s -n 1 reset
        case $reset in
    		1) sh crearusuario.sh ;;
    		0) sh 5deoro.sh ;;
        esac
	done

	verificacion3=0
else
	verificacion3=1
fi
if [ $verificacion1 -eq 1 ] && [ $verificacion2 -eq 1 ] && [ $verificacion3 -eq 1 ]
then
echo $usuario":"$contrasena":"$nombre":"$apellido":"$edad":"$telefono":"$saldo >> usuarios
echo "Usuario creado correctamente"
echo "Presione 0 para volver al menu..."
while :
do
read -s -n 1 reset
case $reset in
	0) sh 5deoro.sh ;;
esac
done
fi
